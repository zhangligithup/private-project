package cn.tslanpu.test.add.food.service;

import java.sql.SQLException;
import java.util.List;

import cn.tslanpu.test.add.food.dao.FoodDao;
import cn.tslanpu.test.add.food.domain.Food;
import cn.tslanpu.test.add.food.domain.Food_jdjc;
import cn.tslanpu.test.pager.PageBean;


public class FoodService {
	private FoodDao foodDao = new FoodDao();
	
	
	public Food findbyqyname(String qyname) throws SQLException{
		try
		{
			return foodDao.findbyqyname(qyname);
		} catch (SQLException e)
		{
			throw new RuntimeException();
		}
	}
	public List FindQyname(){
		try
		{
			return foodDao.qynameData();
		} catch (SQLException e)
		{
			throw new RuntimeException();
		}
	}
	//增加流通单位信息
	public void add(Food food){
		try {
			foodDao.add(food);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	public Food foodFind(int id){
		try {
			return foodDao.foodFind(id);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//execl 表
	public List<Food> queryAll(String qyname, String address, String department, 
			String fddelegate, String zzcode){
		try {
			return foodDao.queryAll(qyname, address, department, fddelegate, zzcode);
		} catch (SQLException e) {
			throw new  RuntimeException(e);
		}
	}
	
	public void foodUpdate(int id, Food food){
		try {
			foodDao.foodUpdate(id, food);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	public void delete(int id){
		try {
			foodDao.delete(id);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	//根据公司名称进行模糊查询
	public PageBean<Food> queryByName(String qyname, int pageCode){
		try {
			return foodDao.queryByName(qyname, pageCode);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	//根据所属单位进行分页查询
	public PageBean<Food> queryPage(String department, int pageCode){
		try {
			return foodDao.queryPage(department, pageCode);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//根据所有单位进行分页查询
	public PageBean<Food> fingByCategory(int pageCode){
		try {
			return foodDao.fingByCategory(pageCode);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public PageBean<Food> queryZ(String qyname, String address,
			String department, String fddelegate, String zzcode, int pageCode) {
		try {
			return foodDao.queryZ(qyname, address, department,fddelegate, zzcode, pageCode);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List dispNameData() {
		try {
			return foodDao.dispNameData();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public Food  byqynameFull(String qyname) {
		try {
			return foodDao.byqynameFull(qyname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public void add_jdjc(Food_jdjc food_jdjc) {
		try {
			foodDao.add_jdjc(food_jdjc);
		} catch (SQLException e) {
		    throw new RuntimeException(e);
		}
    }
	
	//查询公司企业监督检查详细信息
	public Food_jdjc getjdjcData(int id){
			try {
				return foodDao.getjdjcData(id);
			} catch (SQLException e) {
				throw new RuntimeException();
			}
		}
}
