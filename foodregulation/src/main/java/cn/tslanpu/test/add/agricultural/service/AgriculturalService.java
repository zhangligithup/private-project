package cn.tslanpu.test.add.agricultural.service;

import java.sql.SQLException;
import java.util.List;

import cn.tslanpu.test.add.agricultural.dao.AgriculturalDao;
import cn.tslanpu.test.add.agricultural.domain.Agricultural;
import cn.tslanpu.test.pager.PageBean;

public class AgriculturalService {

	private AgriculturalDao agriculturalDao = new AgriculturalDao();

	// 通过企业名查询信息
	public Agricultural findByQyName(String qyname) {
		try {
			return agriculturalDao.findByQyname(qyname);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}

	// 查询企业名
	public List findQyName() {
		try {
			return agriculturalDao.qynameData();
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}

	// 增加信息
	public void add(Agricultural agricultural) {
		try {
			agriculturalDao.add(agricultural);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 更新信息
	public void agriculturalUpdate(int id, Agricultural agricultural) {
		try {
			agriculturalDao.agriculturalUpdate(id, agricultural);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// execl 表
	public List<Agricultural> queryAll(String qyname, String address,
			String department, String fddelegate, String zzcode) {
		try {
			return agriculturalDao.queryAll(qyname, address, department,
					fddelegate, zzcode);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 查询详细信息
	public Agricultural agriculturalFind(int id) {
		try {
			return agriculturalDao.agriculturalFind(id);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}

	// 查询
	public PageBean<Agricultural> queryZ(String qyname, String address,
			String department, String fddelegate, String zzcode, int pageCode) {
		try {
			return agriculturalDao.queryZ(qyname, address, department,
					fddelegate, zzcode, pageCode);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}

	// 删除
	public void delete(int id) {
		try {
			agriculturalDao.agriculturalDelete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
