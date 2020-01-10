package org.sang.service;


import org.sang.bean.Employee;
import org.sang.bean.Employeeec;
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
    public List<Employeeec> getAllAward() {

        EmployeeecExample example = new EmployeeecExample();
        List<Employeeec> employeeecList = employeeecMapper.selectByExample(example);
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

    public int deleteEc(Integer ids) {

        return employeeecMapper.deleteByPrimaryKey(ids);
    }
}
