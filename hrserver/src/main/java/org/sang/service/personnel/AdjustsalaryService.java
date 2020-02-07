package org.sang.service.personnel;


import org.sang.bean.Adjustsalary;
import org.sang.bean.Employeetrain;
import org.sang.example.AdjustsalaryExample;
import org.sang.example.EmployeetrainExample;
import org.sang.mapper.AdjustsalaryMapper;
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
public class AdjustsalaryService {

    @Autowired
    AdjustsalaryMapper adjustsalaryMapper;

    /**
     * 获取所有惩戒数据
     * @return
     */
    public List<Adjustsalary> getAllAdjustsalary(String keywords,Integer page,Integer size) {

//        AdjustsalaryExample example = new AdjustsalaryExample();
//        List<Adjustsalary> adjustsalaryList = adjustsalaryMapper.selectByExample(example);

        int start = (page - 1) * size;
        List<Adjustsalary> adjustsalaryList = adjustsalaryMapper.selectByKey(start,size,keywords);
        return adjustsalaryList;
    }

    public int updateAdjustsalary(Adjustsalary adjustsalary) {


        return adjustsalaryMapper.updateByPrimaryKeySelective(adjustsalary);
    }

    public int addAdjustsalary(Adjustsalary adjustsalary) {
        return adjustsalaryMapper.insert(adjustsalary);
    }



    public int deleteAdjustsalary(String ids) {
        String[] split = ids.split(",");
        return adjustsalaryMapper.deleteAdjustsalary(split);

    }

    public Long getCountByKeywords(String keywords, Integer start, Integer size) {
        return adjustsalaryMapper.getCountByKeywords(start,size,keywords);

    }
}
