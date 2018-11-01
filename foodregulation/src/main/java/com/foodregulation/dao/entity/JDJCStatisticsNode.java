package com.foodregulation.dao.entity;

public class JDJCStatisticsNode {
	
	String unitCode;//监管单位code
	String unitName;//监管单位名称
	int total = 0;//监管总量
	int hasTotal = 0;//已监管总量
	String jcl = "0.0";//检查率
	
	
	public String getJcl() {
		return jcl;
	}
	public void setJcl(String jcl) {
		this.jcl = jcl;
	}
	public String getUnitCode() {
		return unitCode;
	}
	public void setUnitCode(String unitCode) {
		this.unitCode = unitCode;
	}
	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getHasTotal() {
		return hasTotal;
	}
	public void setHasTotal(int hasTotal) {
		this.hasTotal = hasTotal;
	}
	
	
}
