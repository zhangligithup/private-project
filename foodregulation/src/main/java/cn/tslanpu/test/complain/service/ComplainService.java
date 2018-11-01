package cn.tslanpu.test.complain.service;

import java.sql.SQLException;

import cn.tslanpu.test.add.agricultural.domain.Agricultural;
import cn.tslanpu.test.complain.dao.ComplainDao;
import cn.tslanpu.test.complain.domain.Complain;

public class ComplainService {
	
	ComplainDao complainDao = new ComplainDao();
	//增加信息
	public void add(Complain complain){
		try {
			complainDao.add(complain);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void update(int id, Complain complain){
		try {
			complainDao.update(id, complain);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//更新信息
	public void complainUpdate(int id, Complain complain){
		try {
			complainDao.complainUpdate(id, complain);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//查询详细信息
	public Complain complainFind(int id){
		try {
			return complainDao.complainFind(id);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	//删除
	public void delete(int id) {
		try {
			complainDao.complainDelete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
