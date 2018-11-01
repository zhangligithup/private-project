package cn.tslanpu.test.add.Criculate.domain;

public class Criculate {
	private int id;
	private String qyname;		//企业名称
	private String address;		//所属行政区域
	private String scaddress;	//生产地址
	private String ems;			//邮政编码
	private String qydelegate;  //企业负责人
	private String qyphone;		//企业负责人手机号
	
	private String fddelegate;  //法定代表人
	private String fdphone;     //法定代表人手机号
	
	private String jjtype;		//经济类型
	private String email;		//电子邮箱
	private String gsorganization;//登记机关
	private String zzcode;		//注册号/统一社会信用代码
	
	private String cldate;		//成立日期
	private String nzyield;     //年产销售额(万元)
	private String jyArea;		 //经营面积(平方米)
	private String propertyOwner; //产权人
	private String fangWuDate;	//房屋使用期限
	private String fangWuWay; 	//房屋使用方式
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
	
	
	//业态类别
	private String foodMarket;	 //食品集中交易市场
	private String superMarket;  //商场超市
	private String cvs;	         //便利店
	private String store;	 	 //食杂店
	
	private String foodTrade;    //食品贸易
	private String foodLogistics;	//食品物流配送
	private String nonStoreFoodBusiness;	//无店铺食品经营
	
	
	//无店铺经营方式
	private String onlineShop;	//网上商店
	private String mailOrder;	//邮购
	private String televisedShopping;  //电视电话购物
	private String automat;     //自动售货机
	
	//许可范围
	private String piFa;  		//批发
	private String packFood;	//包装食品
	private String bulkFood;	//散装食品
	
	private String dairyProduct;  //乳制品
	private String hanBaby;		//含婴幼儿配方乳粉
	private String noBody;		//不含婴幼儿配方乳粉
	private String foodProduct; //食用农产品
	private String waterProduct;//含水产品
	private String freshAnimalProduct;		//含冷鲜畜禽产品
	private String healthProduct;  //保健品
	
	private String retail;  		//零售
	private String lsPackFood;		//预包装食品
	private String lsBulkFood;		//散装食品
	
	private String cookedFood;		//含熟食
	private String noCookedFood;	//不含熟食
	private String lsDairyProduct; 	//乳制品
	private String lsHanBaby;		//含婴幼儿配方乳粉
	private String lsNoBody;		//不含婴幼儿配方乳粉
	private String lsFoodProduct; 	//食用农产品
	private String lsWaterProduct;	//含水产品
	private String lsFreshAnimalProduct;		//含冷鲜畜禽产品
	private String lsHealthProduct;  	//保健品
	private String scene;			//现场制售
	
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

	public String getJyArea() {
		return jyArea;
	}

	public void setJyArea(String jyArea) {
		this.jyArea = jyArea;
	}

	public String getPropertyOwner() {
		return propertyOwner;
	}

	public void setPropertyOwner(String propertyOwner) {
		this.propertyOwner = propertyOwner;
	}

	public String getFangWuDate() {
		return fangWuDate;
	}

	public void setFangWuDate(String fangWuDate) {
		this.fangWuDate = fangWuDate;
	}

	public String getFangWuWay() {
		return fangWuWay;
	}

