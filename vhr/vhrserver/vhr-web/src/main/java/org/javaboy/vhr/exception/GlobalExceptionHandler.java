package org.javaboy.vhr.exception;

import org.javaboy.vhr.model.RespBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

/**
 * @作者 江南一点雨
 * @公众号 江南一点雨
 * @微信号 a_java_boy
 * @GitHub https://github.com/lenve
 * @博客 http://wangsong.blog.csdn.net
 * @网站 http://www.javaboy.org
 * @时间 2019-10-01 16:53
 */
@RestControllerAdvice
public class GlobalExceptionHandler {
    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(SQLIntegrityConstraintViolationException.class)
    public RespBean sqlIntegrityConstraintViolationException(SQLIntegrityConstraintViolationException e) {
        logger.error("数据库唯一性约束冲突", e);
        return RespBean.error("该数据有关联数据，操作失败!");
    }

    @ExceptionHandler(SQLException.class)
    public RespBean sqlException(SQLException e) {
        logger.error("数据库访问异常", e);
        return RespBean.error("数据库异常，操作失败!");
    }
}
