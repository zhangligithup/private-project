package com.foodregulation.dao.entity;

public class Proposal {
    public Integer id;

    public String company;

    public String legalPerson;

    public String address;

    public String tel;

    public String proposalTime;
    
    public String year;
    
    public String mouth;
    
    public String day;
    
    public String hour;
    
    public String minute;
    
    public String supervisionOpinion;
    
    public String url;

    public String getSupervisionOpinion() {
		return supervisionOpinion;
	}

	public void setSupervisionOpinion(String supervisionOpinion) {
		this.supervisionOpinion = supervisionOpinion;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getLegalPerson() {
        return legalPerson;
    }

    public void setLegalPerson(String legalPerson) {
        this.legalPerson = legalPerson;
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

    public String getProposalTime() {
        return proposalTime;
    }

    public void setProposalTime(String proposalTime) {
        this.proposalTime = proposalTime;
    }

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMouth() {
		return mouth;
	}

	public void setMouth(String mouth) {
		this.mouth = mouth;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getHour() {
		return hour;
	}

	public void setHour(String hour) {
		this.hour = hour;
	}

	public String getMinute() {
		return minute;
	}

	public void setMinute(String minute) {
		this.minute = minute;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
    
    
}