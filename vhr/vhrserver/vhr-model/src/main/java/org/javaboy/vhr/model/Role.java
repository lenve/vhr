package org.javaboy.vhr.model;

import java.io.Serializable;
import java.util.List;

public class Role implements Serializable {

    /**
     * 序列化版本号（阿里巴巴Java开发规范【强制】要求显式声明）
     */
    private static final long serialVersionUID = 1L;

    private Integer id;

    private String name;

    private String nameZh;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getNameZh() {
        return nameZh;
    }

    public void setNameZh(String nameZh) {
        this.nameZh = nameZh;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                "name='" + name + '\'' +
                "nameZh='" + nameZh + '\'' +
                '}';
    }
}
