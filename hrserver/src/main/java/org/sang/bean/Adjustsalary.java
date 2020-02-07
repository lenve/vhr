package org.sang.bean;

import java.io.Serializable;
import java.util.Date;

public class Adjustsalary implements Serializable {
    private Integer id;

    private Integer eid;

    private Date asDate;

    private Integer beforeSalary;

    private Integer afterSalary;

    private String reason;

    private String remark;

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

    public Date getAsDate() {
        return asDate;
    }

    public void setAsDate(Date asDate) {
        this.asDate = asDate;
    }

    public Integer getBeforeSalary() {
        return beforeSalary;
    }

    public void setBeforeSalary(Integer beforeSalary) {
        this.beforeSalary = beforeSalary;
    }

    public Integer getAfterSalary() {
        return afterSalary;
    }

    public void setAfterSalary(Integer afterSalary) {
        this.afterSalary = afterSalary;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
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
        sb.append(", asDate=").append(asDate);
        sb.append(", beforeSalary=").append(beforeSalary);
        sb.append(", afterSalary=").append(afterSalary);
        sb.append(", reason=").append(reason);
        sb.append(", remark=").append(remark);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}