package org.sang.mapper;

import org.apache.ibatis.annotations.Param;
import org.sang.bean.Adjustsalary;
import org.sang.example.AdjustsalaryExample;


import java.util.List;

public interface AdjustsalaryMapper {
    long countByExample(AdjustsalaryExample example);

    int deleteByExample(AdjustsalaryExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Adjustsalary record);

    int insertSelective(Adjustsalary record);

    List<Adjustsalary> selectByExample(AdjustsalaryExample example);

    Adjustsalary selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Adjustsalary record, @Param("example") AdjustsalaryExample example);

    int updateByExample(@Param("record") Adjustsalary record, @Param("example") AdjustsalaryExample example);

    int updateByPrimaryKeySelective(Adjustsalary record);

    int updateByPrimaryKey(Adjustsalary record);


    int deleteAdjustsalary(@Param("ids") String[] ids);

    List<Adjustsalary> selectByKey(@Param("start") Integer start, @Param("size") Integer size, @Param("keywords") String keywords);

    Long getCountByKeywords(@Param("start") Integer start, @Param("size") Integer size, @Param("keywords") String keywords);
}