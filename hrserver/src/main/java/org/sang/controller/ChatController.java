package org.sang.controller;

import org.sang.bean.Hr;
import org.sang.service.HrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 处理通知消息的Controller
 * 登录即可访问
 */
@RestController
@RequestMapping("/chat")
public class ChatController {
    @Autowired
    HrService hrService;
    @RequestMapping(value = "/hrs",method = RequestMethod.GET)
    public List<Hr> getAllHr() {
        return hrService.getAllHr();
    }
}
