package org.javaboy.vhr.model;

/**
 * 邮件模块相关常量
 *
 * @作者 江南一点雨
 * @公众号 江南一点雨
 */
public class MailConstants {
    /**
     * 消息状态：投递中
     */
    public static final int DELIVERING = 0;
    /**
     * 消息状态：投递成功
     */
    public static final int SUCCESS = 1;
    /**
     * 消息状态：投递失败
     */
    public static final int FAILURE = 2;
    /**
     * 消息最大重试次数
     */
    public static final int MAX_TRY_COUNT = 3;
    /**
     * 消息超时时间（分钟）
     */
    public static final int MSG_TIMEOUT = 1;
    /**
     * 一分钟的毫秒数
     */
    public static final long ONE_MINUTE_IN_MILLIS = 60 * 1000L;
    public static final String MAIL_QUEUE_NAME = "javaboy.mail.queue";
    public static final String MAIL_EXCHANGE_NAME = "javaboy.mail.exchange";
    public static final String MAIL_ROUTING_KEY_NAME = "javaboy.mail.routing.key";
    /**
     * 邮件消费去重记录在 Redis 中的 key
     */
    public static final String MAIL_REDIS_KEY = "mail_log";
}
