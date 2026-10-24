package org.javaboy.vhr.converter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

/**
 * @作者 江南一点雨
 * @公众号 江南一点雨
 * @微信号 a_java_boy
 * @GitHub https://github.com/lenve
 * @博客 http://wangsong.blog.csdn.net
 * @网站 http://www.javaboy.org
 * @时间 2019-11-20 8:08
 */
@Component
public class DateConverter implements Converter<String, Date> {
    private static final Logger logger = LoggerFactory.getLogger(DateConverter.class);

    @Override
    public Date convert(String source) {
        try {
            //DateTimeFormatter 线程安全，可放心在单例 Converter 中复用
            return Date.from(LocalDate.parse(source).atStartOfDay(ZoneId.systemDefault()).toInstant());
        } catch (RuntimeException e) {
            logger.error("日期参数解析失败: {}", source, e);
            return null;
        }
    }
}
