package com.foodregulation.dao.entity;

import java.util.Date;

import org.joda.time.format.DateTimeFormat;

import com.foodregulation.util.DateUtil;
import com.foodregulation.util.StringUtils;

public class PurchaseLedger {
    private Integer id;

    private String company;

    private String commodity;

    private String supplyUnit;

    private String buyer;

    private Date purchaseTime;

    private Date reportTime;
    
    private String purchaseTimeStr;
    
    private String reportTimeStr;

    private String spec;

    private Integer num;

    private String batchNumber;

    private Date safeDate;

    private String supplyPerson;

    private String supplyTel;

    private String recordPerson;

    private String imgUrl;
    
    private String batchUnit;
    
    private String safeDateStr;
    
    private String createUser;
    
    private String productionPlace;//产地

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getCommodity() {
        return commodity;
    }

    public void setCommodity(String commodity) {
        this.commodity = commodity;
    }

    public String getSupplyUnit() {
        return supplyUnit;
    }

    public void setSupplyUnit(String supplyUnit) {
        this.supplyUnit = supplyUnit;
    }

    public String getBuyer() {
        return buyer;
    }

    public void setBuyer(String buyer) {
        this.buyer = buyer;
    }

    public Date getPurchaseTime() {
        return purchaseTime;
    }

    public void setPurchaseTime(Date purchaseTime) {
        this.purchaseTime = purchaseTime;
        if(purchaseTime!=null){
        	this.purchaseTimeStr = DateUtil.dateToString(purchaseTime, "yyyy-MM-dd HH:mm");
        }
    }

    public Date getReportTime() {
        return reportTime;
    }

    public void setReportTime(Date reportTime) {
        this.reportTime = reportTime;
        if(reportTime!=null){
        	this.reportTimeStr = DateUtil.dateToString(reportTime, "yyyy-MM-dd HH:mm");
        }
    }

    public String getSpec() {
        return spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getBatchNumber() {
        return batchNumber;
    }

    public void setBatchNumber(String batchNumber) {
        this.batchNumber = batchNumber;
    }

    public Date getSafeDate() {
        return safeDate;
    }

    public void setSafeDate(Date safeDate) {
        this.safeDate = safeDate;
        if(safeDate!=null){
        	this.safeDateStr = DateUtil.dateToString(safeDate, "yyyy-MM-dd");
        }
    }

    public String getSupplyPerson() {
        return supplyPerson;
    }

    public void setSupplyPerson(String supplyPerson) {
        this.supplyPerson = supplyPerson;
    }

    public String getSupplyTel() {
        return supplyTel;
    }

    public void setSupplyTel(String supplyTel) {
        this.supplyTel = supplyTel;
    }

    public String getRecordPerson() {
        return recordPerson;
    }

    public void setRecordPerson(String recordPerson) {
        this.recordPerson = recordPerson;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

	public String getBatchUnit() {
		return batchUnit;
	}

	public void setBatchUnit(String batchUnit) {
		this.batchUnit = batchUnit;
	}

	public String getPurchaseTimeStr() {
		return purchaseTimeStr;
	}

	public void setPurchaseTimeStr(String purchaseTimeStr) {
		this.purchaseTimeStr = purchaseTimeStr;
		if(StringUtils.isNotBlank(purchaseTimeStr)){
			this.purchaseTime = DateUtil.stringToDate(purchaseTimeStr, "yyyy-MM-dd HH:mm");
		}
	}

	public String getReportTimeStr() {
		return reportTimeStr;
	}

	public void setReportTimeStr(String reportTimeStr) {
		this.reportTimeStr = reportTimeStr;
	}

	public String getSafeDateStr() {
		return safeDateStr;
	}

	public void setSafeDateStr(String safeDateStr) {
		this.safeDateStr = safeDateStr;
		if(StringUtils.isNotBlank(safeDateStr)){
			this.safeDate = DateUtil.stringToDate(safeDateStr, "yyyy-MM-dd");
		}
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getProductionPlace() {
		return productionPlace;
	}

	public void setProductionPlace(String productionPlace) {
		this.productionPlace = productionPlace;
	}
    
	
}