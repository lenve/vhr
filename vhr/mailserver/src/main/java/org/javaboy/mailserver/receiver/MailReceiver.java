package org.javaboy.mailserver.receiver;

import com.rabbitmq.client.Channel;
import org.javaboy.vhr.model.Employee;
import org.javaboy.vhr.model.MailConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.support.AmqpHeaders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.mail.autoconfigure.MailProperties;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageHeaders;
import org.springframework.stereotype.Component;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Date;

/**
 * 邮件消费者：监听入职员工消息并发送欢迎邮件，
 * 借助 Redis 实现消费去重，保证消息不重复投递。
 *
 * @作者 江南一点雨
 * @公众号 江南一点雨
 * @微信号 a_java_boy
 * @GitHub https://github.com/lenve
 * @博客 http://wangsong.blog.csdn.net
 * @网站 http://www.javaboy.org
 * @时间 2019-11-24 7:59
 */
@Component
public class MailReceiver {

    private static final Logger logger = LoggerFactory.getLogger(MailReceiver.class);
    /**
     * Spring AMQP 自动回填的消息关联 id 消息头名称
     */
    private static final String CORRELATION_ID_HEADER = "spring_returned_message_correlation";
    /**
     * 欢迎邮件主题
     */
    private static final String WELCOME_MAIL_SUBJECT = "入职欢迎";
    /**
     * 邮件模板名称
     */
    private static final String MAIL_TEMPLATE_NAME = "mail";
    /**
     * 消费去重记录写入 Redis 的 value 标识
     */
    private static final String MAIL_LOG_VALUE = "javaboy";

    @Autowired
    JavaMailSender javaMailSender;
    @Autowired
    MailProperties mailProperties;
    @Autowired
    TemplateEngine templateEngine;
    @Autowired
    StringRedisTemplate redisTemplate;

    @RabbitListener(queues = MailConstants.MAIL_QUEUE_NAME)
    public void handler(Message message, Channel channel) throws IOException {
        Employee employee = (Employee) message.getPayload();
        MessageHeaders headers = message.getHeaders();
        Long tag = (Long) headers.get(AmqpHeaders.DELIVERY_TAG);
        String msgId = (String) headers.get(CORRELATION_ID_HEADER);
        if (redisTemplate.opsForHash().entries(MailConstants.MAIL_REDIS_KEY).containsKey(msgId)) {
            //redis 中包含该 key，说明该消息已经被消费过
            logger.info("{}:消息已经被消费", msgId);
            channel.basicAck(tag, false);//确认消息已消费
            return;
        }
        //收到消息，发送邮件
        MimeMessage msg = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(msg);
        try {
            helper.setTo(employee.getEmail());
            helper.setFrom(mailProperties.getUsername());
            helper.setSubject(WELCOME_MAIL_SUBJECT);
            helper.setSentDate(new Date());
            Context context = new Context();
            context.setVariable("name", employee.getName());
            context.setVariable("posName", employee.getPosition().getName());
            context.setVariable("joblevelName", employee.getJobLevel().getName());
            context.setVariable("departmentName", employee.getDepartment().getName());
            String mail = templateEngine.process(MAIL_TEMPLATE_NAME, context);
            helper.setText(mail, true);
            javaMailSender.send(msg);
            redisTemplate.opsForHash().put(MailConstants.MAIL_REDIS_KEY, msgId, MAIL_LOG_VALUE);
            channel.basicAck(tag, false);
            logger.info("{}:邮件发送成功", msgId);
        } catch (MessagingException e) {
            channel.basicNack(tag, false, true);
            logger.error("邮件发送失败，msgId: {}", msgId, e);
        }
    }
}
