package org.sang.mapper;

import org.apache.ibatis.annotations.Param;
import org.sang.bean.HrDict;
import org.sang.example.HrDictExample;

import java.util.List;

public interface HrDictMapper {
    long countByExample(HrDictExample example);

    int deleteByExample(HrDictExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(HrDict record);

    int insertSelective(HrDict record);

    List<HrDict> selectByExample(HrDictExample example);

    HrDict selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") HrDict record, @Param("example") HrDictExample example);

    int updateByExample(@Param("record") HrDict record, @Param("example") HrDictExample example);

    int updateByPrimaryKeySelective(HrDict record);

    int updateByPrimaryKey(HrDict record);
}