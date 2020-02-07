package org.sang.controller.personnel;



import org.sang.bean.Employeetrain;
import org.sang.bean.RespBean;
import org.sang.service.personnel.TrainService;
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
public class TrainController {
    @Autowired
    TrainService trainService;

    @RequestMapping(value = "/train", method = RequestMethod.GET)
    public Map<String, Object> Trains(@RequestParam(defaultValue = "1") Integer page,
                                      @RequestParam(defaultValue = "") String keywords,
                                      @RequestParam(defaultValue = "10") Integer size) {

        Map<String, Object> map = new HashMap<>();
        List<Employeetrain> list = trainService.getAllTrain(keywords,page,size);
        Long count = trainService.getCountByKeywords(keywords,page,size);
        map.put("trainsList", list);
        map.put("count", count);
        return map;
    }

    @RequestMapping(value = "/train", method = RequestMethod.PUT)
    public RespBean updateTrain(Employeetrain employeetrain) {
        if (trainService.updateTrain(employeetrain) == 1) {
            return RespBean.ok("更新成功!");
        }
        return RespBean.error("更新失败!");
    }

    @RequestMapping(value = "/train", method = RequestMethod.POST)
    public RespBean addTrain(Employeetrain employeetrain) {
        if (trainService.addTrain(employeetrain) == 1) {
            return RespBean.ok("添加成功!");
        }
        return RespBean.error("添加失败!");
    }

    @RequestMapping(value = "/train/{ids}", method = RequestMethod.DELETE)
    public RespBean deleteTrain(@PathVariable String ids) throws Exception{
        if (trainService.deleteTrain(ids) > 0) {
            return RespBean.ok("删除成功!");
        }
        return RespBean.error("删除失败!");
    }



}
