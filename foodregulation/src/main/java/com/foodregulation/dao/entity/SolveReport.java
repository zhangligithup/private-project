package com.foodregulation.dao.entity;


public class SolveReport {
    private Long solveReportId;

    private Long reportId;

    private String isSatisfied;

    private String isRecord;

    private String createPepole;

    private String solveSituation;
    
    private String imgUrl;
    
    public Long getSolveReportId() {
        return solveReportId;
    }

    public void setSolveReportId(Long solveReportId) {
        this.solveReportId = solveReportId;
    }

    public Long getReportId() {
        return reportId;
    }

    public void setReportId(Long reportId) {
        this.reportId = reportId;
    }

    public String getIsSatisfied() {
        return isSatisfied;
    }

    public void setIsSatisfied(String isSatisfied) {
        this.isSatisfied = isSatisfied;
    }

    public String getIsRecord() {
        return isRecord;
    }

    public void setIsRecord(String isRecord) {
        this.isRecord = isRecord;
    }

    public String getCreatePepole() {
        return createPepole;
    }

    public void setCreatePepole(String createPepole) {
        this.createPepole = createPepole;
    }

    public String getSolveSituation() {
        return solveSituation;
    }

    public void setSolveSituation(String solveSituation) {
        this.solveSituation = solveSituation;
    }

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
}