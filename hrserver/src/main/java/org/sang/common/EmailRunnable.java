package org.sang.common;

import freemarker.core.ParseException;
import freemarker.template.*;
import org.sang.bean.Employee;

import javax.mail.*;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Properties;

/**
 * Created by sang on 2017/9/20.
 */
public class EmailRunnable implements Runnable {

    private Employee employee;

    public EmailRunnable(Employee employee) {
        this.employee = employee;
    }

    @Override
    public void run() {
        try {
            Properties properties = new Properties();
            properties.setProperty("mail.host", "smtp.qq.com");
            properties.setProperty("mail.transport.protocol", "smtp");
            properties.setProperty("mail.smtp.auth", "true");
            properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            properties.setProperty("mail.smtp.port", "465");
            Session session = Session.getDefaultInstance(properties);
            session.setDebug(true);
            Transport transport = session.getTransport();
            transport.connect("smtp.qq.com", "1510161612@qq.com", "授权码");
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.addRecipients(Message.RecipientType.TO, employee.getEmail());
            mimeMessage.setFrom("1510161612@qq.com");
            mimeMessage.setSubject("XXX集团：通知");
            MimeMultipart mixed = new MimeMultipart("mixed");
            mimeMessage.setContent(mixed);
            MimeBodyPart content = new MimeBodyPart();
            mixed.addBodyPart(content);
            MimeMultipart bodyMimeMultipart = new MimeMultipart("related");
            content.setContent(bodyMimeMultipart);
            MimeBodyPart bodyPart = new MimeBodyPart();
            //freemarker加载邮件模板
            Configuration cfg = new Configuration(Configuration.VERSION_2_3_27);
            cfg.setClassLoaderForTemplateLoading(ClassLoader.getSystemClassLoader(),"ftl");
            Template emailTemplate = cfg.getTemplate("email.ftl");
            StringWriter out = new StringWriter();
            emailTemplate.process(employee,out);
            bodyPart.setContent(out.toString(),"text/html;charset=utf-8");
            bodyMimeMultipart.addBodyPart(bodyPart);
            mimeMessage.saveChanges();
            transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
            transport.close();
        } catch (NoSuchProviderException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (MalformedTemplateNameException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (TemplateNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }
    }
}
