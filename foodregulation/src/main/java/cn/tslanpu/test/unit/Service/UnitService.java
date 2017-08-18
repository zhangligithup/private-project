package cn.tslanpu.test.unit.Service;

import java.sql.SQLException;
import java.util.List;

import com.foodregulation.dao.entity.Dictionary;

import cn.tslanpu.test.unit.dao.UnitDao;

public class UnitService {
	private UnitDao unitDao = new UnitDao();
	public List<Dictionary> query(){
		try {
			return unitDao.query();
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	public List<Dictionary> queryEnterpriseInfo(){
		try {
			return unitDao.queryEnterpriseInfo();
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	public List<Dictionary> queryEconomic(){
		try {
			return unitDao.queryEconomic();
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
}
