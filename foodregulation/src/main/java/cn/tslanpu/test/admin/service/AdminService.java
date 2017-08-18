package cn.tslanpu.test.admin.service;

import java.sql.SQLException;

import cn.tslanpu.test.admin.dao.AdminDao;
import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.pager.PageBean;

public class AdminService {
	private AdminDao adminDao = new AdminDao();
	
	//判断用户是否存在
	public Admin query(String username, String password){
		try {
			return adminDao.query(username, password);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//判断用户名是否存在
	public int exists(String username){
		try {
			return adminDao.exists(username);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//查询所有工作人员信息
	public PageBean<Admin> queryAll(int pageCode){
		try {
			return adminDao.queryAll(pageCode);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//查询部门的所有工作人员
	public PageBean<Admin> queryDep(String department, int pageCode){
		try {
			return adminDao.queryDep(department, pageCode);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//根据Id删除当前工作人员
	public void delete(int id){
		 try {
			adminDao.delete(id);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//根据Id查询工作人员
	public Admin queryInfor(int id){
		try {
			return adminDao.queryInfor(id);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//初次登陆更新当前用户密码
	public void updatePassword(String username, String password){
		try {
			adminDao.updatePassword(username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//初始化当前用户密码
	public void initialize(int id){
		try {
			adminDao.initialize(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//根据名字模糊查询
	public PageBean<Admin> queryByName(String name, int pageCode){
		try {
			return adminDao.queryByName(name, pageCode);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//联合查询
	public PageBean<Admin> query(String name,String department, int pageCode){
		try {
			return adminDao.query(name, department, pageCode);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static void main(String[] args) {
		AdminService admminService = new AdminService();
		//System.out.println(admminService.queryAll(1).getDatas().get(2).getName());
		Admin admin = new Admin();
		int id = 209;
			admminService.initialize(id);
		}
	}

