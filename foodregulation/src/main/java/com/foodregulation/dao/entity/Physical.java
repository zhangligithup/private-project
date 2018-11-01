package com.foodregulation.dao.entity;

import java.io.Serializable;
import java.util.Date;

import com.foodregulation.util.DateUtil;

public class Physical implements Serializable {
    private Long id;

    private String companyName;

    private String enterpriseType;

    private String hospital;

    private String physicalName;

    private Date physicalDate;

    private String physicalDateStr;

    private Date reportDate;

    private String reportDateStr;

    /**
     * 体检日期超过1年:已过期, 否则:未过期
     */
    private String state;

    private String idNumber;

    private String phone;

    private Integer userId;

    private String enterpriseTypeId;

    /** 健康证照片url地址*/
    private String url;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEnterpriseType() {
        return enterpriseType;
    }

    public void setEnterpriseType(String enterpriseType) {
        this.enterpriseType = enterpriseType;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName == null ? null : companyName.trim();
    }

    public String getHospital() {
        return hospital;
    }

    public void setHospital(String hospital) {
        this.hospital = hospital == null ? null : hospital.trim();
    }

    public String getPhysicalName() {
        return physicalName;
    }

    public void setPhysicalName(String physicalName) {
        this.physicalName = physicalName == null ? null : physicalName.trim();
    }

    public Date getPhysicalDate() {
        return physicalDate;
    }

    public void setPhysicalDate(Date physicalDate) {
        this.physicalDate = physicalDate;
        if(physicalDate!=null){
        	physicalDateStr = DateUtil.getDateToStr2(physicalDate);
        }
    }

    public Date getReportDate() {
        return reportDate;
    }

    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
        if(reportDate!=null){
        	reportDateStr = DateUtil.getDateToStr2(reportDate);
        }
    }

    public String getPhysicalDateStr() {
        return physicalDateStr;
    }

    public void setPhysicalDateStr(String physicalDateStr) {
        this.physicalDateStr = physicalDateStr;
    }

    public String getReportDateStr() {
        return reportDateStr;
    }

    public void setReportDateStr(String reportDateStr) {
        this.reportDateStr = reportDateStr;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getEnterpriseTypeId() {
        return enterpriseTypeId;
    }

    public void setEnterpriseTypeId(String enterpriseTypeId) {
        this.enterpriseTypeId = enterpriseTypeId;
    }

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}