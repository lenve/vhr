package org.sang.mapper;

import org.apache.ibatis.annotations.Param;
import org.sang.bean.Salary;

import java.util.List;

/**
 * Created by sang on 2018/1/24.
 */
public interface SalaryMapper {
    int addSalary(@Param("salary") Salary salary);

    List<Salary> getAllSalary();

    int updateSalary(@Param("salary") Salary salary);

    int deleteSalary(@Param("ids") String[] ids);

    int deleteSalaryByEid(@Param("eid") Long eid);

    int addSidAndEid(@Param("sid") Integer sid, @Param("eid") Long eid);
}
