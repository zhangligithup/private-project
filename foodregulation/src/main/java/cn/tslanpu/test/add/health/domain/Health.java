package cn.tslanpu.test.add.health.domain;

public class Health {
	private int id;
	private String qyname;		//企业名称
	private String address;		//所属行政区域
	private String scaddress;	//经营地址地址
	private String ems;			//邮政编码
	private String phone;		//固定电话
	private String fax;			//传真
	private String email;		//电子邮箱
	private String jjtype;		//经济类型
	private String gsorganization;//登记机关
	private String zzcode;		//注册号/统一社会信用代码
	private String fddelegate;  //法定代表人
	private String fdphone;     //法定代表人手机号
	private String qydelegate;  //企业负责人
	private String qyphone;		//企业负责人手机号
	private String department;	//监管单位
	private String spdelegate;	//监管人员
	private String jiandurenyuan;//监督人员
	private String xieguanrenyuan;//协管人员
	private String jyArea;		//经营面积
	private String jyNum;		//经营品种个数
	private String scpermit;	//食品生产许可证编号
	private String fazhengjiguan;//发证机关		
	private String fazhengriqi;	 //发证日期
	private String youxiaodate;	 //有效日期
	private String longitude;	 //经度
	private String latitude;	 //维度      
	
	//经营方式
	private String jyType;		//经营方式
	private String healthFood;	//保健食品
	private String cosmetic;	//化妆品
	
	//人员情况
	private String cyNum;		//从业人员数
	private String graduateNum;	//中专人数
	private String juniorNum;	//大专人数
	
	//管理情况	
	private String manage;		//管理情况
	private String amend;		 //最后修改人
	
	
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
	public String getHealthFood() {
		return healthFood;
	}

	public void setHealthFood(String healthFood) {
		this.healthFood = healthFood;
	}

	public String getCosmetic() {
		return cosmetic;
	}

	public void setCosmetic(String cosmetic) {
		this.cosmetic = cosmetic;
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

	public String getEms() {
		return ems;
	}

	public void setEms(String ems) {
		this.ems = ems;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJjtype() {
		return jjtype;
	}

	public void setJjtype(String jjtype) {
		this.jjtype = jjtype;
	}

	public String getGsorganization() {
		return gsorganization;
	}

	public void setGsorganization(String gsorganization) {
		this.gsorganization = gsorganization;
	}

	public String getZzcode() {
		return zzcode;
	}

	public void setZzcode(String zzcode) {
		this.zzcode = zzcode;
	}

	public String getFddelegate() {
		return fddelegate;
	}

	public void setFddelegate(String fddelegate) {
		this.fddelegate = fddelegate;
	}

	public String getFdphone() {
		return fdphone;
	}

	public void setFdphone(String fdphone) {
		this.fdphone = fdphone;
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

	public String getJyArea() {
		return jyArea;
	}

	public void setJyArea(String jyArea) {
		this.jyArea = jyArea;
	}

	public String getJyNum() {
		return jyNum;
	}

	public void setJyNum(String jyNum) {
		this.jyNum = jyNum;
	}

	public String getScpermit() {
		return scpermit;
	}

	public void setScpermit(String scpermit) {
		this.scpermit = scpermit;
	}

	public String getFazhengjiguan() {
		return fazhengjiguan;
	}

	public void setFazhengjiguan(String fazhengjiguan) {
		this.fazhengjiguan = fazhengjiguan;
	}

	public String getFazhengriqi() {
		return fazhengriqi;
	}

	public void setFazhengriqi(String fazhengriqi) {
		this.fazhengriqi = fazhengriqi;
	}

	public String getYouxiaodate() {
		return youxiaodate;
	}

	public void setYouxiaodate(String youxiaodate) {
		this.youxiaodate = youxiaodate;
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

	public String getJyType() {
		return jyType;
	}

	public void setJyType(String jyType) {
		this.jyType = jyType;
	}

	public String getCyNum() {
		return cyNum;
	}

	public void setCyNum(String cyNum) {
		this.cyNum = cyNum;
	}

	public String getGraduateNum() {
		return graduateNum;
	}

	public void setGraduateNum(String graduateNum) {
		this.graduateNum = graduateNum;
	}

	public String getJuniorNum() {
		return juniorNum;
	}

	public void setJuniorNum(String juniorNum) {
		this.juniorNum = juniorNum;
	}

	public String getManage() {
		return manage;
	}

	public void setManage(String manage) {
		this.manage = manage;
	}
	
}
