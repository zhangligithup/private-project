package com.foodregulation.dao.entity;

import java.util.Date;

import com.foodregulation.util.DateUtil;

public class SupervisionAndCheckTask {
    private Integer id;

    private String enterprisetype;
    
    private String enterprisetypeName;

    private Date starttime;
    
    private String starttimeStr;

    private Date endtime;
    
    private String endtimeStr;

    private String unitcode;
    
    private String unitcodeName;

    private String enterpriseids;
    
    private String enterpriseNames;
    
    private String checkFrequencyCode;
    
    private String checkFrequencyCodeName;
    
    private String createPersonUser;
    
    private String createUnitCode;
    
    private Integer supervisionCheckCount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEnterprisetype() {
        return enterprisetype;
    }

    public void setEnterprisetype(String enterprisetype) {
        this.enterprisetype = enterprisetype == null ? null : enterprisetype.trim();
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
        if(starttime!=null){
        	this.starttimeStr = DateUtil.getDateToStr2(starttime);
        }
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
        if(endtime!=null){
        	this.endtimeStr = DateUtil.getDateToStr2(endtime);
        }
    }

    public String getUnitcode() {
        return unitcode;
    }

    public void setUnitcode(String unitcode) {
        this.unitcode = unitcode == null ? null : unitcode.trim();
    }

    public String getEnterpriseids() {
        return enterpriseids;
    }

    public void setEnterpriseids(String enterpriseids) {
        this.enterpriseids = enterpriseids == null ? null : enterpriseids.trim();
    }

	public String getStarttimeStr() {
		return starttimeStr;
	}

	public void setStarttimeStr(String starttimeStr) {
		this.starttimeStr = starttimeStr;
	}

	public String getEndtimeStr() {
		return endtimeStr;
	}

	public void setEndtimeStr(String endtimeStr) {
		this.endtimeStr = endtimeStr;
	}

	public String getCheckFrequencyCode() {
		return checkFrequencyCode;
	}

	public void setCheckFrequencyCode(String checkFrequencyCode) {
		this.checkFrequencyCode = checkFrequencyCode;
	}

	public String getEnterprisetypeName() {
		return enterprisetypeName;
	}

	public void setEnterprisetypeName(String enterprisetypeName) {
		this.enterprisetypeName = enterprisetypeName;
	}

	public String getUnitcodeName() {
		return unitcodeName;
	}

	public void setUnitcodeName(String unitcodeName) {
		this.unitcodeName = unitcodeName;
	}

	public String getCheckFrequencyCodeName() {
		return checkFrequencyCodeName;
	}

	public void setCheckFrequencyCodeName(String checkFrequencyCodeName) {
		this.checkFrequencyCodeName = checkFrequencyCodeName;
	}

	public String getEnterpriseNames() {
		return enterpriseNames;
	}

	public void setEnterpriseNames(String enterpriseNames) {
		this.enterpriseNames = enterpriseNames;
	}

	public String getCreatePersonUser() {
		return createPersonUser;
	}

	public void setCreatePersonUser(String createPersonUser) {
		this.createPersonUser = createPersonUser;
	}

	public String getCreateUnitCode() {
		return createUnitCode;
	}

	public void setCreateUnitCode(String createUnitCode) {
		this.createUnitCode = createUnitCode;
	}

	public Integer getSupervisionCheckCount() {
		return supervisionCheckCount;
	}

	public void setSupervisionCheckCount(Integer supervisionCheckCount) {
		this.supervisionCheckCount = supervisionCheckCount;
	}
}