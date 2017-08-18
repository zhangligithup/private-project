package com.foodregulation.dao.entity;

import com.foodregulation.util.StringUtils;

public class KeepRecord {
    private Integer id;

    private String additivesName;

    private String implementationStandards;

    private String productCompany;

    private String sellCompany;

    private String acceptanceMethod;

    private String purpose;

    private String remark;

    private Integer additivefilingId;
    
    private String purchaseTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdditivesName() {
        return additivesName;
    }

    public void setAdditivesName(String additivesName) {
        this.additivesName = additivesName;
    }

    public String getImplementationStandards() {
        return implementationStandards;
    }

    public void setImplementationStandards(String implementationStandards) {
        this.implementationStandards = implementationStandards;
    }

    public String getProductCompany() {
        return productCompany;
    }

    public void setProductCompany(String productCompany) {
        this.productCompany = productCompany;
    }

    public String getSellCompany() {
        return sellCompany;
    }

    public void setSellCompany(String sellCompany) {
        this.sellCompany = sellCompany;
    }

    public String getAcceptanceMethod() {
        return acceptanceMethod;
    }

    public void setAcceptanceMethod(String acceptanceMethod) {
        this.acceptanceMethod = acceptanceMethod;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getAdditivefilingId() {
        return additivefilingId;
    }

    public void setAdditivefilingId(Integer additivefilingId) {
        this.additivefilingId = additivefilingId;
    }
    
    public String getPurchaseTime() {
    	if(StringUtils.isNotBlank(purchaseTime)) {
    		purchaseTime = purchaseTime.substring(0, purchaseTime.length()-5);
    	}
        return purchaseTime;
    }

    public void setPurchaseTime(String purchaseTime) {
        this.purchaseTime = purchaseTime;
    }
}