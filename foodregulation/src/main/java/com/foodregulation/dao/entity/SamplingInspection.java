package com.foodregulation.dao.entity;

import java.util.Date;

/**
 * @author dxl
 * 抽样检查实体类
 *
 */
public class SamplingInspection {

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
     * 创建时间
     */
    private Date createTime;

    /**
     * 修改时间
     */
    private Date modifyTime;

    /**
     * 抽样表格
     */
    private String samplingForm;

    /**
     * 报告结论 0:不合格 1:合格
     */
    private String result;

    /**
     * 行政区域
     */
    private String area;

    /**
     * 监管单位
     */
    private String supervisory;

    /**
     * 附件
     */
    public String url;

    /**
     * 抽检任务id
     */
    private Long taskId;

    /**
     * 检查时间
     */
    private Date checkDate;

    /**
     * 检查时间
     */
    private String checkDateStr;


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


    public Date getCreateTime() {
        return createTime;
    }


    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }


    public Date getModifyTime() {
        return modifyTime;
    }


    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
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

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getSupervisory() {
        return supervisory;
    }

    public void setSupervisory(String supervisory) {
        this.supervisory = supervisory;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Long getTaskId() {
        return taskId;
    }

    public void setTaskId(Long taskId) {
        this.taskId = taskId;
    }

    public Date getCheckDate() {
        return checkDate;
    }

    public void setCheckDate(Date checkDate) {
        this.checkDate = checkDate;
    }

    public String getCheckDateStr() {
        return checkDateStr;
    }

    public void setCheckDateStr(String checkDateStr) {
        this.checkDateStr = checkDateStr;
    }
}
