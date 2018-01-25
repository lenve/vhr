package org.sang.service;

import org.sang.bean.Salary;
import org.sang.mapper.SalaryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by sang on 2018/1/24.
 */
@Service
public class SalaryService {
    @Autowired
    SalaryMapper salaryMapper;
    public int addSalary(Salary salary) {
        return salaryMapper.addSalary(salary);
    }

    public List<Salary> getAllSalary() {
        return salaryMapper.getAllSalary();
    }

    public int updateSalary(Salary salary) {
        return salaryMapper.updateSalary(salary);
    }

    public int deleteSalary(String ids) {
        String[] split = ids.split(",");
        return salaryMapper.deleteSalary(split);
    }
}
