package com.foodregulation.dao.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class ExamPublish implements Serializable {
    private Long id;

    private Long examinationid;

    private Integer personCompanyId;

    private Integer enterprisetype;

    private String type;

    private Date createTime;

    private List<Integer> list;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getExaminationid() {
        return examinationid;
    }

    public void setExaminationid(Long examinationid) {
        this.examinationid = examinationid;
    }

    public Integer getPersonCompanyId() {
        return personCompanyId;
    }

    public void setPersonCompanyId(Integer personCompanyId) {
        this.personCompanyId = personCompanyId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getEnterprisetype() {
        return enterprisetype;
    }

    public void setEnterprisetype(Integer enterprisetype) {
        this.enterprisetype = enterprisetype;
    }

    public List<Integer> getList() {
        return list;
    }

    public void setList(List<Integer> list) {
        this.list = list;
    }
}