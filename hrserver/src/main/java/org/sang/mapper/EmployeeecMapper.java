package org.sang.mapper;

import org.apache.ibatis.annotations.Param;
import org.sang.bean.Employee;
import org.sang.bean.Employeeec;
import org.sang.bean.EmployeeecExcelVo;
import org.sang.example.EmployeeecExample;

import java.util.List;

public interface EmployeeecMapper {
    long countByExample(EmployeeecExample example);

    int deleteByExample(EmployeeecExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Employeeec record);

    int insertSelective(Employeeec record);

    List<Employeeec> selectByExample(EmployeeecExample example);

    Employeeec selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Employeeec record, @Param("example") EmployeeecExample example);

    int updateByExample(@Param("record") Employeeec record, @Param("example") EmployeeecExample example);

    int updateByPrimaryKeySelective(Employeeec record);

    int updateByPrimaryKey(Employeeec record);

    List<Employee> getAllEmps();

    int deleteEC(@Param("ids") String[] ids);

    List<Employeeec> selectByKey(@Param("start") Integer start, @Param("size") Integer size, @Param("keywords") String keywords);
    List<EmployeeecExcelVo> selectByKeyForExcel(@Param("start") Integer start, @Param("size") Integer size, @Param("keywords") String keywords);




    Long getCountByKeywords(@Param("start") Integer start, @Param("size") Integer size, @Param("keywords") String keywords);

    int addAwards(@Param("awards") List<Employeeec> awards);
}