package org.sang.bean;

import java.io.Serializable;

public class HrDict implements Serializable {
    private Integer id;

    private String desc;

    private String dictName;

    private Integer dictValue;

    private Integer isfixed;

    private static final long serialVersionUID = 1L;


    public HrDict(){

    }
    public HrDict (String dictName){
        this.dictName = dictName;

    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc == null ? null : desc.trim();
    }

    public String getDictName() {
        return dictName;
    }

    public void setDictName(String dictName) {
        this.dictName = dictName == null ? null : dictName.trim();
    }

    public Integer getDictValue() {
        return dictValue;
    }

    public void setDictValue(Integer dictValue) {
        this.dictValue = dictValue;
    }

    public Integer getIsfixed() {
        return isfixed;
    }

    public void setIsfixed(Integer isfixed) {
        this.isfixed = isfixed;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", desc=").append(desc);
        sb.append(", dictName=").append(dictName);
        sb.append(", dictValue=").append(dictValue);
        sb.append(", isfixed=").append(isfixed);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        HrDict hrDict = (HrDict) o;

        return dictName != null ? dictName.equals(hrDict.dictName) : hrDict.dictName == null;
    }
}