package org.sang.controller.personnel;


import org.sang.bean.*;
import org.sang.common.poi.PoiUtils;
import org.sang.service.dict.DictService;
import org.sang.service.personnel.EmpAwardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
    @Autowired
    DictService dictService;

    @RequestMapping(value = "/ec", method = RequestMethod.GET)
    public Map<String, Object> Awards(@RequestParam(defaultValue = "1") Integer page,
                                   @RequestParam(defaultValue = "") String keywords,
                                   @RequestParam(defaultValue = "10") Integer size) {

        Map<String, Object> map = new HashMap<>();

            List<Employeeec> list = empAwardService.getAllAward(keywords,page,size);
            Long count = empAwardService.getCountByKeywords(keywords,page,size);
            map.put("awardsList", list);
            map.put("count", count);
        return map;
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

    /**
     * 导出奖惩数据
     * @return
     */
    @RequestMapping(value = "/exportAward", method = RequestMethod.GET)
    public ResponseEntity<byte[]> exportEmp() {
        return PoiUtils.exportEmpEc2Excel(empAwardService.getAllEc());
    }

    /**
     * 导入奖惩数据
     */
    @RequestMapping(value = "/importAward", method = RequestMethod.POST)
    public RespBean importEmp(MultipartFile file) {
        List<Employeeec> awards = PoiUtils.importAward2List(file,
                    empAwardService.getAllEmps(),
                    dictService.getDictByDesc("奖罚类型"));
        if (empAwardService.addAwards(awards) == awards.size()) {
            return RespBean.ok("导入成功!");
        }
        return RespBean.error("导入失败!");
    }

}
