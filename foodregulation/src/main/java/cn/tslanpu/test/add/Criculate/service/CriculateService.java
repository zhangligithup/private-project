package cn.tslanpu.test.add.Criculate.service;

import java.sql.SQLException;
import java.util.List;

import cn.tslanpu.test.add.Criculate.dao.CriculateDao;
import cn.tslanpu.test.add.Criculate.domain.Criculate;
import cn.tslanpu.test.add.Criculate.domain.Criculate_jdjc;
import cn.tslanpu.test.pager.PageBean;

public class CriculateService {
	private CriculateDao criculateDao = new CriculateDao();
	//通过企业名查询信息
	public Criculate findByQyname(String qyname){
		try
		{
			return criculateDao.findByQyname(qyname);
		} catch (SQLException e)
		{
			throw new RuntimeException();
		}
	}
	//查询企业名称
	public List findQyname() {
		try{
		return criculateDao.qynameData();
		}catch(SQLException e){
			throw new RuntimeException();
		}
	}
	//增加流通单位信息
	public void add(Criculate criculate){
		try {
			criculateDao.add(criculate);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//execl 表
	public List<Criculate> queryAll(String qyname, String address, String department, 
			String fddelegate, String zzcode){
		try {
			return criculateDao.queryAll(qyname, address, department, fddelegate, zzcode);
		} catch (SQLException e) {
			throw new  RuntimeException(e);
		}
	}
	
	//查询流通单位详细信息
	public Criculate criculateFind(int id){
		try {
			return criculateDao.criculateFind(id);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	//更新信息
	public int criculateUpdate(int id, Criculate criculate){
		try {
			return criculateDao.criculateUpdate(id, criculate);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	//删除信息
	public void delete(int id){
		try {
			criculateDao.delete(id);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	//根据公司名称进行模糊查询
	public PageBean<Criculate> queryByName(String qyname, int pageCode){
		try {
			return criculateDao.queryByName(qyname, pageCode);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	//根据所属单位进行分页查询
	public PageBean<Criculate> queryPage(String department, int pageCode){
		try {
			return criculateDao.queryPage(department, pageCode);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//根据所有单位进行分页查询
	public PageBean<Criculate> fingByCategory(int pageCode){
		try {
			return criculateDao.fingByCategory(pageCode);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//查询
	public PageBean<Criculate> queryZ(String qyname, String address, String department,String fddelegate, String zzcode, int pageCode){
		try {
			return criculateDao.queryZ(qyname, address, department, fddelegate, zzcode,pageCode);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//查询公司企业监督检查详细信息
	public Criculate_jdjc getjdjcData(int id){
			try {
				return criculateDao.getjdjcData(id);
			} catch (SQLException e) {
				throw new RuntimeException();
			}
		}
	
	public List dispNameData() {
		try {
			return criculateDao.dispNameData();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public Criculate byqynameFull(String qyname) {
		try {
			return criculateDao.byqynameFull(qyname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public void add_jdjc(Criculate_jdjc criculate_jdjc) {
		try {
			criculateDao.add_jdjc(criculate_jdjc);
		} catch (SQLException e) {
		    throw new RuntimeException(e);
		}
	}
	
}
