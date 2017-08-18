package cn.tslanpu.test.add.agricultural.domain;

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
	
	private String amend;		 //最后修改人
	
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
