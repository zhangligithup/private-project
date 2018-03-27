package com.foodregulation.dao.entity;

public class User {

    private Integer id;

    private String username;

    private String password;

    private String menuIds;
    
    private String enterpriseName;


    public Integer getId() {
        return id;
    }


    public void setId(Integer id) {
        this.id = id;
    }


    public String getUsername() {
        return username;
    }


    public void setUsername(String username) {
        this.username = username;
    }


    public String getPassword() {
        return password;
    }


    public void setPassword(String password) {
        this.password = password;
    }



    public String getMenuIds() {
        return menuIds;
    }



    public void setMenuIds(String menuIds) {
        this.menuIds = menuIds;
    }


	public String getEnterpriseName() {
		return enterpriseName;
	}


	public void setEnterpriseName(String enterpriseName) {
		this.enterpriseName = enterpriseName;
	}

}
