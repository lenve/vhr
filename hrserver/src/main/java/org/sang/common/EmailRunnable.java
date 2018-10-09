package org.sang.common;

import org.sang.bean.Employee;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.messaging.MessagingException;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import javax.mail.internet.MimeMessage;

/**
 * Created by sang on 2017/9/20.
 */
public class EmailRunnable implements Runnable {
    private Employee employee;
    private JavaMailSender javaMailSender;
    private TemplateEngine templateEngine;

    public EmailRunnable(Employee employee,
                         JavaMailSender javaMailSender,
                         TemplateEngine templateEngine) {
        this.employee = employee;
        this.javaMailSender = javaMailSender;
        this.templateEngine = templateEngine;
    }
    @Override
    public void run() {
        try {
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(employee.getEmail());
            helper.setFrom("1510161612@qq.com");
            helper.setSubject("XXX集团：通知");
            Context ctx = new Context();
            ctx.setVariable("name", employee.getName());
            ctx.setVariable("workID", employee.getWorkID());
            ctx.setVariable("contractTerm", employee.getContractTerm());
            ctx.setVariable("beginContract", employee.getBeginContract());
            ctx.setVariable("endContract", employee.getEndContract());
            ctx.setVariable("departmentName", employee.getDepartmentName());
            ctx.setVariable("posName", employee.getPosName());
            String mail = templateEngine.process("email.html", ctx);
            helper.setText(mail, true);
            javaMailSender.send(message);
        } catch (MessagingException e) {
            System.out.println("发送失败");
        } catch (javax.mail.MessagingException e) {
            e.printStackTrace();
        }
    }
}
