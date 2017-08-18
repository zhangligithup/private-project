package cn.tslanpu.test.add.health.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.jdbc.TxQueryRunner;
import cn.tslanpu.test.add.food.domain.Food;
import cn.tslanpu.test.add.health.domain.Health;
import cn.tslanpu.test.add.health.domain.Health_jdjc;
import cn.tslanpu.test.pager.Expression;
import cn.tslanpu.test.pager.PageBean;

public class HealthDao {
	
		private QueryRunner qr = new TxQueryRunner();
		
		public Health findbyQY(String qyname) throws SQLException{
			String sql="select * from health where qyname=?";
			return qr.query(sql, new BeanHandler<Health>(Health.class),qyname);
		}
		
		public List qynameData() throws SQLException{
			String sql = "select qyname from health";
			return qr.query(sql, new MapListHandler());
		}	
			//增加信息
		public void add(Health health) throws SQLException{
			String sql = "insert into health(qyname, address, scaddress, ems, phone, fax, email, jjtype, gsorganization, zzcode, " +
					"fddelegate, fdphone, qydelegate, qyphone, department, spdelegate, jiandurenyuan, xieguanrenyuan, jyArea, jyNum, " +
					"scpermit, fazhengjiguan, fazhengriqi, youxiaodate, longitude, latitude, jyType, healthFood, cosmetic, cyNum, " +
					"graduateNum, juniorNum, manage, amend ) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			Object[] params = {health.getQyname(),health.getAddress(),health.getScaddress(),health.getEms(),health.getPhone(),
					health.getFax(),health.getEmail(),health.getJjtype(),health.getGsorganization(),health.getZzcode(),
					health.getFddelegate(),health.getFdphone(),health.getQydelegate(),health.getQyphone(),health.getDepartment(),
					health.getSpdelegate(),health.getJiandurenyuan(),health.getXieguanrenyuan(),health.getJyArea(),health.getJyNum(),
					health.getScpermit(),health.getFazhengjiguan(),health.getFazhengriqi(),health.getYouxiaodate(),health.getLongitude(),
					health.getLatitude(),health.getJyType(),health.getHealthFood(),health.getCosmetic(),health.getCyNum(),
					health.getGraduateNum(),health.getJuniorNum(),health.getManage(),health.getAmend() };
			qr.update(sql, params);
		}
		
		//更新信息
		public void healthUpdate(int id, Health health) throws SQLException{
			String sql = "update health set qyname=?, address=?, scaddress=?, ems=?, phone=?, fax=?, email=?, jjtype=?, gsorganization=?, zzcode=?, " +
					"fddelegate=?, fdphone=?, qydelegate=?, qyphone=?, department=?, spdelegate=?, jiandurenyuan=?, xieguanrenyuan=?, jyArea=?, jyNum=?, " +
					"scpermit=?, fazhengjiguan=?, fazhengriqi=?, youxiaodate=?, longitude=?, latitude=?, jyType=?, healthFood=?, cosmetic=?, cyNum=?, " +
					"graduateNum=?, juniorNum=?, manage=?, amend=? where id=?";
			Object[] params = {health.getQyname(),health.getAddress(),health.getScaddress(),health.getEms(),health.getPhone(),
					health.getFax(),health.getEmail(),health.getJjtype(),health.getGsorganization(),health.getZzcode(),
					health.getFddelegate(),health.getFdphone(),health.getQydelegate(),health.getQyphone(),health.getDepartment(),
					health.getSpdelegate(),health.getJiandurenyuan(),health.getXieguanrenyuan(),health.getJyArea(),health.getJyNum(),
					health.getScpermit(),health.getFazhengjiguan(),health.getFazhengriqi(),health.getYouxiaodate(),health.getLongitude(),
					health.getLatitude(),health.getJyType(),health.getHealthFood(),health.getCosmetic(),health.getCyNum(),
					health.getGraduateNum(),health.getJuniorNum(),health.getManage(),health.getAmend(), id };
			qr.update(sql, params);
	}
		//查询详细信息
		public Health healthFind(int id) throws SQLException{
				String sql = "select * from health where id=?";
				return qr.query(sql, new BeanHandler<Health>(Health.class),id);
		}
		
		//删除
		public void healthDelete(int id) throws Exception {
			String sql = "delete from health where id=?";
			qr.update(sql,id);
		}
		
		//execl 表
		public List<Health> queryAll(String qyname, String address, String department, 
				String fddelegate, String zzcode) throws SQLException{
			
			String sql = "select * from health where qyname like '%" + qyname + "%' and department like '%" + department + "%' and " +
					"address like '%" + address + "%' and fddelegate like '%" + fddelegate + "%' and zzcode like '%" + zzcode + "%'";
			return qr.query(sql, new BeanListHandler<Health>(Health.class));
		}
		
		//根据所属单位进行分页查询
		public PageBean<Health> queryZ(String qyname, String address, String department, String fddelegate, String zzcode, int pageCode) throws SQLException{
			List<Expression> experList = new ArrayList<Expression>();
			experList.add(new Expression("qyname", "like","%" + qyname + "%"));
			experList.add(new Expression("department", "like","%" + department + "%"));
			experList.add(new Expression("address", "like","%" + address + "%"));
			experList.add(new Expression("department", "like","%" + department + "%"));
			experList.add(new Expression("fddelegate", "like","%" + fddelegate + "%"));
			experList.add(new Expression("zzcode", "like","%" + zzcode + "%"));
			return findByCriteria(experList, pageCode);
		}
		
		//增添部生产企业监管记录
		public void add_jdjc(Health_jdjc health_jdjc) throws SQLException {
					String sql ="insert into health_jdjc(qyname,scaddress,qydelegate,qyphone,zzcode,scpermit,jcry1,jcry1id,jcry2,"
							+"jcry2id,jcaddress,qyidea,checkednum,pointnum,pointstr,pointproblemnum,pointproblemstr,nopointnum,nopointstr"
							+",nopointproblemnum,nopointproblemstr,isvalue1str,isvalue0str,date1,date2,date3,image_resource,other,markstr,detailspoint,detailsnopoint" +
									",departmentName,departmentNameTime,jcryName,jcryNameTime,result,accord)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";	      
					Object[] params = {health_jdjc.getQyname(),health_jdjc.getScaddress(),health_jdjc.getQydelegate(),health_jdjc.getQyphone(),health_jdjc.getZzcode(),health_jdjc.getScpermit(),health_jdjc.getJcry1(),
							health_jdjc.getJcry1id(),health_jdjc.getJcry2(),health_jdjc.getJcry2id(),health_jdjc.getJcaddress(),health_jdjc.getQyidea(),health_jdjc.getCheckednum(),health_jdjc.getPointnum(),health_jdjc.getPointstr(),health_jdjc.getPointproblemnum(),health_jdjc.getPointproblemstr(),health_jdjc.getNopointnum(),health_jdjc.getNopointstr(),health_jdjc.getNopointproblemnum(),
							health_jdjc.getNopointproblemstr(),health_jdjc.getIsvalue1str(),health_jdjc.getIsvalue0str(),health_jdjc.getDate1(),health_jdjc.getDate2(),health_jdjc.getDate3(),health_jdjc.getImage_resource(),health_jdjc.getOther(),health_jdjc.getMarkstr(),health_jdjc.getDetailspoint(),health_jdjc.getDetailsnopoint(),
							health_jdjc.getDepartmentName(),health_jdjc.getDepartmentNameTime(),health_jdjc.getJcryName(),health_jdjc.getJcryNameTime(),health_jdjc.getResult(),health_jdjc.getAccord()};
					qr.update(sql,params);
		}
		//查询公司监督检查详细信息
		public Health_jdjc getjdjcData(int id) throws SQLException{
				String sql = "select * from health_jdjc where id=?";
				return qr.query(sql, new BeanHandler<Health_jdjc>(Health_jdjc.class),id);
		}
		//根据企业名称查询该对象
		public Health byqynameFull(String qyname) throws SQLException {
			String sql = "select * from health where qyname=?" ;
			return qr.query(sql, new BeanHandler<Health>(Health.class),qyname);
		}

		//获取全部生产企业名称和id
		public List dispNameData() throws SQLException {
			String sql = "select id,qyname from health" ;
			return qr.query(sql, new MapListHandler());
		}
		
		//通用查询方法
		private PageBean<Health> findByCriteria(List<Expression> exprList, int pageCode) throws SQLException{
			/*
			 * 1.得到pageSize
			 * 2.得到totalRecord
			 * 3.得到beanList
			 * 4.创建pageBean返回
			 */
			PageBean<Health> pb1 = new PageBean<Health>();
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
			String sql = "select count(*) from health" + whereSql;
			Number number = (Number)qr.query(sql, new ScalarHandler(), params.toArray());
			int totalRecord = number.intValue();
			
			//当前页的记录
			sql = "select * from health" + whereSql + " order by id limit ?,?";
			params.add((pageCode - 1) * pageSize);
			params.add(pageSize);
			List<Health> datas = qr.query(sql, new BeanListHandler<Health>(Health.class), params.toArray());
			
			PageBean<Health> pb = new PageBean<Health>();
			pb.setDatas(datas);
			pb.setPageCode(pageCode);
			pb.setPageSize(pageSize);
			pb.setTotalRecord(totalRecord);
			return pb;
		}
		
}
