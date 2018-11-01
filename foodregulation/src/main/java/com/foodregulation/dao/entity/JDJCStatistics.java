package com.foodregulation.dao.entity;

import java.util.List;

public class JDJCStatistics {
	
	String entTypeCode;//企业类别code
	String entTypeName;//企业类别名
	int total = 0;//总数量
	int hasTotal = 0;//已检查数量
	List<JDJCStatisticsNode> list;//类型下的监管单位统计节点
	String jcl = "0.0";//检查率
	
	public String getJcl() {
		return jcl;
	}
	public void setJcl(String jcl) {
		this.jcl = jcl;
	}
	public String getEntTypeCode() {
		return entTypeCode;
	}
	public void setEntTypeCode(String entTypeCode) {
		this.entTypeCode = entTypeCode;
	}
	public String getEntTypeName() {
		return entTypeName;
	}
	public void setEntTypeName(String entTypeName) {
		this.entTypeName = entTypeName;
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
	public List<JDJCStatisticsNode> getList() {
		return list;
	}
	public void setList(List<JDJCStatisticsNode> list) {
		this.list = list;
	}
}
