package com.foodregulation.dao.entity;

/**
 * @author dxl
 * 抽样检查实体类
 *
 */
public class AppSamplingInspection {

    private Long id;

    /**
     * 企业类型
     */
    private String businessCategory;

    /**
     * 企业类型名称
     */
    private String businessCategoryName;

    /**
     * 企业名称
     */
    private String samplingUnit;

    /**
     * 企业ID
     */
    private Long samplingUnitId;

    /**
     * 操作者名称
     */
    private String operatorName;

    /**
     * 操作者ID
     */
    private Long operatorId;

    /**
     * 抽样类型 1.食品安全抽样单 2药品安全抽样检验单 3化妆品安全抽样单 4医疗器械安全抽样单 5保健食品安全抽样单
     */
    private Integer samplingType;

    /**
     * 表单类型 1抽样单 2抽样报告
     */
    private Integer formType;

    /**
     * 抽样表格
     */
    private String samplingForm;


    public Long getId() {
        return id;
    }


    public void setId(Long id) {
        this.id = id;
    }


    public String getBusinessCategory() {
        return businessCategory;
    }


    public void setBusinessCategory(String businessCategory) {
        this.businessCategory = businessCategory;
    }


    public String getSamplingUnit() {
        return samplingUnit;
    }


    public void setSamplingUnit(String samplingUnit) {
        this.samplingUnit = samplingUnit;
    }


    public Long getSamplingUnitId() {
        return samplingUnitId;
    }


    public void setSamplingUnitId(Long samplingUnitId) {
        this.samplingUnitId = samplingUnitId;
    }


    public String getOperatorName() {
        return operatorName;
    }


    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
    }


    public Long getOperatorId() {
        return operatorId;
    }


    public void setOperatorId(Long operatorId) {
        this.operatorId = operatorId;
    }


    public String getSamplingForm() {
        return samplingForm;
    }


    public void setSamplingForm(String samplingForm) {
        this.samplingForm = samplingForm;
    }



    public String getBusinessCategoryName() {
        return businessCategoryName;
    }



    public void setBusinessCategoryName(String businessCategoryName) {
        this.businessCategoryName = businessCategoryName;
    }



    public Integer getSamplingType() {
        return samplingType;
    }



    public void setSamplingType(Integer samplingType) {
        this.samplingType = samplingType;
    }



    public Integer getFormType() {
        return formType;
    }



    public void setFormType(Integer formType) {
        this.formType = formType;
    }

}
