package org.sang.controller.personnel;



import org.sang.bean.Adjustsalary;
import org.sang.bean.Employeetrain;
import org.sang.bean.RespBean;
import org.sang.service.personnel.AdjustsalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xianfuhao on 2019/12/20.
 */
@RestController
@RequestMapping("/personnel")
public class AdjustsalaryController {
    @Autowired
    AdjustsalaryService adjustsalaryService;

    @RequestMapping(value = "/adjustsalary", method = RequestMethod.GET)
    public Map<String, Object> Adjustsalarys(@RequestParam(defaultValue = "1") Integer page,
                                             @RequestParam(defaultValue = "") String keywords,
                                             @RequestParam(defaultValue = "10") Integer size) {
//        List<Adjustsalary> list = adjustsalaryService.getAllAdjustsalary();

//        return list;
        Map<String, Object> map = new HashMap<>();
        List<Adjustsalary> list = adjustsalaryService.getAllAdjustsalary(keywords,page,size);
        Long count = adjustsalaryService.getCountByKeywords(keywords,page,size);
        map.put("adjustsalaryList", list);
        map.put("count", count);
        return map;
    }

    @RequestMapping(value = "/adjustsalary", method = RequestMethod.PUT)
    public RespBean updateAdjustsalary(Adjustsalary adjustsalary) {
        if (adjustsalaryService.updateAdjustsalary(adjustsalary) == 1) {
            return RespBean.ok("更新成功!");
        }
        return RespBean.error("更新失败!");
    }

    @RequestMapping(value = "/adjustsalary", method = RequestMethod.POST)
    public RespBean addAdjustsalary(Adjustsalary adjustsalary) {
        if (adjustsalaryService.addAdjustsalary(adjustsalary) == 1) {
            return RespBean.ok("添加成功!");
        }
        return RespBean.error("添加失败!");
    }

    @RequestMapping(value = "/adjustsalary/{ids}", method = RequestMethod.DELETE)
    public RespBean deleteAdjustsalary(@PathVariable String ids) throws Exception{
        if (adjustsalaryService.deleteAdjustsalary(ids) > 0) {
            return RespBean.ok("删除成功!");
        }
        return RespBean.error("删除失败!");
    }



}
