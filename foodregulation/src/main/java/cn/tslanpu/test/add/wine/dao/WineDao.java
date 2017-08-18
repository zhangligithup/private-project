package cn.tslanpu.test.add.wine.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.jdbc.TxQueryRunner;
import cn.tslanpu.test.add.wine.domain.Wine;
import cn.tslanpu.test.add.wine.domain.Wine_jdjc;
import cn.tslanpu.test.pager.Expression;
import cn.tslanpu.test.pager.PageBean;

public class WineDao {
	private QueryRunner qr = new TxQueryRunner();
	//增加信息
	public void add(Wine wine) throws SQLException{
			String sql = "insert into wine(qyname, address, scaddress, ems, qydelegate, qyphone, zzcode, " +
					"cldate, department, spdelegate, jiandurenyuan, xieguanrenyuan, " +
					"scpermit, fazhengjiguan, fazhengriqi, youxiaodate, longitude, latitude, jytype, jyrange," +
					"amend ,lerepre,lephone) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			Object[] params = {wine.getQyname(),wine.getAddress(),wine.getScaddress(),wine.getEms(),wine.getQydelegate(),
					wine.getQyphone(),wine.getZzcode(),
					wine.getCldate()
					,wine.getDepartment(),wine.getSpdelegate(),wine.getJiandurenyuan(),wine.getXieguanrenyuan(),
					wine.getScpermit(),wine.getFazhengjiguan(),wine.getFazhengriqi(),wine.getYouxiaodate(),wine.getLongitude(),
					wine.getLatitude(),wine.getJytype(),wine.getJyrange(),
					wine.getAmend(),wine.getLerepre(),wine.getLephone()
			};
			qr.update(sql, params);
	}
	
	//数据删除
			public void delete(int parseInt) throws SQLException {
				String sql = "delete from wine where id=?";
					qr.update(sql, parseInt);

			}
	//查询详细信息
	public Wine wineFind(int id) throws SQLException{
			String sql = "select * from wine where id=?";
			return qr.query(sql, new BeanHandler<Wine>(Wine.class),id);
	}
	
	//根据所属单位进行分页查询
	public PageBean<Wine> queryZ(String qyname, String address, String department, String fddelegate, String zzcode, int pageCode) throws SQLException{
		List<Expression> experList = new ArrayList<Expression>();
		experList.add(new Expression("qyname", "like","%" + qyname + "%"));
		experList.add(new Expression("department", "like","%" + department + "%"));
		experList.add(new Expression("address", "like","%" + address + "%"));
		experList.add(new Expression("lerepre", "like","%" + fddelegate + "%"));
		experList.add(new Expression("zzcode", "like","%" + zzcode + "%"));
		return findByCriteria(experList, pageCode);
	}
	
	//execl 表
	public List<Wine> queryAll(String qyname, String address, String department, 
			String fddelegate, String zzcode) throws SQLException{
		
		String sql = "select * from wine where qyname like '%" + qyname + "%' and department like '%" + department + "%' and " +
				"address like '%" + address + "%' and lerepre like '%" + fddelegate + "%' and zzcode like '%" + zzcode + "%'";
		return qr.query(sql, new BeanListHandler<Wine>(Wine.class));
	}
	
	//通用查询方法
	private PageBean<Wine> findByCriteria(List<Expression> exprList, int pageCode) throws SQLException{
		/*
		 * 1.得到pageSize
		 * 2.得到totalRecord
		 * 3.得到beanList
		 * 4.创建pageBean返回
		 */
		PageBean<Wine> pb1 = new PageBean<Wine>();
		int pageSize = pb1.getPageSize();
		/*
		 * 通过ecprList生产where子句
		 */
		StringBuilder whereSql = new StringBuilder(" where 1=1 ");
		List<Object> params = new ArrayList<Object>();
		for(Expression expr : exprList){
			whereSql.append(" and ").append(expr.getName()).append(" ")
			.append(expr.getOperator()).append(" ");
			if(!expr.getOperator().equals("is null")){
				whereSql.append("?");
				params.add(expr.getValue());
			}
		}
		
		//总记录数
		String sql = "select count(*) from wine" + whereSql;
		Number number = (Number)qr.query(sql, new ScalarHandler(), params.toArray());
		int totalRecord = number.intValue();
		
		//当前页的记录
		sql = "select * from wine" + whereSql + " order by id limit ?,?";
		params.add((pageCode - 1) * pageSize);
		params.add(pageSize);
		List<Wine> datas = qr.query(sql, new BeanListHandler<Wine>(Wine.class), params.toArray());
		
		PageBean<Wine> pb = new PageBean<Wine>();
		pb.setDatas(datas);
		pb.setPageCode(pageCode);
		pb.setPageSize(pageSize);
		pb.setTotalRecord(totalRecord);
		return pb;
	}

	public void update(Wine wine) throws SQLException {
		String sql = "update wine set qyname=?, address=?, scaddress=?, ems=?, qydelegate=?, qyphone=?, zzcode=?, " +
					"cldate=?, department=?, spdelegate=?, jiandurenyuan=?, xieguanrenyuan=?, " +
					"scpermit=?, fazhengjiguan=?, fazhengriqi=?, youxiaodate=?, longitude=?, latitude=?, jytype=?, jyrange=?," +
					"amend =?,lerepre=?,lephone=? where id=?";
	Object[] params = {wine.getQyname(),wine.getAddress(),wine.getScaddress(),wine.getEms(),wine.getQydelegate(),
			wine.getQyphone(),wine.getZzcode(),
			wine.getCldate(),wine.getDepartment(),wine.getSpdelegate(),wine.getJiandurenyuan(),wine.getXieguanrenyuan(),
			wine.getScpermit(),wine.getFazhengjiguan(),wine.getFazhengriqi(),wine.getYouxiaodate(),wine.getLongitude(),
			wine.getLatitude(),wine.getJytype(),wine.getJyrange(),
			wine.getAmend(),wine.getLerepre(),wine.getLephone(),wine.getId()
	};
	qr.update(sql, params);
	}
	
	//查询公司监督检查详细信息
	public Wine_jdjc getjdjcData(int id) throws SQLException{
			String sql = "select * from wine_jdjc where id=?";
			return qr.query(sql, new BeanHandler<Wine_jdjc>(Wine_jdjc.class),id);
	}
	
	//获取全部生产企业名称和id
	public List dispNameData() throws SQLException {
		String sql = "select id,qyname from wine" ;
		return qr.query(sql, new MapListHandler());
	}

	//根据企业名称查询wine对象
	public Wine byqynameFull(String qyname) throws SQLException {
		String sql = "select * from wine where qyname=?" ;
		return qr.query(sql, new BeanHandler<Wine>(Wine.class),qyname);
	}

	//增添部酒类企业监管记录
	public void add_jdjc(Wine_jdjc wine_jdjc) throws SQLException {
		String sql ="insert into wine_jdjc(qyname,scaddress,qydelegate,qyphone,zzcode,scpermit,jcry1,jcry1id,jcry2,"
				+"jcry2id,jcaddress,qyidea,checkednum,pointnum,pointstr,pointproblemnum,pointproblemstr,nopointnum,nopointstr"
				+",nopointproblemnum,nopointproblemstr,isvalue1str,isvalue0str,date1,date2,date3,image_resource,other,markstr,detailspoint,detailsnopoint" +
						",departmentName,departmentNameTime,jcryName,jcryNameTime,result,accord)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";	      
		Object[] params = {wine_jdjc.getQyname(),wine_jdjc.getScaddress(),wine_jdjc.getQydelegate(),wine_jdjc.getQyphone(),wine_jdjc.getZzcode(),wine_jdjc.getScpermit(),wine_jdjc.getJcry1(),
				wine_jdjc.getJcry1id(),wine_jdjc.getJcry2(),wine_jdjc.getJcry2id(),wine_jdjc.getJcaddress(),wine_jdjc.getQyidea(),wine_jdjc.getCheckednum(),wine_jdjc.getPointnum(),wine_jdjc.getPointstr(),wine_jdjc.getPointproblemnum(),wine_jdjc.getPointproblemstr(),wine_jdjc.getNopointnum(),wine_jdjc.getNopointstr(),wine_jdjc.getNopointproblemnum(),
				wine_jdjc.getNopointproblemstr(),wine_jdjc.getIsvalue1str(),wine_jdjc.getIsvalue0str(),wine_jdjc.getDate1(),wine_jdjc.getDate2(),wine_jdjc.getDate3(),wine_jdjc.getImage_resource(),wine_jdjc.getOther(),wine_jdjc.getMarkstr(),wine_jdjc.getDetailspoint(),wine_jdjc.getDetailsnopoint(),
				wine_jdjc.getDepartmentName(),wine_jdjc.getDepartmentNameTime(),wine_jdjc.getJcryName(),wine_jdjc.getJcryNameTime(),wine_jdjc.getResult(),wine_jdjc.getAccord()};
		qr.update(sql,params);
	}
	
}
