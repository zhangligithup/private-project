package cn.tslanpu.test.action.service;

import java.sql.SQLException;
import java.util.List;

import cn.tslanpu.test.action.action.Action;
import cn.tslanpu.test.action.dao.ActionDao;

public class ActionService {
	private ActionDao actionDao = new ActionDao();
	
	//根据department查询单位名称
	public Action query(String department){
		try {
			return actionDao.query(department);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public Action queryActionname(String actionname){
		try {
			return actionDao.queryActionname(actionname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//查询所有分区
	public List<Action> queryAll(){
		try {
			return actionDao.queryAll();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//查询所有分区个数
	public int count(){
		try {
			return actionDao.count();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//增加单位
	public int add(String actionname, int num){
		try {
			return actionDao.add(actionname, num);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
}
