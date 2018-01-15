package org.sang.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.sang.bean.Employee;
import org.sang.bean.Nation;
import org.sang.bean.PoliticsStatus;

import java.util.List;

/**
 * Created by sang on 2018/1/12.
 */
@Mapper
public interface EmpMapper {
    List<Nation> getAllNations();

    List<PoliticsStatus> getAllPolitics();

    int addEmp(Employee employee);

    Long getMaxId();

    List<Employee> getEmployeeByPage(@Param("start") int start, @Param("size") Integer size, @Param("keywords") String keywords);

    Long getCountByKeywords(@Param("keywords") String keywords);

    int updateEmp(@Param("emp") Employee employee);

    int deleteEmpById(@Param("ids") String[] ids);
}
