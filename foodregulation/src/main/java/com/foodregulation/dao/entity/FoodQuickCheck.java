package com.foodregulation.dao.entity;

public class FoodQuickCheck {
    private Integer id;

    private String sampleName;

    private String projectType;
    
    private String projectName;

    private String result;

    private String detectionedEnterprise;

    private String detectionUnitCode;
    
    private String detectionUnitName;

    private String detectionBodyType;

    private String detectionDate;
    
    private String detectionEnterpriseName;
    
    private String imgUrl;
    
    private String account;
    
    private String noQualifiedVideo;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSampleName() {
        return sampleName;
    }

    public void setSampleName(String sampleName) {
        this.sampleName = sampleName == null ? null : sampleName.trim();
    }

    public String getProjectType() {
        return projectType;
    }

    public void setProjectType(String projectType) {
        this.projectType = projectType == null ? null : projectType.trim();
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result == null ? null : result.trim();
    }

    public String getDetectionedEnterprise() {
        return detectionedEnterprise;
    }

    public void setDetectionedEnterprise(String detectionedEnterprise) {
        this.detectionedEnterprise = detectionedEnterprise == null ? null : detectionedEnterprise.trim();
    }

    public String getDetectionUnitCode() {
        return detectionUnitCode;
    }

    public void setDetectionUnitCode(String detectionUnitCode) {
        this.detectionUnitCode = detectionUnitCode == null ? null : detectionUnitCode.trim();
    }

    public String getDetectionBodyType() {
        return detectionBodyType;
    }

    public void setDetectionBodyType(String detectionBodyType) {
        this.detectionBodyType = detectionBodyType == null ? null : detectionBodyType.trim();
    }

	public String getDetectionDate() {
		return detectionDate;
	}

	public void setDetectionDate(String detectionDate) {
		this.detectionDate = detectionDate;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getDetectionUnitName() {
		return detectionUnitName;
	}

	public void setDetectionUnitName(String detectionUnitName) {
		this.detectionUnitName = detectionUnitName;
	}

	public String getDetectionEnterpriseName() {
		return detectionEnterpriseName;
	}

	public void setDetectionEnterpriseName(String detectionEnterpriseName) {
		this.detectionEnterpriseName = detectionEnterpriseName== null ? "" : detectionEnterpriseName.trim();
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getNoQualifiedVideo() {
		return noQualifiedVideo;
	}

	public void setNoQualifiedVideo(String noQualifiedVideo) {
		this.noQualifiedVideo = noQualifiedVideo;
	}
}