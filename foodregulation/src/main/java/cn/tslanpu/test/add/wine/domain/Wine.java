package cn.tslanpu.test.add.wine.domain;

public class Wine {
	private int id;
	private String qyname;		//企业名称
	private String address;		//所属行政区域
	private String scaddress;	//经营场所地址
	private String ems;			//邮政编码
	private String lerepre;  //法定代表人
	private String lephone;		//法定代表人手机号
	private String qydelegate;  //企业负责人
	private String qyphone;		//企业负责人手机号
	private String zzcode;		//注册号/统一社会信用代码
	
	private String cldate;		//成立日期
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
	

	//经营类型
	private String jytype;  
	
	//经营范围
	private String jyrange;  
	

	public String getJytype() {
		return jytype;
	}

	public void setJytype(String jytype) {
		this.jytype = jytype;
	}

	public String getJyrange() {
		return jyrange;
	}

	public void setJyrange(String jyrange) {
		this.jyrange = jyrange;
	}

	private String amend;		 //最后修改人
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
		this.qyname = qyname == null?null:qyname.trim();
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
	public String getLerepre() {
		return lerepre;
	}

	public void setLerepre(String lerepre) {
		this.lerepre = lerepre;
	}

	public String getLephone() {
		return lephone;
	}

	public void setLephone(String lephone) {
		this.lephone = lephone;
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

	
}
