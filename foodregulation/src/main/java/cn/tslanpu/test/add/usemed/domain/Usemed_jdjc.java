package cn.tslanpu.test.add.usemed.domain;


public class Usemed_jdjc  {
    private Integer id;

    private String qyname;

    private String scaddress;

    private String qydelegate;

    private String qyphone;

    private String zzcode;

    private String scpermit;

    private String jcry1;

    private String jcry1id;

    private String jcry2;

    private String jcry2id;

    private String jcaddress;

    private String qyidea;

    private String isvalue1str;
    
    private String isvalue0str;

    private Integer checkednum;

    private Integer pointnum;

    private String pointstr;

    private Integer pointproblemnum;

    private String pointproblemstr;

    private Integer nopointnum;

    private String nopointstr;

    private Integer nopointproblemnum;

    private String nopointproblemstr;
    
    private String markstr;
    
    private String image_resource;
    
    private String other;
    
    private String date1;

    private String date2;

    private String date3;
    
    private String detailspoint;
    
    private String detailsnopoint;
    private String departmentName;		//被检查单位（法人或负责人）签字
    private String departmentNameTime;	//时间(年月日):
    private String jcryName;			//检查人员签字:
    private String jcryNameTime;		//时间(年月日)
    
    private String accord;
    private String result;
    
    public String getAccord() {
		return accord;
	}

	public void setAccord(String accord) {
		this.accord = accord;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
    
    public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getDepartmentNameTime() {
		return departmentNameTime;
	}

	public void setDepartmentNameTime(String departmentNameTime) {
		this.departmentNameTime = departmentNameTime;
	}

	public String getJcryName() {
		return jcryName;
	}

	public void setJcryName(String jcryName) {
		this.jcryName = jcryName;
	}

	public String getJcryNameTime() {
		return jcryNameTime;
	}

	public void setJcryNameTime(String jcryNameTime) {
		this.jcryNameTime = jcryNameTime;
	}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQyname() {
        return qyname;
    }

    public void setQyname(String qyname) {
        this.qyname = qyname == null ? null : qyname.trim();
    }

    public String getDetailspoint() {
		return detailspoint;
	}

	public void setDetailspoint(String detailspoint) {
		this.detailspoint = detailspoint;
	}

	public String getDetailsnopoint() {
		return detailsnopoint;
	}

	public void setDetailsnopoint(String detailsnopoint) {
		this.detailsnopoint = detailsnopoint;
	}

	public String getScaddress() {
        return scaddress;
    }

    public void setScaddress(String scaddress) {
        this.scaddress = scaddress == null ? null : scaddress.trim();
    }

    public String getMarkstr() {
		return markstr;
	}

	public void setMarkstr(String markstr) {
		this.markstr = markstr;
	}

	public String getImage_resource() {
		return image_resource;
	}

	public void setImage_resource(String image_resource) {
		this.image_resource = image_resource;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getQydelegate() {
        return qydelegate;
    }

    public void setQydelegate(String qydelegate) {
        this.qydelegate = qydelegate == null ? null : qydelegate.trim();
    }

    public String getQyphone() {
        return qyphone;
    }

    public void setQyphone(String qyphone) {
        this.qyphone = qyphone == null ? null : qyphone.trim();
    }

    public String getZzcode() {
        return zzcode;
    }

    public void setZzcode(String zzcode) {
        this.zzcode = zzcode == null ? null : zzcode.trim();
    }

    public String getScpermit() {
        return scpermit;
    }

    public void setScpermit(String scpermit) {
        this.scpermit = scpermit == null ? null : scpermit.trim();
    }

    public String getJcry1() {
        return jcry1;
    }

    public void setJcry1(String jcry1) {
        this.jcry1 = jcry1 == null ? null : jcry1.trim();
    }

    public String getJcry1id() {
        return jcry1id;
    }

    public void setJcry1id(String jcry1id) {
        this.jcry1id = jcry1id == null ? null : jcry1id.trim();
    }

    public String getJcry2() {
        return jcry2;
    }

    public void setJcry2(String jcry2) {
        this.jcry2 = jcry2 == null ? null : jcry2.trim();
    }

    public String getJcry2id() {
        return jcry2id;
    }

    public void setJcry2id(String jcry2id) {
        this.jcry2id = jcry2id == null ? null : jcry2id.trim();
    }

    public String getJcaddress() {
        return jcaddress;
    }

    public void setJcaddress(String jcaddress) {
        this.jcaddress = jcaddress == null ? null : jcaddress.trim();
    }

    public String getQyidea() {
        return qyidea;
    }

    public void setQyidea(String qyidea) {
        this.qyidea = qyidea == null ? null : qyidea.trim();
    }

    public String getIsvalue1str() {
		return isvalue1str;
	}

	public void setIsvalue1str(String isvalue1str) {
		this.isvalue1str = isvalue1str;
	}

	public String getIsvalue0str() {
		return isvalue0str;
	}

	public void setIsvalue0str(String isvalue0str) {
		this.isvalue0str = isvalue0str;
	}

	public Integer getCheckednum() {
        return checkednum;
    }

    public void setCheckednum(Integer checkednum) {
        this.checkednum = checkednum;
    }

    public Integer getPointnum() {
        return pointnum;
    }

    public void setPointnum(Integer pointnum) {
        this.pointnum = pointnum;
    }

    public String getPointstr() {
        return pointstr;
    }

    public void setPointstr(String pointstr) {
        this.pointstr = pointstr == null ? null : pointstr.trim();
    }

    public Integer getPointproblemnum() {
        return pointproblemnum;
    }

    public void setPointproblemnum(Integer pointproblemnum) {
        this.pointproblemnum = pointproblemnum;
    }

    public String getPointproblemstr() {
        return pointproblemstr;
    }

    public void setPointproblemstr(String pointproblemstr) {
        this.pointproblemstr = pointproblemstr == null ? null : pointproblemstr.trim();
    }

    public Integer getNopointnum() {
        return nopointnum;
    }

    public void setNopointnum(Integer nopointnum) {
        this.nopointnum = nopointnum;
    }

    public String getNopointstr() {
        return nopointstr;
    }

    public void setNopointstr(String nopointstr) {
        this.nopointstr = nopointstr == null ? null : nopointstr.trim();
    }

    public Integer getNopointproblemnum() {
        return nopointproblemnum;
    }

    public void setNopointproblemnum(Integer nopointproblemnum) {
        this.nopointproblemnum = nopointproblemnum;
    }

    public String getNopointproblemstr() {
        return nopointproblemstr;
    }

    public void setNopointproblemstr(String nopointproblemstr) {
        this.nopointproblemstr = nopointproblemstr == null ? null : nopointproblemstr.trim();
    }

	public String getDate1() {
		return date1;
	}

	public void setDate1(String date1) {
		this.date1 = date1;
	}

	public String getDate2() {
		return date2;
	}

	public void setDate2(String date2) {
		this.date2 = date2;
	}

	public String getDate3() {
		return date3;
	}

	public void setDate3(String date3) {
		this.date3 = date3;
	}



	
    
  
}