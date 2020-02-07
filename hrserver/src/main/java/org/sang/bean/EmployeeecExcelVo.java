package org.sang.bean;

import java.io.Serializable;
import java.util.Date;

public class EmployeeecExcelVo implements Serializable {
    private Integer id;

    private Integer eid;

    private Date ecDate;

    private String ecReason;

    private Integer ecPoint;

    private Integer ecType;

    private String remark;

    //员工姓名
    private String name;

    //奖罚类别
    private String  ecTypeText;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEcTypeText() {
        return ecTypeText;
    }

    public void setEcTypeText(String ecTypeText) {
        this.ecTypeText = ecTypeText;
    }

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public Date getEcDate() {
        return ecDate;
    }

    public void setEcDate(Date ecDate) {
        this.ecDate = ecDate;
    }

    public String getEcReason() {
        return ecReason;
    }

    public void setEcReason(String ecReason) {
        this.ecReason = ecReason == null ? null : ecReason.trim();
    }

    public Integer getEcPoint() {
        return ecPoint;
    }

    public void setEcPoint(Integer ecPoint) {
        this.ecPoint = ecPoint;
    }

    public Integer getEcType() {
        return ecType;
    }

    public void setEcType(Integer ecType) {
        this.ecType = ecType;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", eid=").append(eid);
        sb.append(", ecDate=").append(ecDate);
        sb.append(", ecReason=").append(ecReason);
        sb.append(", ecPoint=").append(ecPoint);
        sb.append(", ecType=").append(ecType);
        sb.append(", remark=").append(remark);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}