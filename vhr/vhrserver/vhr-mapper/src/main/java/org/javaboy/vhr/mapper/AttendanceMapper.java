package org.javaboy.vhr.mapper;

import org.javaboy.vhr.model.Attendance;

import java.util.List;

public interface AttendanceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Attendance record);

    int insertSelective(Attendance record);

    Attendance selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Attendance record);

    int updateByPrimaryKey(Attendance record);

    List<Attendance> getAllAttendance();

    List<Attendance> getAttendanceByEmpId(Integer empId);
}