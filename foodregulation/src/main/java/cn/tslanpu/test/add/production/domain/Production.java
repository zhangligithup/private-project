package cn.tslanpu.test.add.production.domain;

public class Production {
	
	private int id;
	private String qyname;		//企业名称
	private String address;		//所属行政区域
	private String scaddress;	//生产地址
	private String ems;			//邮政编码
	private String phone;		//固定电话
	private String fax;			//传真
	private String email;		//电子邮箱
	private String jjtype;		//经济类型
	private String gsorganization;//登记机关
	private String zzcode;		//注册号
	private String cldate;		//成立日期
	private String nzyield;     //年产总值
	private String fddelegate;  //法定代表人
	private String fdphone;     //法定代表人手机号
	private String qydelegate;  //企业负责人
	private String qyphone;		//企业负责人手机号
	private String cynumber;	//从业人员数量
	private String assay;		//化验人员数量
	private String department;	//监管单位
	private String spdelegate;	//监管人员
	private String jiandurenyuan;//监督人员
	private String xieguanrenyuan;//协管人员
	private String scpermit;	//食品生产许可证编号
	private String fazhengjiguan;//发证机关		
	private String fazhengriqi;	 //发证日期
	private String youxiaodate;	 //有效日期
	private String longitude;	 //经度
	private String latitude;	 //维度      28
	
	private String isoapprove;	 //iso质量管理体系认证
	private String hacccpapprove;//HACCP认证
	private String wghapprove;	 //无公害食品认证
	private String lsapprove;	 //绿色食品认证
	private String yjapprove;    //有机食品认证
	private String capprove;	 //C标志认证	6
	
	private String chanpinName;	 //产品名称
	private String zxbzName;	 //执行标准名称
	private String zxbzCode;	 //执行标准编号
	private String beian;		 //是否备案		4
	
	private String cpName;		 //产品名称 产品明细中
	private String guiGe;		 //规格
	private String nianChanLiang;//年产量		3
	
	private String additive;	 //添加剂名称
	private String additiveComposition;//添加剂主要成分
	private String addFoodName;	 //需要添加食品名称
	private String maxAmount;	 //标准规格最大使用量
	private String amount;       //实际用量
	private String handlers;	 //操作者		6
	
