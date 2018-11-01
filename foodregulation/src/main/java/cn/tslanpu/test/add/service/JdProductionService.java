package cn.tslanpu.test.add.service;

import java.sql.SQLException;

import cn.tslanpu.test.add.bean.JdProduction;
import cn.tslanpu.test.add.dao.JdProductionDao;

public class JdProductionService {
	private JdProductionDao jdDao = new JdProductionDao();
	public void add(JdProduction jd){
		try {
			jdDao.add(jd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int queryExits(String name){
		try {
			return jdDao.queryExits(name);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	public static void main(String[] args) {
		JdProductionService jd = new JdProductionService();
		System.out.println(jd.queryExits("唐山"));
	}
}
