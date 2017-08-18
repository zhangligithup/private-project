package cn.tslanpu.test.action.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.jdbc.TxQueryRunner;
import cn.tslanpu.test.action.action.Action;

public class ActionDao {
	private QueryRunner qr = new TxQueryRunner();
	
	//增加单位
	public int add(String actionname, int num) throws SQLException{
		String sql = "insert into action (actionname, department) values (?,?)";
		return qr.update(sql,actionname,num);
	}
	
	
	//根据department查询单位名称
	public Action query(String department) throws SQLException{
		String sql = "select * from action where department=?";
		return qr.query(sql, new BeanHandler<Action>(Action.class),department);
	}
	
	//根据actionname查询单位对应depardment；
	public Action queryActionname(String actionname) throws SQLException{
		String sql = "select * from action where actionname=?";
		return qr.query(sql, new BeanHandler<Action>(Action.class), actionname);
	}
	
	//查询所有分区
	public List<Action> queryAll() throws SQLException{
		String sql = "select * from action";
		return qr.query(sql, new BeanListHandler<Action>(Action.class));
	}
	
	//查询分区个数
	public int count() throws SQLException{
		String sql = "select count(*) from action";
		Number num = (Number) qr.query(sql, new ScalarHandler());
		return num.intValue();
	}
	
}
