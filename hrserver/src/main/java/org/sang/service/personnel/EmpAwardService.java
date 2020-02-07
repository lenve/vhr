package org.sang.service.personnel;


import org.sang.bean.Employee;
import org.sang.bean.Employeeec;
import org.sang.bean.EmployeeecExcelVo;
import org.sang.bean.Salary;
import org.sang.example.EmployeeecExample;
import org.sang.mapper.EmployeeecMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by xianfuhao on 2019/12/20.
 */
@Service
@Transactional
public class EmpAwardService {

    @Autowired
    EmployeeecMapper employeeecMapper;

    /**
     * 获取所有惩戒数据
     * @return
     */
    public List<Employeeec> getAllAward(String keywords,Integer page,Integer size) {
        int start = (page - 1) * size;
//        EmployeeecExample example = new EmployeeecExample();
//        List<Employeeec> employeeecList = employeeecMapper.selectByExample(example);
        List<Employeeec> employeeecList = employeeecMapper.selectByKey(start,size,keywords);
        return employeeecList;
    }

    public int updateEc(Employeeec employeeec) {


        return employeeecMapper.updateByPrimaryKeySelective(employeeec);
    }

    public int addEc(Employeeec employeeec) {
        return employeeecMapper.insert(employeeec);
    }

    public List<Employee> getAllEmps() {


        return employeeecMapper.getAllEmps();
    }

    public int deleteEc(String ids) {
        String[] split = ids.split(",");
        return employeeecMapper.deleteEC(split);

    }

    public Long getCountByKeywords(String keywords, Integer start, Integer size) {

        return employeeecMapper.getCountByKeywords(start,size,keywords);
    }

    public List<EmployeeecExcelVo> getAllEc() {

       return employeeecMapper.selectByKeyForExcel(null,null,"");
    }


    public int addAwards(List<Employeeec> awards) {
        return employeeecMapper.addAwards(awards);
    }
}
