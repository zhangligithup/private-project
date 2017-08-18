package cn.tslanpu.test.add.health.service;

import java.sql.SQLException;
import java.util.List;

import cn.tslanpu.test.add.health.dao.HealthDao;
import cn.tslanpu.test.add.health.domain.Health;
import cn.tslanpu.test.add.health.domain.Health_jdjc;
import cn.tslanpu.test.pager.PageBean;

public class HealthService {
	
	private HealthDao healthDao = new HealthDao();
	
	public List findQY(){
		try
		{
			return healthDao.qynameData();
		} catch (SQLException e)
		{
			throw new RuntimeException();
		}
	}
	public Health findbyQY(String qyname){
		
		try
		{
			return healthDao.findbyQY(qyname);
		} catch (SQLException e)
		{
			throw new RuntimeException();
		}
		
	}
	//增加信息
	public void add(Health health){
		try {
			healthDao.add(health);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//更新信息
	public void healthUpdate(int id, Health health){
		try {
			healthDao.healthUpdate(id, health);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//execl 表
	public List<Health> queryAll(String qyname, String address, String department, 
			String fddelegate, String zzcode){
		try {
			return healthDao.queryAll(qyname, address, department, fddelegate, zzcode);
		} catch (SQLException e) {
			throw new  RuntimeException(e);
		}
	}
	
	//查询详细信息
	public Health healthFind(int id){
		try {
			return healthDao.healthFind(id);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	//查询
	public PageBean<Health> queryZ(String qyname, String address,
			String department, String fddelegate, String zzcode, int pageCode) {
		try {
			return healthDao.queryZ(qyname, address, department,fddelegate, zzcode, pageCode);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	//删除
	public void delete(int id) {
		try {
			healthDao.healthDelete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void add_jdjc(Health_jdjc health_jdjc) {
		try {
			healthDao.add_jdjc(health_jdjc);
		} catch (SQLException e) {
		    throw new RuntimeException(e);
		}
}
	
	//转发企业名称
	public List dispNameData() {
		try {
			return healthDao.dispNameData();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//查询公司企业监督检查详细信息
	public Health_jdjc getjdjcData(int id){
		try {
			return healthDao.getjdjcData(id);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
		
	public Health byqynameFull(String qyname) {
		try {
			return healthDao.byqynameFull(qyname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
