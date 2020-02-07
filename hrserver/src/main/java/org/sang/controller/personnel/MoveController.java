package org.sang.controller.personnel;



import org.sang.bean.*;
import org.sang.service.DepartmentService;
import org.sang.service.PositionService;
import org.sang.service.personnel.MoveService;
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
public class MoveController {
    @Autowired
    MoveService moveService;

    @Autowired
    DepartmentService departmentService;
    @Autowired
    PositionService positionService;
    /**
     * 职位
     * @return
     */
    @RequestMapping(value = "/jobs", method = RequestMethod.GET)
    public List<Position> jobs() {
        List<Position> list = positionService.getAllPos();
        return list;
    }

    /**
     * 部门
     * @return
     */
    @RequestMapping(value = "/deps", method = RequestMethod.GET)
    public List<Department> deps() {
        List<Department> list = departmentService.getAllDeps();
        return list;
    }


    @RequestMapping(value = "/move", method = RequestMethod.GET)
    public  Map<String, Object> moves(@RequestParam(defaultValue = "1") Integer page,
                                        @RequestParam(defaultValue = "") String keywords,
                                        @RequestParam(defaultValue = "10") Integer size) {
//        List<EmployeeremoveVo> list = moveService.getAllMove();
//        return list;


        Map<String, Object> map = new HashMap<>();
        List<EmployeeremoveVo> list = moveService.getAllMove(keywords,page,size);
        Long count = moveService.getCountByKeywords(keywords,page,size);
        map.put("moveList", list);
        map.put("count", count);
        return map;
    }

    @RequestMapping(value = "/move", method = RequestMethod.PUT)
    public RespBean updateMove(Employeeremove employeeremove) {
        if (moveService.updateMove(employeeremove) == 1) {
            return RespBean.ok("更新成功!");
        }
        return RespBean.error("更新失败!");
    }

    @RequestMapping(value = "/move", method = RequestMethod.POST)
    public RespBean addmove(Employeeremove employeeremove) {
        if (moveService.addMove(employeeremove) == 1) {
            return RespBean.ok("添加成功!");
        }
        return RespBean.error("添加失败!");
    }

    @RequestMapping(value = "/move/{ids}", method = RequestMethod.DELETE)
    public RespBean deleteMove(@PathVariable String ids) throws Exception{
        if (moveService.deleteMove(ids) > 0) {
            return RespBean.ok("删除成功!");
        }
        return RespBean.error("删除失败!");
    }



}