	public void setFangWuWay(String fangWuWay) {
		this.fangWuWay = fangWuWay;
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

	public String getFoodMarket() {
		return foodMarket;
	}

	public void setFoodMarket(String foodMarket) {
		this.foodMarket = foodMarket;
	}

	public String getSuperMarket() {
		return superMarket;
	}

	public void setSuperMarket(String superMarket) {
		this.superMarket = superMarket;
	}

	public String getCvs() {
		return cvs;
	}

	public void setCvs(String cvs) {
		this.cvs = cvs;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public String getFoodTrade() {
		return foodTrade;
	}

	public void setFoodTrade(String foodTrade) {
		this.foodTrade = foodTrade;
	}

	public String getFoodLogistics() {
		return foodLogistics;
	}

	public void setFoodLogistics(String foodLogistics) {
		this.foodLogistics = foodLogistics;
	}

	public String getNonStoreFoodBusiness() {
		return nonStoreFoodBusiness;
	}

	public void setNonStoreFoodBusiness(String nonStoreFoodBusiness) {
		this.nonStoreFoodBusiness = nonStoreFoodBusiness;
	}

	public String getOnlineShop() {
		return onlineShop;
	}

	public void setOnlineShop(String onlineShop) {
		this.onlineShop = onlineShop;
	}

	public String getMailOrder() {
		return mailOrder;
	}

	public void setMailOrder(String mailOrder) {
		this.mailOrder = mailOrder;
	}

	public String getTelevisedShopping() {
		return televisedShopping;
	}

	public void setTelevisedShopping(String televisedShopping) {
		this.televisedShopping = televisedShopping;
	}

	public String getAutomat() {
		return automat;
	}

	public void setAutomat(String automat) {
		this.automat = automat;
	}

	public String getPiFa() {
		return piFa;
	}

	public void setPiFa(String piFa) {
		this.piFa = piFa;
	}

	public String getPackFood() {
		return packFood;
	}

	public void setPackFood(String packFood) {
		this.packFood = packFood;
	}

	public String getBulkFood() {
		return bulkFood;
	}

	public void setBulkFood(String bulkFood) {
		this.bulkFood = bulkFood;
	}

	public String getDairyProduct() {
		return dairyProduct;
	}

	public void setDairyProduct(String dairyProduct) {
		this.dairyProduct = dairyProduct;
	}

	public String getHanBaby() {
		return hanBaby;
	}

	public void setHanBaby(String hanBaby) {
		this.hanBaby = hanBaby;
	}

	public String getNoBody() {
		return noBody;
	}

	public void setNoBody(String noBody) {
		this.noBody = noBody;
	}

	public String getFoodProduct() {
		return foodProduct;
	}

	public void setFoodProduct(String foodProduct) {
		this.foodProduct = foodProduct;
	}

	public String getWaterProduct() {
		return waterProduct;
	}

	public void setWaterProduct(String waterProduct) {
		this.waterProduct = waterProduct;
	}

	public String getFreshAnimalProduct() {
		return freshAnimalProduct;
	}

	public void setFreshAnimalProduct(String freshAnimalProduct) {
		this.freshAnimalProduct = freshAnimalProduct;
	}

	public String getHealthProduct() {
		return healthProduct;
	}

	public void setHealthProduct(String healthProduct) {
		this.healthProduct = healthProduct;
	}

	public String getRetail() {
		return retail;
	}

	public void setRetail(String retail) {
		this.retail = retail;
	}

	public String getLsPackFood() {
		return lsPackFood;
	}

	public void setLsPackFood(String lsPackFood) {
		this.lsPackFood = lsPackFood;
	}

	public String getLsBulkFood() {
		return lsBulkFood;
	}

	public void setLsBulkFood(String lsBulkFood) {
		this.lsBulkFood = lsBulkFood;
	}

	public String getCookedFood() {
		return cookedFood;
	}

	public void setCookedFood(String cookedFood) {
		this.cookedFood = cookedFood;
	}

	public String getNoCookedFood() {
		return noCookedFood;
	}

	public void setNoCookedFood(String noCookedFood) {
		this.noCookedFood = noCookedFood;
	}

	public String getLsDairyProduct() {
		return lsDairyProduct;
	}

	public void setLsDairyProduct(String lsDairyProduct) {
		this.lsDairyProduct = lsDairyProduct;
	}

	public String getLsHanBaby() {
		return lsHanBaby;
	}

	public void setLsHanBaby(String lsHanBaby) {
		this.lsHanBaby = lsHanBaby;
	}

	public String getLsNoBody() {
		return lsNoBody;
	}

	public void setLsNoBody(String lsNoBody) {
		this.lsNoBody = lsNoBody;
	}

	public String getLsFoodProduct() {
		return lsFoodProduct;
	}

	public void setLsFoodProduct(String lsFoodProduct) {
		this.lsFoodProduct = lsFoodProduct;
	}

	public String getLsWaterProduct() {
		return lsWaterProduct;
	}

	public void setLsWaterProduct(String lsWaterProduct) {
		this.lsWaterProduct = lsWaterProduct;
	}

	public String getLsFreshAnimalProduct() {
		return lsFreshAnimalProduct;
	}

	public void setLsFreshAnimalProduct(String lsFreshAnimalProduct) {
		this.lsFreshAnimalProduct = lsFreshAnimalProduct;
	}

	public String getLsHealthProduct() {
		return lsHealthProduct;
	}

	public void setLsHealthProduct(String lsHealthProduct) {
		this.lsHealthProduct = lsHealthProduct;
	}

	public String getScene() {
		return scene;
	}

	public void setScene(String scene) {
		this.scene = scene;
	}

	public String getAmend() {
		return amend;
	}

	public void setAmend(String amend) {
		this.amend = amend;
	}
}
