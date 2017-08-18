package com.foodregulation.dao.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang.StringUtils;

public class Examination
  implements Serializable
{
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

  public Long getId()
  {
    return this.id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getTemplateName() {
    return this.templateName;
  }

  public void setTemplateName(String templateName) {
    this.templateName = (templateName == null ? null : templateName.trim());
  }

  public String getChoiceCount() {
    return this.choiceCount;
  }

  public void setChoiceCount(String choiceCount) {
    this.choiceCount = (choiceCount == null ? null : choiceCount.trim());
  }

  public String getChoiceScore() {
    return this.choiceScore;
  }

  public void setChoiceScore(String choiceScore) {
    this.choiceScore = (StringUtils.isBlank(choiceScore) ? "0" : choiceScore.trim());
  }

  public String getJudgmentCount() {
    return this.judgmentCount;
  }

  public void setJudgmentCount(String judgmentCount) {
    this.judgmentCount = (judgmentCount == null ? null : judgmentCount.trim());
  }

  public String getJudgmentScore() {
    return this.judgmentScore;
  }

  public void setJudgmentScore(String judgmentScore) {
    this.judgmentScore = (StringUtils.isBlank(judgmentScore) ? "0" : judgmentScore.trim());
  }

  public String getCompletionCount() {
    return this.completionCount;
  }

  public void setCompletionCount(String completionCount) {
    this.completionCount = (completionCount == null ? null : completionCount.trim());
  }

  public String getCompletionScore() {
    return this.completionScore;
  }

  public void setCompletionScore(String completionScore) {
    this.completionScore = (StringUtils.isBlank(completionScore) ? "0" : completionScore.trim());
  }

  public Long getEnterpriseCount() {
    return this.enterpriseCount;
  }

  public void setEnterpriseCount(Long enterpriseCount) {
    this.enterpriseCount = enterpriseCount;
  }

  public Long getCompleteCount() {
    return this.completeCount;
  }

  public void setCompleteCount(Long completeCount) {
    this.completeCount = completeCount;
  }

  public Date getCreateTime() {
    return this.createTime;
  }

  public void setCreateTime(Date createTime) {
    this.createTime = createTime;
  }

  public List<Long> getChoiceList() {
    return this.choiceList;
  }

  public void setChoiceList(List<Long> choiceList) {
    this.choiceList = choiceList;
  }

  public List<Long> getJudgmentList() {
    return this.judgmentList;
  }

  public void setJudgmentList(List<Long> judgmentList) {
    this.judgmentList = judgmentList;
  }

  public List<Long> getCompletionList() {
    return this.completionList;
  }

  public void setCompletionList(List<Long> completionList) {
    this.completionList = completionList;
  }

  public String getChoiceTime() {
    return this.choiceTime;
  }

  public void setChoiceTime(String choiceTime) {
    this.choiceTime = (StringUtils.isBlank(choiceTime) ? "0" : choiceTime.trim());
  }

  public String getJudgmentTime() {
    return this.judgmentTime;
  }

  public void setJudgmentTime(String judgmentTime) {
    this.judgmentTime = (StringUtils.isBlank(judgmentTime) ? "0" : judgmentTime.trim());
  }

  public String getCompletionTime() {
    return this.completionTime;
  }

  public void setCompletionTime(String completionTime) {
    this.completionTime = (StringUtils.isBlank(completionTime) ? "0" : completionTime.trim());
  }
}