package com.foodregulation.dao.entity;

public class Notice {
    public Integer id;

    public String company;

    public String illegalids;

    public String illegalcontents;

    public String noticeDate;

    public String content;

    public String illegalActivities;
    
    public String year;
    
    public String mouth;
    
    public String day;
    
    public String url;

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

    public String getIllegalids() {
        return illegalids;
    }

    public void setIllegalids(String illegalids) {
        this.illegalids = illegalids;
    }

    public String getIllegalcontents() {
        return illegalcontents;
    }

    public void setIllegalcontents(String illegalcontents) {
        this.illegalcontents = illegalcontents;
    }

    public String getNoticeDate() {
        return noticeDate;
    }

    public void setNoticeDate(String noticeDate) {
        this.noticeDate = noticeDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getIllegalActivities() {
        return illegalActivities;
    }

    public void setIllegalActivities(String illegalActivities) {
        this.illegalActivities = illegalActivities;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
}