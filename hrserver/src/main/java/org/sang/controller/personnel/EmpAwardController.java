package org.sang.controller.personnel;


import org.sang.bean.*;
import org.sang.service.personnel.EmpAwardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
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
@RequestMapping("/personnel/award")
public class EmpAwardController {
    @Autowired
    EmpAwardService empAwardService;

    @RequestMapping(value = "/ec", method = RequestMethod.GET)
    public List<Employeeec> Awards() {
        List<Employeeec> list = empAwardService.getAllAward();
        return list;
    }

    @RequestMapping(value = "/ec", method = RequestMethod.PUT)
    public RespBean updateEc(Employeeec employeeec) {
        if (empAwardService.updateEc(employeeec) == 1) {
            return RespBean.ok("更新成功!");
        }
        return RespBean.error("更新失败!");
    }

    @RequestMapping(value = "/ec", method = RequestMethod.POST)
    public RespBean addEc(Employeeec employeeec) {
        if (empAwardService.addEc(employeeec) == 1) {
            return RespBean.ok("添加成功!");
        }
        return RespBean.error("添加失败!");
    }

    @RequestMapping(value = "/ec/{ids}", method = RequestMethod.DELETE)
    public RespBean deleteEc(@PathVariable String ids) throws Exception{
        if (empAwardService.deleteEc(ids) > 0) {
            return RespBean.ok("删除成功!");
        }
        return RespBean.error("删除失败!");
    }


    @RequestMapping(value = "/emps", method = RequestMethod.GET)
    public Map<String, Object> getAllEmps() {
        Map<String, Object> map = new HashMap<>();
        map.put("emps", empAwardService.getAllEmps());

        return map;
    }
}
