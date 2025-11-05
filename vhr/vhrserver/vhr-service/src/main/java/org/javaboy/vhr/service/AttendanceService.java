package org.javaboy.vhr.service;

import org.javaboy.vhr.model.Attendance;
import org.javaboy.vhr.mapper.AttendanceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttendanceService {

    @Autowired
    private AttendanceMapper attendanceMapper;

    /**
     * 获取所有考勤记录
     * @return 考勤记录列表
     */
    public List<Attendance> getAllAttendance() {
        return attendanceMapper.getAllAttendance();
    }

    /**
     * 根据员工ID获取考勤记录
     * @param empId 员工ID
     * @return 考勤记录列表
     */
    public List<Attendance> getAttendanceByEmpId(Integer empId) {
        return attendanceMapper.getAttendanceByEmpId(empId);
    }

    /**
     * 添加考勤记录
     * @param attendance 考勤记录
     * @return 添加结果
     */
    public int addAttendance(Attendance attendance) {
        return attendanceMapper.insertSelective(attendance);
    }

    /**
     * 更新考勤记录
     * @param attendance 考勤记录
     * @return 更新结果
     */
    public int updateAttendance(Attendance attendance) {
        return attendanceMapper.updateByPrimaryKeySelective(attendance);
    }

    /**
     * 删除考勤记录
     * @param id 考勤记录ID
     * @return 删除结果
     */
    public int deleteAttendance(Integer id) {
        return attendanceMapper.deleteByPrimaryKey(id);
    }
}