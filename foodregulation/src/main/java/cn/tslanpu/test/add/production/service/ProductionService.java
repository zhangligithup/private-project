package cn.tslanpu.test.add.production.service;

import java.sql.SQLException;
import java.util.List;

import cn.tslanpu.test.add.production.dao.ProductionDao;
import cn.tslanpu.test.add.production.domain.Production;
import cn.tslanpu.test.add.production.domain.Production_jdjc;
import cn.tslanpu.test.pager.PageBean;


public class ProductionService {
	private ProductionDao productionDao = new ProductionDao();
	//增加生产企业信息
	public void add(Production production){
		try {
			productionDao.add(production);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	//execl 表
	public List<Production> queryAll(String qyname, String address, String department, 
			String fddelegate, String zzcode){
		try {
			return productionDao.queryAll(qyname, address, department, fddelegate, zzcode);
		} catch (SQLException e) {
			throw new  RuntimeException(e);
		}
	}
	
	//分页查询
	public PageBean<Production> queryByPage(int pageCode){
		int totalRecord;
		try {
			totalRecord = productionDao.count();
		} catch (SQLException e1) {
			throw new RuntimeException();
		}
		//使用当前页码和总记录数创建PageBean
		PageBean<Production> pb = new PageBean<Production>(pageCode, totalRecord);
		//查询本页记录
		List<Production> datas;
		try {
			datas = productionDao.queryByPage((pageCode - 1)*pb.getPageSize(), pb.getPageSize());
		} catch (SQLException e) {
			throw new RuntimeException();
		}
		//保存pageBean中
		pb.setDatas(datas);
		return pb;
	}
	//更改生产企业单位信息
	public void productionUpdate(int id, Production production){
		try {
			productionDao.productionUpdate(id, production);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	//查询公司企业详细信息
	public Production productionFind(int id){
		try {
			return productionDao.productionFind(id);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	public void delete(int id){
		try {
			productionDao.delete(id);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	//根据公司名称进行模糊查询
	public PageBean<Production> queryByName(String qyname, int pageCode){
		try {
			return productionDao.queryByName(qyname, pageCode);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	//根据所属单位进行分页查询
	public PageBean<Production> queryPage(String department, int pageCode){
		try {
			return productionDao.queryPage(department, pageCode);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//根据所有单位进行分页查询
	public PageBean<Production> fingByCategory(int pageCode){
		try {
			return productionDao.fingByCategory(pageCode);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public PageBean<Production> queryZ(String qyname, String address,
			String department, String fddelegate, String zzcode, int pageCode) {
		try {
			return productionDao.queryZ(qyname, address, department, fddelegate, zzcode, pageCode);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//	查询企业名
	public List findQyname(){
		try{
		return productionDao.qynameData();
		}catch(SQLException e){
			throw new RuntimeException();
			
		}
	}
	// 查询全部企业名称
	public  List dispNameData() {
		try {
			return productionDao.dispNameData();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	//查询公司企业监督检查详细信息
	public Production_jdjc getjdjcData(int id){
			try {
				return productionDao.getjdjcData(id);
			} catch (SQLException e) {
				throw new RuntimeException();
			}
		}
		
	public Production byqynameFull(String qyname) {
		try {
			return productionDao.byqynameFull(qyname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public void add_jdjc(Production_jdjc production_jdjc) {				
		try {
			productionDao.add_jdjc(production_jdjc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*public static void main(String[] args) {
		Production production = new Production();
		ProductionService pro = new ProductionService();
		for(int i = 0; i<150; i++){
			production.setQyname("唐山蓝普科技有限公司" + i);
			production.setAddress("河北省唐山市");
			production.setScaddress("河北省唐山市");
			production.setEms("050605");
			production.setPhone("123456" + i);
			production.setFax("123" +i);
			production.setEmail("83482027" + i + "@qq.com");
			production.setZzcode("开发公司");
			production.setJjtype("软件开发");
			production.setGsorganization("公司登记机构");
			production.setYylicense("321456" + i);
			production.setCldate("2013-5-1");
			production.setJyqxdate("2020-5-1");
			production.setGdfund(i + "亿元");
			production.setZcfund(i + "1亿元");
			production.setNzyield(i+ "亿元");
			production.setNxlimit(1 + "亿元");
			production.setNjmoney(i + "千万");
			production.setNfund(i + "千万");
			production.setQyscale("一座办公楼");
			production.setFddelegate("李经理");
			production.setFdphone(i + "123" + i );
			production.setQydelegate("小冯");
			production.setQyphone("18957641" + i);
			production.setZldelegate("小赵");
			production.setZlphone("1874563215");
			production.setSpdelegate("小王");
			production.setSpphone("187315602");
			production.setAssay("小张");
			production.setAssayphone("15633905631");
			production.setCynumber("1" + i);
			production.setZynumber("" + i);
			production.setFzdate("2013-10-1");
			production.setScpermit("888888888");
			production.setScpermitdate("2030-10-1");
			production.setIsoapprove("ISO质量体系认证");
			production.setHacccpapprove("HACCP认证");
			production.setWghapprove("无公害食品认证");
			production.setLsapprove("绿色食品认证");
			production.setYjapprove("有机食品认证");
			production.setCapprove("标志认证");
			production.setCpstandard("执行标准");
			if(i%2 == 0){
				production.setRecords("是");
			}
			else{
				production.setRecords("否");
			}
			production.setProduct("很好");
			pro.add(production);
		}
	}*/
}
