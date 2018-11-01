package cn.tslanpu.test.add.drug.domain;

public class Drug {
	private int id;
	private String qyname;		//企业名称
	private String address;		//所属行政区域
	private String scaddress;	//经营地址
	private String ems;			//邮政编码
	private String phone;		//固定电话
	private String fax;			//传真
	private String email;		//电子邮箱
	private String jjtype;		//经济类型
	private String gsorganization;//登记机关
	private String zzcode;		//注册号/统一社会信用代码
	private String fddelegate;  //法定代表人
	private String fdeduc;     //法定代表人学历
	private String fdprofess;     //法定代表人执业药师或技术职称
	private String qydelegate;  //企业负责人
	private String qyeduc;		//企业负责人学历
	private String qyprofess;     //企业负责人执业药师或技术职称
	private String zldelegate;  //质量负责人
	private String zleduc;     //质量负责人学历
	private String zlprofess;     //质量负责人执业药师或技术职称
	private String zydelegate;  //中药负责人
	private String zyeduc;		//中药负责人学历
	private String zyprofess;     //中药负责人执业药师或技术职称
	private String scpermit;	//食品生产许可证编号
	private String fazhengjiguan;//发证机关		
	private String fazhengriqi;	 //发证日期
	private String youxiaodate;	 //有效日期
	private String gsppermit;	//gsp编号
	private String gspfazhengjiguan;//gsp发证机关		
	private String gspfazhengriqi;	 //gsp发证日期
	private String gspyouxiaodate;	 //gsp有效日期
	private String department;	//监管单位
	private String spdelegate;	//监管人员
	private String jiandurenyuan;//监督人员
	private String xieguanrenyuan;//协管人员

	
	private String longitude;	 //经度
	private String latitude;	 //维度      28
	
	//经营范围
	private String jyrange;		//经营范围
	
	
	//仓贮情况
	private String zhongarea;		//总面积
	private String changarea;	//常温库
	private String yinarea;	//阴凉库
	private String lengarea;	//冷库
	//管理情况	
	private String manage;		//管理情况
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
	public String getFdeduc() {
		return fdeduc;
	}
	public void setFdeduc(String fdeduc) {
		this.fdeduc = fdeduc;
	}
	public String getFdprofess() {
		return fdprofess;
	}
	public void setFdprofess(String fdprofess) {
		this.fdprofess = fdprofess;
	}
	public String getQydelegate() {
		return qydelegate;
	}
	public void setQydelegate(String qydelegate) {
		this.qydelegate = qydelegate;
	}
	public String getQyeduc() {
		return qyeduc;
	}
	public void setQyeduc(String qyeduc) {
		this.qyeduc = qyeduc;
	}
	public String getQyprofess() {
		return qyprofess;
	}
	public void setQyprofess(String qyprofess) {
		this.qyprofess = qyprofess;
	}
	public String getZldelegate() {
		return zldelegate;
	}
	public void setZldelegate(String zldelegate) {
		this.zldelegate = zldelegate;
	}
	public String getZleduc() {
		return zleduc;
	}
	public void setZleduc(String zleduc) {
		this.zleduc = zleduc;
	}
	public String getZlprofess() {
		return zlprofess;
	}
	public void setZlprofess(String zlprofess) {
		this.zlprofess = zlprofess;
	}
	public String getZydelegate() {
		return zydelegate;
	}
	public void setZydelegate(String zydelegate) {
		this.zydelegate = zydelegate;
	}
	public String getZyeduc() {
		return zyeduc;
	}
	public void setZyeduc(String zyeduc) {
		this.zyeduc = zyeduc;
	}
	public String getZyprofess() {
		return zyprofess;
	}
	public void setZyprofess(String zyprofess) {
		this.zyprofess = zyprofess;
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
	public String getGsppermit() {
		return gsppermit;
	}
	public void setGsppermit(String gsppermit) {
		this.gsppermit = gsppermit;
	}
	public String getGspfazhengjiguan() {
		return gspfazhengjiguan;
	}
	public void setGspfazhengjiguan(String gspfazhengjiguan) {
		this.gspfazhengjiguan = gspfazhengjiguan;
	}
	public String getGspfazhengriqi() {
		return gspfazhengriqi;
	}
	public void setGspfazhengriqi(String gspfazhengriqi) {
		this.gspfazhengriqi = gspfazhengriqi;
	}
	public String getGspyouxiaodate() {
		return gspyouxiaodate;
	}
	public void setGspyouxiaodate(String gspyouxiaodate) {
		this.gspyouxiaodate = gspyouxiaodate;
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
	public String getJyrange() {
		return jyrange;
	}
	public void setJyrange(String jyrange) {
		this.jyrange = jyrange;
	}
	public String getZhongarea() {
		return zhongarea;
	}
	public void setZhongarea(String zhongarea) {
		this.zhongarea = zhongarea;
	}
	public String getChangarea() {
		return changarea;
	}
	public void setChangarea(String changarea) {
		this.changarea = changarea;
	}
	public String getYinarea() {
		return yinarea;
	}
	public void setYinarea(String yinarea) {
		this.yinarea = yinarea;
	}
	public String getLengarea() {
		return lengarea;
	}
	public void setLengarea(String lengarea) {
		this.lengarea = lengarea;
	}
	public String getManage() {
		return manage;
	}
	public void setManage(String manage) {
		this.manage = manage;
	}
	public String getAmend() {
		return amend;
	}
	public void setAmend(String amend) {
		this.amend = amend;
	}
	
	
}