	private String chanPinLeiBie;//委托加工产品名称
	private String wtChanPinName;//委托方企业名称
	private String wtQyName;	 //委托方企业名称
	private String wtScAddress;	 //委托方生产地址
	private String wtLinkman;	 //委托方联系人
	private String wtTel;		 //委托方联系人电话
	private String bwtQyName;	 //被委托方企业名称
	private String bwtScAddress; //被委托方生产地址
	private String bwtLinkName;	 //被委托方联系人
	private String bwtTel;		 //联系电话
	private String htSxDate;	 //合同生效日期
	private String wtHtDate;	 //委托合同期限	13
	
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
	public String getCynumber() {
		return cynumber;
	}
	public void setCynumber(String cynumber) {
		this.cynumber = cynumber;
	}
	public String getAssay() {
		return assay;
	}
	public void setAssay(String assay) {
		this.assay = assay;
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
	public String getIsoapprove() {
		return isoapprove;
	}
	public void setIsoapprove(String isoapprove) {
		this.isoapprove = isoapprove;
	}
	public String getHacccpapprove() {
		return hacccpapprove;
	}
	public void setHacccpapprove(String hacccpapprove) {
		this.hacccpapprove = hacccpapprove;
	}
	public String getWghapprove() {
		return wghapprove;
	}
	public void setWghapprove(String wghapprove) {
		this.wghapprove = wghapprove;
	}
	public String getLsapprove() {
		return lsapprove;
	}
	public void setLsapprove(String lsapprove) {
		this.lsapprove = lsapprove;
	}
	public String getYjapprove() {
		return yjapprove;
	}
	public void setYjapprove(String yjapprove) {
		this.yjapprove = yjapprove;
	}
	public String getCapprove() {
		return capprove;
	}
	public void setCapprove(String capprove) {
		this.capprove = capprove;
	}
	public String getChanpinName() {
		return chanpinName;
	}
	public void setChanpinName(String chanpinName) {
		this.chanpinName = chanpinName;
	}
	public String getZxbzName() {
		return zxbzName;
	}
	public void setZxbzName(String zxbzName) {
		this.zxbzName = zxbzName;
	}
	public String getZxbzCode() {
		return zxbzCode;
	}
	public void setZxbzCode(String zxbzCode) {
		this.zxbzCode = zxbzCode;
	}
	public String getBeian() {
		return beian;
	}
	public void setBeian(String beian) {
		this.beian = beian;
	}
	public String getCpName() {
		return cpName;
	}
	public void setCpName(String cpName) {
		this.cpName = cpName;
	}
	public String getGuiGe() {
		return guiGe;
	}
	public void setGuiGe(String guiGe) {
		this.guiGe = guiGe;
	}
	public String getNianChanLiang() {
		return nianChanLiang;
	}
	public void setNianChanLiang(String nianChanLiang) {
		this.nianChanLiang = nianChanLiang;
	}
	public String getAdditive() {
		return additive;
	}
	public void setAdditive(String additive) {
		this.additive = additive;
	}
	public String getAdditiveComposition() {
		return additiveComposition;
	}
	public void setAdditiveComposition(String additiveComposition) {
		this.additiveComposition = additiveComposition;
	}
	public String getAddFoodName() {
		return addFoodName;
	}
	public void setAddFoodName(String addFoodName) {
		this.addFoodName = addFoodName;
	}
	public String getMaxAmount() {
		return maxAmount;
	}
	public void setMaxAmount(String maxAmount) {
		this.maxAmount = maxAmount;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getHandlers() {
		return handlers;
	}
	public void setHandlers(String handlers) {
		this.handlers = handlers;
	}
	public String getChanPinLeiBie() {
		return chanPinLeiBie;
	}
	public void setChanPinLeiBie(String chanPinLeiBie) {
		this.chanPinLeiBie = chanPinLeiBie;
	}
	public String getWtChanPinName() {
		return wtChanPinName;
	}
	public void setWtChanPinName(String wtChanPinName) {
		this.wtChanPinName = wtChanPinName;
	}
	public String getWtQyName() {
		return wtQyName;
	}
	public void setWtQyName(String wtQyName) {
		this.wtQyName = wtQyName;
	}
	public String getWtScAddress() {
		return wtScAddress;
	}
	public void setWtScAddress(String wtScAddress) {
		this.wtScAddress = wtScAddress;
	}
	public String getWtLinkman() {
		return wtLinkman;
	}
	public void setWtLinkman(String wtLinkman) {
		this.wtLinkman = wtLinkman;
	}
	public String getWtTel() {
		return wtTel;
	}
	public void setWtTel(String wtTel) {
		this.wtTel = wtTel;
	}
	public String getBwtQyName() {
		return bwtQyName;
	}
	public void setBwtQyName(String bwtQyName) {
		this.bwtQyName = bwtQyName;
	}
	public String getBwtScAddress() {
		return bwtScAddress;
	}
	public void setBwtScAddress(String bwtScAddress) {
		this.bwtScAddress = bwtScAddress;
	}
	public String getBwtLinkName() {
		return bwtLinkName;
	}
	public void setBwtLinkName(String bwtLinkName) {
		this.bwtLinkName = bwtLinkName;
	}
	public String getBwtTel() {
		return bwtTel;
	}
	public void setBwtTel(String bwtTel) {
		this.bwtTel = bwtTel;
	}
	public String getHtSxDate() {
		return htSxDate;
	}
	public void setHtSxDate(String htSxDate) {
		this.htSxDate = htSxDate;
	}
	public String getWtHtDate() {
		return wtHtDate;
	}
	public void setWtHtDate(String wtHtDate) {
		this.wtHtDate = wtHtDate;
	}
}
