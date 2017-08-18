package com.foodregulation.dao.entity;

public class SupervisionAndCheck {
	private Integer id;

	// 被检查单位名称
	private String checkedEnterpriseName;
	// 检查人员姓名
	private String checkPersonName;
	// 检查人员执法编号
	private String checkPersonCode;
	// 检查地点
	private String checkAddress;
	// 被检查企业意见
	private String checkedEnterpriseOption;
	// 检查项目，以json格式保存
	private String checkProject;
	// 企业类别编码
	private String enterpriseTypeCode;
	// 监管单位代码
	private String checkUnitCode;

	private String supervisionandcheckcol;
	// 检查结束时间
	private String checkEndTime;
	// 重点问题明细，以逗号分隔
	private String zhongdianQuestion;
	// 一般问题明细以逗号分隔
	private String yibanQuestion;
	// 检查开始时间
	private String checkedStartTime;
	// 其它问题
	private String otherQuestion;
	// 检查日期
	private String checkDate;
	// 检查结果
	private String checkResult;
	// 结果处理
	private String resultHandle;
	
	private Integer inspectionRecordId;
	
	private String inspectionRecordStr;
	
	private Integer proposalId;
	
	private String proposalStr;
	
	private Integer noticeId;
	
	private String noticeStr;
	
	private Integer taskId;
	
	private String imgUrl;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCheckedEnterpriseName() {
		return checkedEnterpriseName;
	}

	public void setCheckedEnterpriseName(String checkedEnterpriseName) {
		this.checkedEnterpriseName = checkedEnterpriseName == null ? null : checkedEnterpriseName.trim();
	}

	public String getCheckPersonName() {
		return checkPersonName;
	}

	public void setCheckPersonName(String checkPersonName) {
		this.checkPersonName = checkPersonName == null ? null : checkPersonName.trim();
	}

	public String getCheckPersonCode() {
		return checkPersonCode;
	}

	public void setCheckPersonCode(String checkPersonCode) {
		this.checkPersonCode = checkPersonCode == null ? null : checkPersonCode.trim();
	}

	public String getCheckAddress() {
		return checkAddress;
	}

	public void setCheckAddress(String checkAddress) {
		this.checkAddress = checkAddress == null ? null : checkAddress.trim();
	}

	public String getCheckedEnterpriseOption() {
		return checkedEnterpriseOption;
	}

	public void setCheckedEnterpriseOption(String checkedEnterpriseOption) {
		this.checkedEnterpriseOption = checkedEnterpriseOption == null ? null : checkedEnterpriseOption.trim();
	}

	public String getCheckProject() {
		return checkProject;
	}

	public void setCheckProject(String checkProject) {
		this.checkProject = checkProject == null ? null : checkProject.trim();
	}

	public String getEnterpriseTypeCode() {
		return enterpriseTypeCode;
	}

	public void setEnterpriseTypeCode(String enterpriseTypeCode) {
		this.enterpriseTypeCode = enterpriseTypeCode == null ? null : enterpriseTypeCode.trim();
	}

	public String getCheckUnitCode() {
		return checkUnitCode;
	}

	public void setCheckUnitCode(String checkUnitCode) {
		this.checkUnitCode = checkUnitCode == null ? null : checkUnitCode.trim();
	}

	public String getSupervisionandcheckcol() {
		return supervisionandcheckcol;
	}

	public void setSupervisionandcheckcol(String supervisionandcheckcol) {
		this.supervisionandcheckcol = supervisionandcheckcol == null ? null : supervisionandcheckcol.trim();
	}

	public String getCheckEndTime() {
		return checkEndTime;
	}

	public void setCheckEndTime(String checkEndTime) {
		this.checkEndTime = checkEndTime == null ? null : checkEndTime.trim();
	}

	public String getZhongdianQuestion() {
		return zhongdianQuestion;
	}

	public void setZhongdianQuestion(String zhongdianQuestion) {
		if("".equals(zhongdianQuestion)){
			this.zhongdianQuestion = "";
		}else{
			this.zhongdianQuestion = zhongdianQuestion;
		}
	}

	public String getYibanQuestion() {
		return yibanQuestion;
	}

	public void setYibanQuestion(String yibanQuestion) {
		if("".equals(yibanQuestion)){
			this.yibanQuestion = "";
		}else{
			this.yibanQuestion = yibanQuestion;
		}
	}

	public String getCheckedStartTime() {
		return checkedStartTime;
	}

	public void setCheckedStartTime(String checkedStartTime) {
		this.checkedStartTime = checkedStartTime == null ? null : checkedStartTime.trim();
	}

	public String getOtherQuestion() {
		return otherQuestion;
	}

	public void setOtherQuestion(String otherQuestion) {
		if("".equals(otherQuestion)){
			this.otherQuestion = "";
		}else{
			this.otherQuestion = otherQuestion;
		}
	}

	public String getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate == null ? null : checkDate.trim();
	}

	public String getCheckResult() {
		return checkResult;
	}

	public void setCheckResult(String checkResult) {
		this.checkResult = checkResult;
	}

	public String getResultHandle() {
		return resultHandle;
	}

	public void setResultHandle(String resultHandle) {
		this.resultHandle = resultHandle;
	}

	public Integer getInspectionRecordId() {
		return inspectionRecordId;
	}

	public void setInspectionRecordId(Integer inspectionRecordId) {
		this.inspectionRecordId = inspectionRecordId;
		if(inspectionRecordId!=null){
			this.inspectionRecordStr = "现场检查笔录";
		}else{
			this.inspectionRecordStr = "";
		}
	}

	public Integer getProposalId() {
		return proposalId;
	}

	public void setProposalId(Integer proposalId) {
		this.proposalId = proposalId;
		if(proposalId!=null){
			this.proposalStr = "监督检查意见书";
		}else{
			this.proposalStr = "";
		}
	}

	public Integer getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(Integer noticeId) {
		this.noticeId = noticeId;
		if(noticeId!=null){
			this.noticeStr = "责令整改通知书";
		}else{
			this.noticeStr = "";
		}
	}

	public Integer getTaskId() {
		return taskId;
	}

	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getInspectionRecordStr() {
		return inspectionRecordStr;
	}

	public void setInspectionRecordStr(String inspectionRecordStr) {
		this.inspectionRecordStr = inspectionRecordStr;
	}

	public String getProposalStr() {
		return proposalStr;
	}

	public void setProposalStr(String proposalStr) {
		this.proposalStr = proposalStr;
	}

	public String getNoticeStr() {
		return noticeStr;
	}

	public void setNoticeStr(String noticeStr) {
		this.noticeStr = noticeStr;
	}
	
}