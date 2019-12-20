package org.sang.controller.emp;


import org.sang.bean.Employeeec;
import org.sang.bean.Salary;
import org.sang.service.EmpAwardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xianfuhao on 2019/12/20.
 */
@RestController
@RequestMapping("/employee/award")
public class EmpAwardController {
    @Autowired
    EmpAwardService empAwardService;

    @RequestMapping(value = "/ec", method = RequestMethod.GET)
    public List<Employeeec> Awards() {
        List<Employeeec> list = empAwardService.getAllAward();
        return list;
    }
}
