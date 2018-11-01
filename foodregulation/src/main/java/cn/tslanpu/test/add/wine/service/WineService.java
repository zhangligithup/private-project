package cn.tslanpu.test.add.wine.service;

import java.sql.SQLException;
import java.util.List;

import cn.tslanpu.test.add.wine.dao.WineDao;
import cn.tslanpu.test.add.wine.domain.Wine;
import cn.tslanpu.test.add.wine.domain.Wine_jdjc;
import cn.tslanpu.test.pager.PageBean;

public class WineService {
	private WineDao wineDao = new WineDao();

	public void add(Wine wine) throws SQLException {
		wineDao.add(wine);
	}

	public PageBean<Wine> queryZ(String qyname, String address,
			String department, String fddelegate, String zzcode, int pageCode) {
		try {
			return  wineDao.queryZ(qyname, address, department,fddelegate,zzcode, pageCode);
		} catch (Exception e) {
			throw new  RuntimeException(e);
		}
	}
	
	//execl 表
	public List<Wine> queryAll(String qyname, String address, String department, 
			String fddelegate, String zzcode){
		try {
			return wineDao.queryAll(qyname, address, department, fddelegate, zzcode);
		} catch (SQLException e) {
			throw new  RuntimeException(e);
		}
	}


	public void Update(Wine wine) {
		try {
			wineDao.update(wine);
		} catch (Exception e) {
			throw new  RuntimeException(e);
		}
	}



	public void delete(int parseInt) {
		try {
			wineDao.delete(parseInt);
		} catch (Exception e) {
			throw new  RuntimeException(e);
		}
	}
	public  Wine wineFind(int id) {
		try {
			return  wineDao.wineFind(id);
		} catch (Exception e) {
			throw new  RuntimeException(e);
		}
	}
	
	public List dispNameData() {
		try {
			return wineDao.dispNameData();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public Wine byqynameFull(String qyname) {
		try {
			return wineDao.byqynameFull(qyname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public void add_jdjc(Wine_jdjc wine_jdjc) {
		try {
			wineDao.add_jdjc(wine_jdjc);
		} catch (SQLException e) {
		    throw new RuntimeException(e);
		}
}
	//查询公司企业监督检查详细信息
	public Wine_jdjc getjdjcData(int id){
			try {
				return wineDao.getjdjcData(id);
			} catch (SQLException e) {
				throw new RuntimeException();
			}
		}
}
