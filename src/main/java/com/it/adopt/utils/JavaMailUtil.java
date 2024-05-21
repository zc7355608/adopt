package com.it.adopt.utils;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.Date;
import java.util.Properties;

/**
 * ClassName: JavaMailUtil
 * Package: com.it.adopt.utils
 * Description: 发送邮件工具类
 *
 * @Author: ZC
 * @Create: 2024/5/15 11:26
 * @Version: 1.0.0
 */
public class JavaMailUtil {
    public static boolean sendMail(String address, String msg) {
        //设置邮件服务器的相关配置
        Properties prop = new Properties();
        prop.setProperty("mail.smtp.host", "smtp.qq.com");
        prop.setProperty("mail.smtp.post", "25");
        //设置邮箱服务器是否需要认证，true需要认证
        prop.setProperty("mail.smtp.auth", "true");

        try{
            //发送邮件
            //1、创建session对象，加载邮件服务器配置
            Session session = Session.getInstance(prop);
            //开启session对象的debug设置，这样可以查看邮件的发送状态（可有可无）
            session.setDebug(true);
            //2、通过session对象拿到传输对象
            Transport transport = session.getTransport();
            //3、用传输对象连接邮件服务器，密码是IMAP授权码
            transport.connect("smtp.qq.com", "2273705254@qq.com", "mextwgqphtlseaeb");
            //4、设置邮件
            Message message = createTextMail(session, address, msg);
            //5、发送邮件。第2个参数是所有接收者
            transport.sendMessage(message, message.getAllRecipients());
            //6、关闭
            transport.close();
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 创建普通文本邮件对象
     * @param session
     * @return
     */
    private static Message createTextMail(Session session, String address, String msg) throws MessagingException {
        //创建MiME类型的邮件对象
        MimeMessage message = new MimeMessage(session);
        //设置邮件发送者
        message.setFrom("2273705254@qq.com");
        //设置接收者（可以多个）。第1个参数是设置接收者类型，TO是发送，CC是抄送，BCC是密送；第2个参数设置接收地址（可以是同一个账户）
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(address));
        //设置发送日期，默认当前日期
        message.setSentDate(new Date(System.currentTimeMillis()));
        //设置邮件主题
        message.setSubject("汪汪喵宠物领养");
        message.setText(msg);

        return message;
    }
}