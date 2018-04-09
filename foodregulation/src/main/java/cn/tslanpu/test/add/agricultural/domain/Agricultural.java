package cn.tslanpu.test.add.agricultural.domain;

import java.util.Date;

public class Agricultural {
	
	private int id;
	private String qyname;		//经营户名称
	private String address;		//所属行政区域
	private String scaddress;	//生产地址
	private String qydelegate;  //企业负责人
	private String qyphone;		//企业负责人手机号
	private String zzcode;		//注册号
	
	private String department;	//监管单位
	private String spdelegate;	//监管人员
	private String jiandurenyuan;//监督人员
	private String xieguanrenyuan;//协管人员
	
	
	private String scpermit;	//食品生产许可证编号
	private String jyType;		//经营方式
	private String itemsOfBusiness;//经营项目
	private String longitude;	 //经度
	private String latitude;	 //维度      28
	
	private String idNumber;
	private String numberOfEmployees;
	private String recordDate;
	private String recordEffectiveDate;
	private String recordOrgan;
	private String recordCardNumber;
	private String mainBody;//主体业态
	private String businessScope;//经营范围
	
	private String amend;		 //最后修改人
	
	private String businessLicense;
	private String smallStallregistrationCard;
	private String healthCertificate;
	
	
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getNumberOfEmployees() {
		return numberOfEmployees;
	}
	public void setNumberOfEmployees(String numberOfEmployees) {
		this.numberOfEmployees = numberOfEmployees;
	}
	public String getRecordDate() {
		return recordDate;
	}
	public void setRecordDate(String recordDate) {
		this.recordDate = recordDate;
	}
	public String getRecordEffectiveDate() {
		return recordEffectiveDate;
	}
	public void setRecordEffectiveDate(String recordEffectiveDate) {
		this.recordEffectiveDate = recordEffectiveDate;
	}
	public String getRecordOrgan() {
		return recordOrgan;
	}
	public void setRecordOrgan(String recordOrgan) {
		this.recordOrgan = recordOrgan;
	}
	public String getRecordCardNumber() {
		return recordCardNumber;
	}
	public void setRecordCardNumber(String recordCardNumber) {
		this.recordCardNumber = recordCardNumber;
	}
	public String getMainBody() {
		return mainBody;
	}
	public void setMainBody(String mainBody) {
		this.mainBody = mainBody;
	}
	public String getBusinessScope() {
		return businessScope;
	}
	public void setBusinessScope(String businessScope) {
		this.businessScope = businessScope;
	}
	public String getBusinessLicense() {
		return businessLicense;
	}
	public void setBusinessLicense(String businessLicense) {
		this.businessLicense = businessLicense;
	}
	public String getSmallStallregistrationCard() {
		return smallStallregistrationCard;
	}
	public void setSmallStallregistrationCard(String smallStallregistrationCard) {
		this.smallStallregistrationCard = smallStallregistrationCard;
	}
	public String getHealthCertificate() {
		return healthCertificate;
	}
	public void setHealthCertificate(String healthCertificate) {
		this.healthCertificate = healthCertificate;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getSpdelegate() {
		return spdelegate;
	}
	public void setSpdelegate(String spdelegate) {
		this.spdelegate = spdelegate;
	}
	public String getJiandurenyuan() {
		return jiandurenyuan;
	}
	public void setJiandurenyuan(String jiandurenyuan) {
		this.jiandurenyuan = jiandurenyuan;
	}
	public String getXieguanrenyuan() {
		return xieguanrenyuan;
	}
	public void setXieguanrenyuan(String xieguanrenyuan) {
		this.xieguanrenyuan = xieguanrenyuan;
	}
	
	
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getAmend() {
		return amend;
	}
	public void setAmend(String amend) {
		this.amend = amend;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getQyname() {
		return qyname;
	}
	public void setQyname(String qyname) {
		this.qyname = qyname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getScaddress() {
		return scaddress;
	}
	public void setScaddress(String scaddress) {
		this.scaddress = scaddress;
	}
	public String getQydelegate() {
		return qydelegate;
	}
	public void setQydelegate(String qydelegate) {
		this.qydelegate = qydelegate;
	}
	public String getQyphone() {
		return qyphone;
	}
	public void setQyphone(String qyphone) {
		this.qyphone = qyphone;
	}
	public String getZzcode() {
		return zzcode;
	}
	public void setZzcode(String zzcode) {
		this.zzcode = zzcode;
	}
	public String getScpermit() {
		return scpermit;
	}
	public void setScpermit(String scpermit) {
		this.scpermit = scpermit;
	}
	public String getJyType() {
		return jyType;
	}
	public void setJyType(String jyType) {
		this.jyType = jyType;
	}
	public String getItemsOfBusiness() {
		return itemsOfBusiness;
	}
	public void setItemsOfBusiness(String itemsOfBusiness) {
		this.itemsOfBusiness = itemsOfBusiness;
	}
}
