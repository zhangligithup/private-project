package cn.tslanpu.test.index.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cn.tslanpu.test.complain.domain.Complain;
import cn.tslanpu.test.index.dao.IndexDao;

public class IndexService {
	IndexDao indexDao = new IndexDao();
	
	public List<Complain> queryUntreated(String department){
		try {
			return indexDao.queryUntreated(department);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	public Map<String, Integer> getNumber(){
		try {
			return indexDao.getNumber();
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
}
