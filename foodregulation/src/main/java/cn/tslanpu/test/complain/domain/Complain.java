package cn.tslanpu.test.complain.domain;

public class Complain {
	private int id;
	private String time;	//投诉接报时间
	
	private String number;  //受理编号
	private String type;	//类型
	private String mode;	//方式
	private String informerName;//举报人姓名
	private String sex;		//性别
	private String address; //地址
	private String tel;		//联系电话
	private String name;	//被投诉举　报单位   单位名称
	private String phone;	//联系电话
	private String scaddress;//地址
	private String content;	//投　诉举　报内　容
	private String idea;	//拟　办意　见
	private String department;	//主要领导批办意见
	
	//承办部门办理情况回执
	private String organizerTime;	//承办时限
	private String replyTime;		//回复时间
	private String replyWay;		//回复方式
	private String yesOrNo;			//是否满意
	private String register;		//是否立案
	private String undertaker;		//承办人
	private String situation;		//办　结情　况
	private String signature;		//经办单位领导(签名)
	private String signatureTime;	//日期
	
	private String result;  //如果result = 1； 代表已经处理
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getInformerName() {
		return informerName;
	}
	public void setInformerName(String informerName) {
		this.informerName = informerName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getScaddress() {
		return scaddress;
	}
	public void setScaddress(String scaddress) {
		this.scaddress = scaddress;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIdea() {
		return idea;
	}
	public void setIdea(String idea) {
		this.idea = idea;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getOrganizerTime() {
		return organizerTime;
	}
	public void setOrganizerTime(String organizerTime) {
		this.organizerTime = organizerTime;
	}
	public String getReplyTime() {
		return replyTime;
	}
	public void setReplyTime(String replyTime) {
		this.replyTime = replyTime;
	}
	public String getReplyWay() {
		return replyWay;
	}
	public void setReplyWay(String replyWay) {
		this.replyWay = replyWay;
	}
	public String getYesOrNo() {
		return yesOrNo;
	}
	public void setYesOrNo(String yesOrNo) {
		this.yesOrNo = yesOrNo;
	}
	public String getRegister() {
		return register;
	}
	public void setRegister(String register) {
		this.register = register;
	}
	public String getUndertaker() {
		return undertaker;
	}
	public void setUndertaker(String undertaker) {
		this.undertaker = undertaker;
	}
	public String getSituation() {
		return situation;
	}
	public void setSituation(String situation) {
		this.situation = situation;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public String getSignatureTime() {
		return signatureTime;
	}
	public void setSignatureTime(String signatureTime) {
		this.signatureTime = signatureTime;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
}
