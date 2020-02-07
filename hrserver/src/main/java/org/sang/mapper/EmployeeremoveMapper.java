package org.sang.mapper;

import org.apache.ibatis.annotations.Param;
import org.sang.bean.Employeeremove;
import org.sang.bean.EmployeeremoveVo;
import org.sang.example.EmployeeremoveExample;

import java.util.List;

public interface EmployeeremoveMapper {
    long countByExample(EmployeeremoveExample example);

    int deleteByExample(EmployeeremoveExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Employeeremove record);

    int insertSelective(Employeeremove record);

    List<Employeeremove> selectByExample(EmployeeremoveExample example);

    Employeeremove selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Employeeremove record, @Param("example") EmployeeremoveExample example);

    int updateByExample(@Param("record") Employeeremove record, @Param("example") EmployeeremoveExample example);

    int updateByPrimaryKeySelective(Employeeremove record);

    int updateByPrimaryKey(Employeeremove record);

    int deleteMove(@Param("ids") String[] ids);

    List<EmployeeremoveVo> getAllMove();

    List<EmployeeremoveVo> selectByKey(@Param("start") Integer start, @Param("size") Integer size, @Param("keywords") String keywords);

    Long getCountByKeywords(@Param("start") Integer start, @Param("size") Integer size, @Param("keywords") String keywords);
}