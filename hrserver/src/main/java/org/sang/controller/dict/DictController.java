package org.sang.controller.dict;

import org.sang.bean.Employeeec;
import org.sang.bean.HrDict;
import org.sang.service.dict.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 处理字典表逻辑
 */
@RestController
@RequestMapping("/dict")
public class DictController {

    @Autowired
    DictService dictService;

    /**
     * 根据字典描述获取字典对象
     * @param desc
     * @return
     */
    @RequestMapping(value = "/getDictByDesc", method = RequestMethod.GET)
    public List<HrDict> getDictByDesc(String desc) {

        try {
            List<HrDict> list = dictService.getDictByDesc(desc);
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 根据字典描述获取字典对象
     * @return
     */
    @RequestMapping(value = "/getAllDict", method = RequestMethod.GET)
    public List<HrDict> getAllDict() {

        try {
            List<HrDict> list = dictService.getAllDict();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


}
