package com.foodregulation.dao.entity;

public class IllegalClause {
    private Integer illegalClauseId;

    private String illegalClauseCode;

    private String illegalClauseContent;

    public Integer getIllegalClauseId() {
        return illegalClauseId;
    }

    public void setIllegalClauseId(Integer illegalClauseId) {
        this.illegalClauseId = illegalClauseId;
    }

    public String getIllegalClauseCode() {
        return illegalClauseCode;
    }

    public void setIllegalClauseCode(String illegalClauseCode) {
        this.illegalClauseCode = illegalClauseCode;
    }

    public String getIllegalClauseContent() {
        return illegalClauseContent;
    }

    public void setIllegalClauseContent(String illegalClauseContent) {
        this.illegalClauseContent = illegalClauseContent;
    }
}