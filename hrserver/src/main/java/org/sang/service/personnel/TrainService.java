package org.sang.service.personnel;


import org.sang.bean.Employee;
import org.sang.bean.Employeeec;


import org.sang.bean.Employeetrain;
import org.sang.example.EmployeetrainExample;
import org.sang.mapper.EmployeetrainMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by xianfuhao on 2019/12/20.
 */
@Service
@Transactional
public class TrainService {

    @Autowired
    EmployeetrainMapper employeetrainMapper;

    /**
     * 获取所有培训数据
     * @return
     */
    public List<Employeetrain> getAllTrain(String keywords,Integer page,Integer size) {
        int start = (page - 1) * size;

        List<Employeetrain> employeetrainList = employeetrainMapper.selectByKey(start,size,keywords);
        return employeetrainList;
    }

    public int updateTrain(Employeetrain employeetrain) {


        return employeetrainMapper.updateByPrimaryKeySelective(employeetrain);
    }

    public int addTrain(Employeetrain employeetrain) {
        return employeetrainMapper.insert(employeetrain);
    }



    public int deleteTrain(String ids) {
        String[] split = ids.split(",");
        return employeetrainMapper.deleteTrain(split);

    }

    public Long getCountByKeywords(String keywords, Integer start, Integer size) {
        return employeetrainMapper.getCountByKeywords(start,size,keywords);
    }
}
