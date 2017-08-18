package com.foodregulation.dao.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Examination implements Serializable {
    private Long id;

    private String templateName;

    private String choiceCount;

    private String choiceScore;
    
    private String choiceTime;

    private String judgmentCount;

    private String judgmentScore;
    
    private String judgmentTime;

    private String completionCount;

    private String completionScore;
    
    private String completionTime;

    private Long enterpriseCount;

    private Long completeCount;

    private Date createTime;

    private List<Long> choiceList;

    private List<Long> judgmentList;

    private List<Long> completionList;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName == null ? null : templateName.trim();
    }

    public String getChoiceCount() {
        return choiceCount;
    }

    public void setChoiceCount(String choiceCount) {
        this.choiceCount = choiceCount == null ? null : choiceCount.trim();
    }

    public String getChoiceScore() {
        return choiceScore;
    }

    public void setChoiceScore(String choiceScore) {
        this.choiceScore = choiceScore == null ? null : choiceScore.trim();
    }

    public String getJudgmentCount() {
        return judgmentCount;
    }

    public void setJudgmentCount(String judgmentCount) {
        this.judgmentCount = judgmentCount == null ? null : judgmentCount.trim();
    }

    public String getJudgmentScore() {
        return judgmentScore;
    }

    public void setJudgmentScore(String judgmentScore) {
        this.judgmentScore = judgmentScore == null ? null : judgmentScore.trim();
    }

    public String getCompletionCount() {
        return completionCount;
    }

    public void setCompletionCount(String completionCount) {
        this.completionCount = completionCount == null ? null : completionCount.trim();
    }

    public String getCompletionScore() {
        return completionScore;
    }

    public void setCompletionScore(String completionScore) {
        this.completionScore = completionScore == null ? null : completionScore.trim();
    }

    public Long getEnterpriseCount() {
        return enterpriseCount;
    }

    public void setEnterpriseCount(Long enterpriseCount) {
        this.enterpriseCount = enterpriseCount;
    }

    public Long getCompleteCount() {
        return completeCount;
    }

    public void setCompleteCount(Long completeCount) {
        this.completeCount = completeCount;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public List<Long> getChoiceList() {
        return choiceList;
    }

    public void setChoiceList(List<Long> choiceList) {
        this.choiceList = choiceList;
    }

    public List<Long> getJudgmentList() {
        return judgmentList;
    }

    public void setJudgmentList(List<Long> judgmentList) {
        this.judgmentList = judgmentList;
    }

    public List<Long> getCompletionList() {
        return completionList;
    }

    public void setCompletionList(List<Long> completionList) {
        this.completionList = completionList;
    }

	public String getChoiceTime() {
		return choiceTime;
	}

	public void setChoiceTime(String choiceTime) {
		this.choiceTime = choiceTime;
	}

	public String getJudgmentTime() {
		return judgmentTime;
	}

	public void setJudgmentTime(String judgmentTime) {
		this.judgmentTime = judgmentTime;
	}

	public String getCompletionTime() {
		return completionTime;
	}

	public void setCompletionTime(String completionTime) {
		this.completionTime = completionTime;
	}
}