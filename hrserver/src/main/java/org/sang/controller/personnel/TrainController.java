package org.sang.controller.personnel;



import org.sang.bean.Employeetrain;
import org.sang.bean.RespBean;
import org.sang.service.personnel.TrainService;
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
@RequestMapping("/personnel")
public class TrainController {
    @Autowired
    TrainService trainService;

    @RequestMapping(value = "/train", method = RequestMethod.GET)
    public List<Employeetrain> Trains() {
        List<Employeetrain> list = trainService.getAllTrain();
        return list;
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
