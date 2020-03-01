package org.javaboy.vhr.controller;

import org.javaboy.vhr.model.Hr;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @作者 江南一点雨
 * @公众号 江南一点雨
 * @微信号 a_java_boy
 * @GitHub https://github.com/lenve
 * @博客 http://wangsong.blog.csdn.net
 * @网站 http://www.javaboy.org
 * @时间 2020-03-01 13:07
 */
@RestController
public class HrInfoController {

    @GetMapping("/hr/info")
    public Hr getCurrentHr(Authentication authentication) {
        return ((Hr) authentication.getPrincipal());
    }
}
