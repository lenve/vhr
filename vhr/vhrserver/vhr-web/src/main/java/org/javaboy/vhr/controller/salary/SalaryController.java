package org.javaboy.vhr.controller.salary;

import org.javaboy.vhr.model.RespBean;
import org.javaboy.vhr.model.Salary;
import org.javaboy.vhr.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/salary/sob")
public class SalaryController {
    @Autowired
    SalaryService salaryService;

    @GetMapping("/")
    public List<Salary> getAllSalaries() {
        return salaryService.getAllSalaries();
    }

    @PostMapping("/")
    public RespBean addSalary(@RequestBody Salary salary) {
        if (salaryService.addSalary(salary) == 1) {
            return RespBean.ok("添加成功!");
        }
        return RespBean.error("添加失败!");
    }

    @DeleteMapping("/{id}")
    public RespBean deleteSalaryById(@PathVariable Integer id) {
        if (salaryService.deleteSalaryById(id) == 1) {
            return RespBean.ok("删除成功！");
        }
        return RespBean.error("删除失败！");
    }

    @PutMapping("/")
    public RespBean updateSalaryById(@RequestBody Salary salary) {
        if (salaryService.updateSalaryById(salary) == 1) {
            return RespBean.ok("更新成功!");
        }
        return RespBean.error("更新失败!");
    }

    @PutMapping("/enable/{id}")
    public RespBean enableSalary(@PathVariable Integer id) {
        Salary salary = new Salary();
        salary.setId(id);
        salary.setEnabled(true);
        if (salaryService.updateSalaryById(salary) == 1) {
            return RespBean.ok("启用成功!");
        }
        return RespBean.error("启用失败!");
    }

    @PutMapping("/disable/{id}")
    public RespBean disableSalary(@PathVariable Integer id) {
        Salary salary = new Salary();
        salary.setId(id);
        salary.setEnabled(false);
        if (salaryService.updateSalaryById(salary) == 1) {
            return RespBean.ok("禁用成功!");
        }
        return RespBean.error("禁用失败!");
    }

    @PostMapping("/copy/{id}")
    public RespBean copySalary(@PathVariable Integer id) {
        if (salaryService.copySalary(id) == 1) {
            return RespBean.ok("复制成功!");
        }
        return RespBean.error("复制失败!");
    }
}