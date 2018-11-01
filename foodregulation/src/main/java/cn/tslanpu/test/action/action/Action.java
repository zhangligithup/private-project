package cn.tslanpu.test.action.action;

import java.io.Serializable;

public class Action implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String actionname;
	private String department;
	public String getActionname() {
		return actionname;
	}
	public void setActionname(String actionname) {
		this.actionname = actionname;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
}
