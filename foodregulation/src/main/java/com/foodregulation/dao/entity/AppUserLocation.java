package com.foodregulation.dao.entity;

public class AppUserLocation {
    private Integer id;

    private String username;
    
    private String personName;

    private Float longitude;

    private Float latitude;

    private String timestamp;
    
    private String perosnTel;

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
        this.username = username == null ? null : username.trim();
    }

    public Float getLatitude() {
        return latitude;
    }

    public void setLatitude(Float latitude) {
        this.latitude = latitude;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp == null ? null : timestamp.trim();
    }

	public Float getLongitude() {
		return longitude;
	}

	public void setLongitude(Float longitude) {
		this.longitude = longitude;
	}

	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public String getPerosnTel() {
		return perosnTel;
	}

	public void setPerosnTel(String perosnTel) {
		this.perosnTel = perosnTel;
	}
}