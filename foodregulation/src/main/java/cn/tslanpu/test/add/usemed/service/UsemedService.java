package cn.tslanpu.test.add.usemed.service;

import java.sql.SQLException;
import java.util.List;

import cn.tslanpu.test.add.usemed.dao.UsemedDao;
import cn.tslanpu.test.add.usemed.domain.Usemed;
import cn.tslanpu.test.add.usemed.domain.Usemed_jdjc;
import cn.tslanpu.test.pager.PageBean;

public class UsemedService {
private UsemedDao usemedDao = new UsemedDao();
	
	//增加信息
	public void add(Usemed usemed){
		try {
			usemedDao.add(usemed);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//execl 表
	public List<Usemed> queryAll(String qyname, String address, String department, 
			String fddelegate, String zzcode){
		try {
			return usemedDao.queryAll(qyname, address, department, fddelegate, zzcode);
		} catch (SQLException e) {
			throw new  RuntimeException(e);
		}
	}
	
	//更新信息
	public void usemedUpdate(int id, Usemed usemed){
		try {
			usemedDao.usemedUpdate(id, usemed);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//查询详细信息
	public Usemed usemedFind(int id){
		try {
			return usemedDao.usemedFind(id);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	//查询
	public PageBean<Usemed> queryZ(String qyname, String address,
			String department, String fddelegate, String zzcode, int pageCode) {
		try {
			return usemedDao.queryZ(qyname, address, department, fddelegate, zzcode,pageCode);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	//删除
	public void delete(int id) {
		try {
			usemedDao.usemedDelete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//查询公司企业监督检查详细信息
	public Usemed_jdjc getjdjcData(int id){
			try {
				return usemedDao.getjdjcData(id);
			} catch (SQLException e) {
				throw new RuntimeException();
			}
		}
	//转发企业名称
	public List dispNameData() {
				try {
					return usemedDao.dispNameData();
				} catch (SQLException e) {
					throw new RuntimeException(e);
				}
			}
	public Usemed byqynameFull(String qyname) {
		try {
			return usemedDao.byqynameFull(qyname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void add_jdjc(Usemed_jdjc usemed_jdjc) {
		try {
			usemedDao.add_jdjc(usemed_jdjc);
		} catch (SQLException e) {
		    throw new RuntimeException(e);
		}
}
}
