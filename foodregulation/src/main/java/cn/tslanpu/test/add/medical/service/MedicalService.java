package cn.tslanpu.test.add.medical.service;

import java.sql.SQLException;
import java.util.List;

import cn.tslanpu.test.add.medical.dao.MedicalDao;
import cn.tslanpu.test.add.medical.domain.Medical;
import cn.tslanpu.test.add.medical.domain.Medical_jdjc;
import cn.tslanpu.test.pager.PageBean;

public class MedicalService {
	private MedicalDao medicalDao = new MedicalDao();

	// 通过 qyname 查找
	public Medical findbyQY(String qyname) {
		try {
			return medicalDao.findbyQY(qyname);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}

	// 查找企业
	public List qyData() {
		try {
			return medicalDao.findQY();
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}

	// 增加信息
	public void add(Medical medical) {
		try {
			medicalDao.add(medical);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 更新信息
	public void medicalUpdate(int id, Medical medical) {
		try {
			medicalDao.medicalUpdate(id, medical);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// execl 表
	public List<Medical> queryAll(String qyname, String address,
			String department, String fddelegate, String zzcode) {
		try {
			return medicalDao.queryAll(qyname, address, department, fddelegate,
					zzcode);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 查询详细信息
	public Medical medicalFind(int id) {
		try {
			return medicalDao.medicalFind(id);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}

	// 查询
	public PageBean<Medical> queryZ(String qyname, String address,
			String department, String fddelegate, String zzcode, int pageCode) {
		try {
			return medicalDao.queryZ(qyname, address, department, fddelegate,
					zzcode, pageCode);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}

	// 删除
	public void delete(int id) {
		try {
			medicalDao.medicalDelete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void add_jdjc(Medical_jdjc medical_jdjc) {
		try {
			medicalDao.add_jdjc(medical_jdjc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 查询公司企业监督检查详细信息
	public Medical_jdjc getjdjcData(int id) {
		try {
			return medicalDao.getjdjcData(id);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}

	// 转发企业名称
	public List dispNameData() {
		try {
			return medicalDao.dispNameData();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Medical byqynameFull(String qyname) {
		try {
			return medicalDao.byqynameFull(qyname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
