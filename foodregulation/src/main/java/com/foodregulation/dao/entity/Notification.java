package com.foodregulation.dao.entity;

public class Notification {
    private Integer id;

    private String content;

    private String time;

    private String title;
    
    private String url;
    
    private Integer personId;
    
    private String toType;
    
    private String toCode;
    
    private String toCodeName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getPersonId() {
		return personId;
	}

	public void setPersonId(Integer personId) {
		this.personId = personId;
	}

	public String getToType() {
		return toType;
	}

	public void setToType(String toType) {
		this.toType = toType;
	}

	public String getToCode() {
		return toCode;
	}

	public void setToCode(String toCode) {
		this.toCode = toCode;
	}

	public String getToCodeName() {
		return toCodeName;
	}

	public void setToCodeName(String toCodeName) {
		this.toCodeName = toCodeName;
	}
	
	
}