package org.javaboy.vhr.controller;

import org.javaboy.vhr.model.Employee;
import org.javaboy.vhr.model.Salary;
import org.javaboy.vhr.model.Attendance;
import org.javaboy.vhr.service.EmployeeService;
import org.javaboy.vhr.service.SalaryCalculateService;
import org.javaboy.vhr.service.AttendanceService;
import org.javaboy.vhr.model.RespBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/salary/calculate")
public class SalaryCalculateController {

    @Autowired
    private SalaryCalculateService salaryCalculateService;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private AttendanceService attendanceService;

    /**
     * 计算单个员工工资
     * @param empId 员工ID
     * @return 计算结果
     */
    @GetMapping("/employee/{empId}")
    public RespBean calculateEmployeeSalary(@PathVariable Integer empId) {
        Employee employee = employeeService.getEmployeeById(empId);
        if (employee == null) {
            return RespBean.error("员工不存在");
        }

        List<Attendance> attendanceList = attendanceService.getAttendanceByEmpId(empId);
        Salary calculatedSalary = salaryCalculateService.calculateSalary(employee, attendanceList);

        return RespBean.success("工资计算成功", calculatedSalary);
    }

    /**
     * 计算所有员工工资
     * @return 计算结果
     */
    @GetMapping("/all")
    public RespBean calculateAllEmployeeSalary() {
        List<Employee> employees = employeeService.getAllEmployees();
        for (Employee employee : employees) {
            List<Attendance> attendanceList = attendanceService.getAttendanceByEmpId(employee.getId());
            Salary calculatedSalary = salaryCalculateService.calculateSalary(employee, attendanceList);
            // 可以将计算结果保存到数据库
            // salaryService.updateSalaryById(calculatedSalary);
        }
        return RespBean.success("所有员工工资计算完成");
    }

    /**
     * 根据工资账套计算工资
     * @param salaryId 工资账套ID
     * @return 计算结果
     */
    @GetMapping("/salary/{salaryId}")
    public RespBean calculateSalaryBySalaryId(@PathVariable Integer salaryId) {
        List<Employee> employees = employeeService.getEmployeesBySalaryId(salaryId);
        for (Employee employee : employees) {
            List<Attendance> attendanceList = attendanceService.getAttendanceByEmpId(employee.getId());
            Salary calculatedSalary = salaryCalculateService.calculateSalary(employee, attendanceList);
            // 可以将计算结果保存到数据库
            // salaryService.updateSalaryById(calculatedSalary);
        }
        return RespBean.success("工资计算完成");
    }
}