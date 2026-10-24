package org.javaboy.vhr.model;

import java.io.Serializable;

/**
 * @作者 江南一点雨
 * @公众号 江南一点雨
 * @微信号 a_java_boy
 * @GitHub https://github.com/lenve
 * @博客 http://wangsong.blog.csdn.net
 * @网站 http://www.javaboy.org
 * @时间 2019-09-27 7:07
 */
public class Meta implements Serializable {

    /**
     * 序列化版本号（阿里巴巴Java开发规范【强制】要求显式声明）
     */
    private static final long serialVersionUID = 1L;

    private Boolean keepAlive;

    private Boolean requireAuth;

    public Boolean getKeepAlive() {
        return keepAlive;
    }

    public void setKeepAlive(Boolean keepAlive) {
        this.keepAlive = keepAlive;
    }

    public Boolean getRequireAuth() {
        return requireAuth;
    }

    public void setRequireAuth(Boolean requireAuth) {
        this.requireAuth = requireAuth;
    }

    @Override
    public String toString() {
        return "Meta{" +
                "keepAlive=" + keepAlive +
                "requireAuth=" + requireAuth +
                '}';
    }
}
