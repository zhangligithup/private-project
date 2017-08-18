package com.foodregulation.dao.entity;

public class CaseInfo {
    /**
     * 案件ID
     */
    private Integer caseInfoId;

    /**
     * 涉案企业
     */
    private String caseInfoCompany;

    /**
     * 立案人
     */
    private String caseInfoFilingPerson;

    /**
     * 案件来源id
     */
    private Integer caseFromId;

    /**
     * 立案时间
     */
    private String caseInfoTime;

    /**
     * 案由
     */
    private String caseInfoReason;

    /**
     * 违法条款id
     */
    private String illegalClauseIds;

    /**
     * 处罚依据id
     */
    private String punishBasisIds;

    /**
     * 处罚依据具体内容
     */
    private String punishBasisDetailContent;

    /**
     * 违法条款具体内容
     */
    private String illegalClauseDetailContent;
    
    /**
     * 案件来源描述
     */
    private String caseFromContent;

    /**
     * 处罚依据描述
     */
    private String punishBasisContents;
    
    /**
     * 违法条款描述
     */
    private String illegalClauseContents;
    
    public Integer getCaseInfoId() {
        return caseInfoId;
    }

    public void setCaseInfoId(Integer caseInfoId) {
        this.caseInfoId = caseInfoId;
    }

    public String getCaseInfoCompany() {
        return caseInfoCompany;
    }

    public void setCaseInfoCompany(String caseInfoCompany) {
        this.caseInfoCompany = caseInfoCompany;
    }

    public String getCaseInfoFilingPerson() {
        return caseInfoFilingPerson;
    }

    public void setCaseInfoFilingPerson(String caseInfoFilingPerson) {
        this.caseInfoFilingPerson = caseInfoFilingPerson;
    }

    public Integer getCaseFromId() {
        return caseFromId;
    }

    public void setCaseFromId(Integer caseFromId) {
        this.caseFromId = caseFromId;
    }

    public String getCaseInfoTime() {
        return caseInfoTime;
    }

    public void setCaseInfoTime(String caseInfoTime) {
        this.caseInfoTime = caseInfoTime;
    }

    public String getCaseInfoReason() {
        return caseInfoReason;
    }

    public void setCaseInfoReason(String caseInfoReason) {
        this.caseInfoReason = caseInfoReason;
    }

    public String getIllegalClauseIds() {
        return illegalClauseIds;
    }

    public void setIllegalClauseIds(String illegalClauseIds) {
        this.illegalClauseIds = illegalClauseIds;
    }

    public String getPunishBasisIds() {
        return punishBasisIds;
    }

    public void setPunishBasisIds(String punishBasisIds) {
        this.punishBasisIds = punishBasisIds;
    }

    public String getPunishBasisDetailContent() {
        return punishBasisDetailContent;
    }

    public void setPunishBasisDetailContent(String punishBasisDetailContent) {
        this.punishBasisDetailContent = punishBasisDetailContent;
    }

    public String getIllegalClauseDetailContent() {
        return illegalClauseDetailContent;
    }

    public void setIllegalClauseDetailContent(String illegalClauseDetailContent) {
        this.illegalClauseDetailContent = illegalClauseDetailContent;
    }

	public String getCaseFromContent() {
		return caseFromContent;
	}

	public void setCaseFromContent(String caseFromContent) {
		this.caseFromContent = caseFromContent;
	}

	public String getPunishBasisContents() {
		return punishBasisContents;
	}

	public void setPunishBasisContents(String punishBasisContents) {
		this.punishBasisContents = punishBasisContents;
	}

	public String getIllegalClauseContents() {
		return illegalClauseContents;
	}

	public void setIllegalClauseContents(String illegalClauseContents) {
		this.illegalClauseContents = illegalClauseContents;
	}
    
    
}