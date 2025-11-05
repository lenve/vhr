package org.javaboy.vhr.service;

import org.javaboy.vhr.mapper.SalaryMapper;
import org.javaboy.vhr.model.Salary;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SalaryService {
    @Autowired
    SalaryMapper salaryMapper;

    public List<Salary> getAllSalaries() {
        return salaryMapper.getAllSalaries();
    }

    public Integer addSalary(Salary salary) {
        salary.setCreateDate(new Date());
        return salaryMapper.insertSelective(salary);
    }

    public Integer deleteSalaryById(Integer id) {
        return salaryMapper.deleteByPrimaryKey(id);
    }

    public Integer updateSalaryById(Salary salary) {
        return salaryMapper.updateByPrimaryKeySelective(salary);
    }

    public Integer copySalary(Integer id) {
        Salary originalSalary = salaryMapper.selectByPrimaryKey(id);
        if (originalSalary == null) {
            return 0;
        }
        // 创建新的工资账套对象
        Salary newSalary = new Salary();
        newSalary.setBasicSalary(originalSalary.getBasicSalary());
        newSalary.setBonus(originalSalary.getBonus());
        newSalary.setLunchSalary(originalSalary.getLunchSalary());
        newSalary.setTrafficSalary(originalSalary.getTrafficSalary());
        newSalary.setAllSalary(originalSalary.getAllSalary());
        newSalary.setPensionBase(originalSalary.getPensionBase());
        newSalary.setPensionPer(originalSalary.getPensionPer());
        newSalary.setMedicalBase(originalSalary.getMedicalBase());
        newSalary.setMedicalPer(originalSalary.getMedicalPer());
        newSalary.setAccumulationFundBase(originalSalary.getAccumulationFundBase());
        newSalary.setAccumulationFundPer(originalSalary.getAccumulationFundPer());
        newSalary.setName(originalSalary.getName() + " (Copy)");
        newSalary.setEnabled(true);
        newSalary.setCreateDate(new Date());
        return salaryMapper.insertSelective(newSalary);
    }
}
