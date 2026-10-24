package org.javaboy.vhr.task;

import org.javaboy.vhr.model.Employee;
import org.javaboy.vhr.model.MailConstants;
import org.javaboy.vhr.model.MailSendLog;
import org.javaboy.vhr.service.EmployeeService;
import org.javaboy.vhr.service.MailSendLogService;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;

/**
 * 邮件补偿任务：定时扫描投递中的消息，
 * 未超过最大重试次数的重新发送，超限的标记为投递失败。
 *
 * @作者 江南一点雨
 * @公众号 江南一点雨
 */
@Component
public class MailSendTask {
    @Autowired
    MailSendLogService mailSendLogService;
    @Autowired
    RabbitTemplate rabbitTemplate;
    @Autowired
    EmployeeService employeeService;

    @Scheduled(cron = "0/10 * * * * ?")
    public void mailResendTask() {
        List<MailSendLog> logs = mailSendLogService.getMailSendLogsByStatus();
        if (CollectionUtils.isEmpty(logs)) {
            return;
        }
        logs.forEach(mailSendLog -> {
            if (mailSendLog.getCount() >= MailConstants.MAX_TRY_COUNT) {
                //超过最大重试次数，直接标记为投递失败
                mailSendLogService.updateMailSendLogStatus(mailSendLog.getMsgId(), MailConstants.FAILURE);
            } else {
                mailSendLogService.updateCount(mailSendLog.getMsgId(), new Date());
                Employee emp = employeeService.getEmployeeById(mailSendLog.getEmpId());
                rabbitTemplate.convertAndSend(MailConstants.MAIL_EXCHANGE_NAME, MailConstants.MAIL_ROUTING_KEY_NAME,
                        emp, new CorrelationData(mailSendLog.getMsgId()));
            }
        });
    }
}
