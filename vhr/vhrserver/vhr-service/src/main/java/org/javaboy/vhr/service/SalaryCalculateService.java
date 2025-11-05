package org.javaboy.vhr.service;

import org.javaboy.vhr.model.Employee;
import org.javaboy.vhr.model.Salary;
import org.javaboy.vhr.model.Attendance;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SalaryCalculateService {

    /**
     * 计算员工工资
     * @param employee 员工信息
     * @param attendanceList 考勤记录
     * @return 计算后的工资信息
     */
    public Salary calculateSalary(Employee employee, List<Attendance> attendanceList) {
        Salary salary = employee.getSalary();
        if (salary == null) {
            return null;
        }

        // 计算应发工资
        int grossSalary = calculateGrossSalary(salary);
        // 计算社保公积金
        int socialSecurity = calculateSocialSecurity(salary);
        // 计算考勤扣款
        int attendanceDeduction = calculateAttendanceDeduction(salary, attendanceList);
        // 计算个人所得税
        int incomeTax = calculateIncomeTax(grossSalary - socialSecurity);
        // 计算实发工资
        int netSalary = grossSalary - socialSecurity - attendanceDeduction - incomeTax;

        // 创建新的工资对象返回计算结果
        Salary calculatedSalary = new Salary();
        calculatedSalary.setId(salary.getId());
        calculatedSalary.setName(salary.getName());
        calculatedSalary.setBasicSalary(salary.getBasicSalary());
        calculatedSalary.setBonus(salary.getBonus());
        calculatedSalary.setLunchSalary(salary.getLunchSalary());
        calculatedSalary.setTrafficSalary(salary.getTrafficSalary());
        calculatedSalary.setPensionBase(salary.getPensionBase());
        calculatedSalary.setPensionPer(salary.getPensionPer());
        calculatedSalary.setMedicalBase(salary.getMedicalBase());
        calculatedSalary.setMedicalPer(salary.getMedicalPer());
        calculatedSalary.setAccumulationFundBase(salary.getAccumulationFundBase());
        calculatedSalary.setAccumulationFundPer(salary.getAccumulationFundPer());
        calculatedSalary.setCreateDate(salary.getCreateDate());
        calculatedSalary.setEnabled(salary.getEnabled());
        // 设置计算后的总工资
        calculatedSalary.setAllSalary(netSalary);

        return calculatedSalary;
    }

    /**
     * 计算应发工资
     * @param salary 工资账套
     * @return 应发工资
     */
    private int calculateGrossSalary(Salary salary) {
        int gross = 0;
        gross += salary.getBasicSalary() != null ? salary.getBasicSalary() : 0;
        gross += salary.getBonus() != null ? salary.getBonus() : 0;
        gross += salary.getLunchSalary() != null ? salary.getLunchSalary() : 0;
        gross += salary.getTrafficSalary() != null ? salary.getTrafficSalary() : 0;
        return gross;
    }

    /**
     * 计算社保公积金
     * @param salary 工资账套
     * @return 社保公积金总额
     */
    private int calculateSocialSecurity(Salary salary) {
        int socialSecurity = 0;
        // 养老金
        if (salary.getPensionBase() != null && salary.getPensionPer() != null) {
            socialSecurity += (int) (salary.getPensionBase() * salary.getPensionPer() / 100);
        }
        // 医疗保险
        if (salary.getMedicalBase() != null && salary.getMedicalPer() != null) {
            socialSecurity += (int) (salary.getMedicalBase() * salary.getMedicalPer() / 100);
        }
        // 公积金
        if (salary.getAccumulationFundBase() != null && salary.getAccumulationFundPer() != null) {
            socialSecurity += (int) (salary.getAccumulationFundBase() * salary.getAccumulationFundPer() / 100);
        }
        return socialSecurity;
    }

    /**
     * 计算考勤扣款
     * @param salary 工资账套
     * @param attendanceList 考勤记录
     * @return 考勤扣款
     */
    private int calculateAttendanceDeduction(Salary salary, List<Attendance> attendanceList) {
        if (attendanceList == null || attendanceList.isEmpty()) {
            return 0;
        }

        int deduction = 0;
        int basicSalary = salary.getBasicSalary() != null ? salary.getBasicSalary() : 0;
        // 假设每月工作日为22天
        int dailySalary = basicSalary / 22;

        for (Attendance attendance : attendanceList) {
            if ("旷工".equals(attendance.getType())) {
                deduction += dailySalary;
            } else if ("迟到".equals(attendance.getType())) {
                deduction += 20;
            } else if ("早退".equals(attendance.getType())) {
                deduction += 20;
            }
        }

        return deduction;
    }

    /**
     * 计算个人所得税
     * @param taxableIncome 应纳税所得额
     * @return 个人所得税
     */
    private int calculateIncomeTax(int taxableIncome) {
        // 起征点为5000元
        if (taxableIncome <= 5000) {
            return 0;
        }

        int tax = 0;
        int excess = taxableIncome - 5000;

        if (excess <= 3000) {
            tax = (int) (excess * 0.03);
        } else if (excess <= 12000) {
            tax = (int) (3000 * 0.03 + (excess - 3000) * 0.1);
        } else if (excess <= 25000) {
            tax = (int) (3000 * 0.03 + 9000 * 0.1 + (excess - 12000) * 0.2);
        } else if (excess <= 35000) {
            tax = (int) (3000 * 0.03 + 9000 * 0.1 + 13000 * 0.2 + (excess - 25000) * 0.25);
        } else if (excess <= 55000) {
            tax = (int) (3000 * 0.03 + 9000 * 0.1 + 13000 * 0.2 + 10000 * 0.25 + (excess - 35000) * 0.3);
        } else if (excess <= 80000) {
            tax = (int) (3000 * 0.03 + 9000 * 0.1 + 13000 * 0.2 + 10000 * 0.25 + 20000 * 0.3 + (excess - 55000) * 0.35);
        } else {
            tax = (int) (3000 * 0.03 + 9000 * 0.1 + 13000 * 0.2 + 10000 * 0.25 + 20000 * 0.3 + 25000 * 0.35 + (excess - 80000) * 0.45);
        }

        return tax;
    }
}