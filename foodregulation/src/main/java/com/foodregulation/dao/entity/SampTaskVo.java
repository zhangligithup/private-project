package com.foodregulation.dao.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by JamesBond on 2017/1/1.
 */
public class SampTaskVo  implements Serializable {
    private List<SampTaskSelEnt> list;

    private String listJson;

    private Date checkStartDate;

    private String checkStartDateStr;

    private Date checkEndDate;

    private String checkEndDateStr;

    private Integer samplingType;

    private String unitCode;

    private String unitName;

    public List<SampTaskSelEnt> getList() {
        return list;
    }

    public void setList(List<SampTaskSelEnt> list) {
        this.list = list;
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

    public Integer getSamplingType() {
        return samplingType;
    }

    public void setSamplingType(Integer samplingType) {
        this.samplingType = samplingType;
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

    public String getListJson() {
        return listJson;
    }

    public void setListJson(String listJson) {
        this.listJson = listJson;
    }
}
