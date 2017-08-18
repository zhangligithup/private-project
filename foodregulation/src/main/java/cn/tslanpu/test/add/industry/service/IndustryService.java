package cn.tslanpu.test.add.industry.service;

import java.sql.SQLException;
import java.util.List;

import cn.tslanpu.test.add.industry.dao.IndustryDao;
import cn.tslanpu.test.add.industry.domain.Industry;
import cn.tslanpu.test.add.industry.domain.Industry_jdjc;
import cn.tslanpu.test.pager.PageBean;

public class IndustryService {

	private IndustryDao industryDao = new IndustryDao();

	// 用 qyname 查询
	public Industry findByQyname(String qyname) {
		try {
			return industryDao.findByQyname(qyname);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}

	// 查询企业名
	public List findQyname() {
		try {
			return industryDao.qynameData();
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}

	// 增加信息
	public void add(Industry industry) {
		try {
			industryDao.add(industry);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 更新信息
	public void industryUpdate(int id, Industry health) {
		try {
			industryDao.industryUpdate(id, health);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// execl 表
	public List<Industry> queryAll(String qyname, String address,
			String department, String fddelegate, String zzcode) {
		try {
			return industryDao.queryAll(qyname, address, department,
					fddelegate, zzcode);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 查询详细信息
	public Industry industryFind(int id) {
		try {
			return industryDao.industryFind(id);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}

	// 查询
	public PageBean<Industry> queryZ(String qyname, String address,
			String department, String fddelegate, String zzcode, int pageCode) {
		try {
			return industryDao.queryZ(qyname, address, department, fddelegate,
					zzcode, pageCode);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}

	// 删除
	public void delete(int id) {
		try {
			industryDao.industryDelete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 查询公司企业监督检查详细信息
	public Industry_jdjc getjdjcData(int id) {
		try {
			return industryDao.getjdjcData(id);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}

	public List dispNameData() {
		try {
			return industryDao.dispNameData();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Industry byqynameFull(String qyname) {
		try {
			return industryDao.byqynameFull(qyname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void add_jdjc(Industry_jdjc industry_jdjc) {
		try {
			industryDao.add_jdjc(industry_jdjc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
