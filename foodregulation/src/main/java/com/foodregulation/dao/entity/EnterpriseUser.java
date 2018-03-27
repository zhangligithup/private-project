package com.foodregulation.dao.entity;

public class EnterpriseUser {
    private String enterpriseName;

    private String userName;

    private String password;
    
    private String enterpriseTypeCode;
    
    private String name;
    
    private int id;

    public String getEnterpriseName() {
        return enterpriseName;
    }

    public void setEnterpriseName(String enterpriseName) {
        this.enterpriseName = enterpriseName == null ? null : enterpriseName.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEnterpriseTypeCode() {
		return enterpriseTypeCode;
	}

	public void setEnterpriseTypeCode(String enterpriseTypeCode) {
		this.enterpriseTypeCode = enterpriseTypeCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
    
}