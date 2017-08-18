package com.foodregulation.dao.entity;

import java.io.Serializable;
import java.util.Date;

public class SamplingTask implements Serializable {
    private Long id;

    private Integer enterpriseId;

    private String enterpriseType;

    private String enterpriseTypeName;

    private String enterpriseName;

    private Date checkStartDate;

    private String checkStartDateStr;

    private Date checkEndDate;

    private String checkEndDateStr;


    private String checkDate;

    private String unitCode;

    private String unitName;

    private String batch;

    private Integer samplingType;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public Integer getEnterpriseId() {
        return enterpriseId;
    }

    public void setEnterpriseId(Integer enterpriseId) {
        this.enterpriseId = enterpriseId;
    }

    public String getEnterpriseType() {
        return enterpriseType;
    }

    public void setEnterpriseType(String enterpriseType) {
        this.enterpriseType = enterpriseType;
    }

    public String getEnterpriseName() {
        return enterpriseName;
    }

    public void setEnterpriseName(String enterpriseName) {
        this.enterpriseName = enterpriseName;
    }

    public Date getCheckStartDate() {
        return checkStartDate;
    }

    public void setCheckStartDate(Date checkStartDate) {
        this.checkStartDate = checkStartDate;
    }

    public String getCheckStartDateStr() {
        return checkStartDateStr;
    }

    public void setCheckStartDateStr(String checkStartDateStr) {
        this.checkStartDateStr = checkStartDateStr;
    }

    public Date getCheckEndDate() {
        return checkEndDate;
    }

    public void setCheckEndDate(Date checkEndDate) {
        this.checkEndDate = checkEndDate;
    }

    public String getCheckEndDateStr() {
        return checkEndDateStr;
    }

    public void setCheckEndDateStr(String checkEndDateStr) {
        this.checkEndDateStr = checkEndDateStr;
    }

    public String getUnitCode() {
        return unitCode;
    }

    public void setUnitCode(String unitCode) {
        this.unitCode = unitCode;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public Integer getSamplingType() {
        return samplingType;
    }

    public void setSamplingType(Integer samplingType) {
        this.samplingType = samplingType;
    }

    public String getEnterpriseTypeName() {
        return enterpriseTypeName;
    }

    public void setEnterpriseTypeName(String enterpriseTypeName) {
        this.enterpriseTypeName = enterpriseTypeName;
    }

    public String getCheckDate() {
        return checkDate;
    }

    public void setCheckDate(String checkDate) {
        this.checkDate = checkDate;
    }
}