package cn.tslanpu.test.add.food.domain;

public class Food {
	private int id;
	private String qyname;		//企业名称
	private String address;		//所属行政区域
	private String scaddress;	//生产地址
	private String ems;			//邮政编码
	
	private String fddelegate;  //法定代表人
	private String fdphone;     //法定代表人手机号
	
	private String qydelegate;  //企业负责人
	private String qyphone;		//企业负责人手机号
	private String jjtype;		//经济类型
	private String email;		//电子邮箱
	private String gsorganization;//登记机关
	private String zzcode;		//注册号/统一社会信用代码
	
	private String cldate;		//成立日期
	private String nzyield;     //年产销售额(万元)
	
	private String cyNum;		//从业人员数
	private String seats;		//就餐座位数
	private String jyArea;		 //加工场所面积
	private String healthNum;	//持健康证数
	
	private String department;	//监管单位
	private String spdelegate;	//监管人员
	private String jiandurenyuan;//监督人员
	private String xieguanrenyuan;//协管人员
	
	private String scpermit;	//食品生产许可证编号
	private String fazhengjiguan;//发证机关		
	private String fazhengriqi;	 //发证日期
	private String youxiaodate;	 //有效日期
	private String longitude;	 //经度
	private String latitude;	 //维度 
	
	private String type;		//类型
	private String remark;		//备注
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
	public String getJjtype() {
		return jjtype;
	}
	public void setJjtype(String jjtype) {
		this.jjtype = jjtype;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getCldate() {
		return cldate;
	}
	public void setCldate(String cldate) {
		this.cldate = cldate;
	}
	public String getNzyield() {
		return nzyield;
	}
	public void setNzyield(String nzyield) {
		this.nzyield = nzyield;
	}
	public String getCyNum() {
		return cyNum;
	}
	public void setCyNum(String cyNum) {
		this.cyNum = cyNum;
	}
	public String getSeats() {
		return seats;
	}
	public void setSeats(String seats) {
		this.seats = seats;
	}
	public String getJyArea() {
		return jyArea;
	}
	public void setJyArea(String jyArea) {
		this.jyArea = jyArea;
	}
	public String getHealthNum() {
		return healthNum;
	}
	public void setHealthNum(String healthNum) {
		this.healthNum = healthNum;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
