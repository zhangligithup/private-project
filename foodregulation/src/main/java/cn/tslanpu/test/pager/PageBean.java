package cn.tslanpu.test.pager;

import java.util.List;

public class PageBean<T> {
	
	//servlet从页面获取，页面没传就为1;
	private int pageCode;//当前页码
	
	//private int totalPage;//总页数
	
	//在service中通过dao来获取，pageCode， pageSize
	private List<T> datas; //当前页的记录
	
	//在service中通过dao中count()方法来获取
	private int totalRecord;//总记录数
	
	//不用动固定值
	private int pageSize = 10;//每页记录数
	
	private String url;//请求路径和参数
	
	public PageBean(){};
	
	public PageBean(int pageCode, int totalRecord){
		this(pageCode, totalRecord, 10);
	}
	
	public PageBean(int pageCode, int totalRecord, int pageSize){
		this.pageCode = pageCode;
		this.totalRecord = totalRecord;
		this.pageSize = pageSize;
	}

	public int getPageCode() {
		return pageCode;
	}

	public void setPageCode(int pageCode) {
		this.pageCode = pageCode;
	}

	public List<T> getDatas() {
		return datas;
	}

	public void setDatas(List<T> datas) {
		this.datas = datas;
	}

	public int getTotalRecord() {
		return totalRecord;
	}
	
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		//计算totalPage
		int totalPage = this.totalRecord / pageSize;
		totalPage = totalRecord % pageSize == 0 ? totalPage : totalPage + 1;
		return totalPage; 
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
