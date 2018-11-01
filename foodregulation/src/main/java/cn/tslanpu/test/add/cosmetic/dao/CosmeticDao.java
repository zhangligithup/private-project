package cn.tslanpu.test.add.cosmetic.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.jdbc.TxQueryRunner;
import cn.tslanpu.test.add.cosmetic.domain.Cosmetic;
import cn.tslanpu.test.add.cosmetic.domain.Cosmetic_jdjc;
import cn.tslanpu.test.pager.Expression;
import cn.tslanpu.test.pager.PageBean;

public class CosmeticDao {
	
		private QueryRunner qr = new TxQueryRunner();
			
			//增加信息
		public void add(Cosmetic cosmetic) throws SQLException{
			String sql = "insert into cosmetic(qyname, address, scaddress, ems, phone, fax, email, jjtype, gsorganization, zzcode, " +
					"fddelegate, fdphone, qydelegate, qyphone, department, spdelegate, jiandurenyuan, xieguanrenyuan, jyArea, jyNum, " +
					"scpermit, fazhengjiguan, fazhengriqi, youxiaodate, longitude, latitude, jyType, healthFood, cosmetic, cyNum, " +
					"graduateNum, juniorNum, manage, amend ) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			Object[] params = {cosmetic.getQyname(),cosmetic.getAddress(),cosmetic.getScaddress(),cosmetic.getEms(),cosmetic.getPhone(),
					cosmetic.getFax(),cosmetic.getEmail(),cosmetic.getJjtype(),cosmetic.getGsorganization(),cosmetic.getZzcode(),
					cosmetic.getFddelegate(),cosmetic.getFdphone(),cosmetic.getQydelegate(),cosmetic.getQyphone(),cosmetic.getDepartment(),
					cosmetic.getSpdelegate(),cosmetic.getJiandurenyuan(),cosmetic.getXieguanrenyuan(),cosmetic.getJyArea(),cosmetic.getJyNum(),
					cosmetic.getScpermit(),cosmetic.getFazhengjiguan(),cosmetic.getFazhengriqi(),cosmetic.getYouxiaodate(),cosmetic.getLongitude(),
					cosmetic.getLatitude(),cosmetic.getJyType(),cosmetic.getHealthFood(),cosmetic.getCosmetic(),cosmetic.getCyNum(),
					cosmetic.getGraduateNum(),cosmetic.getJuniorNum(),cosmetic.getManage(),cosmetic.getAmend() };
			qr.update(sql, params);
		}
		
		//更新信息
		public void cosmeticUpdate(int id, Cosmetic cosmetic) throws SQLException{
			String sql = "update cosmetic set qyname=?, address=?, scaddress=?, ems=?, phone=?, fax=?, email=?, jjtype=?, gsorganization=?, zzcode=?, " +
					"fddelegate=?, fdphone=?, qydelegate=?, qyphone=?, department=?, spdelegate=?, jiandurenyuan=?, xieguanrenyuan=?, jyArea=?, jyNum=?, " +
					"scpermit=?, fazhengjiguan=?, fazhengriqi=?, youxiaodate=?, longitude=?, latitude=?, jyType=?, healthFood=?, cosmetic=?, cyNum=?, " +
					"graduateNum=?, juniorNum=?, manage=?, amend=? where id=?";
			Object[] params = {cosmetic.getQyname(),cosmetic.getAddress(),cosmetic.getScaddress(),cosmetic.getEms(),cosmetic.getPhone(),
					cosmetic.getFax(),cosmetic.getEmail(),cosmetic.getJjtype(),cosmetic.getGsorganization(),cosmetic.getZzcode(),
					cosmetic.getFddelegate(),cosmetic.getFdphone(),cosmetic.getQydelegate(),cosmetic.getQyphone(),cosmetic.getDepartment(),
					cosmetic.getSpdelegate(),cosmetic.getJiandurenyuan(),cosmetic.getXieguanrenyuan(),cosmetic.getJyArea(),cosmetic.getJyNum(),
					cosmetic.getScpermit(),cosmetic.getFazhengjiguan(),cosmetic.getFazhengriqi(),cosmetic.getYouxiaodate(),cosmetic.getLongitude(),
					cosmetic.getLatitude(),cosmetic.getJyType(),cosmetic.getHealthFood(),cosmetic.getCosmetic(),cosmetic.getCyNum(),
					cosmetic.getGraduateNum(),cosmetic.getJuniorNum(),cosmetic.getManage(),cosmetic.getAmend(), id };
			qr.update(sql, params);
	}
		//查询详细信息
		public Cosmetic cosmeticFind(int id) throws SQLException{
				String sql = "select * from cosmetic where id=?";
				return qr.query(sql, new BeanHandler<Cosmetic>(Cosmetic.class),id);
		}
		
		//删除
		public void cosmeticDelete(int id) throws Exception {
			String sql = "delete from cosmetic where id=?";
			qr.update(sql,id);
		}
		
		//根据所属单位进行分页查询
		public PageBean<Cosmetic> queryZ(String qyname, String address, String department, String fddelegate, String zzcode, int pageCode) throws SQLException{
			List<Expression> experList = new ArrayList<Expression>();
			experList.add(new Expression("qyname", "like","%" + qyname + "%"));
			experList.add(new Expression("department", "like","%" + department + "%"));
			experList.add(new Expression("address", "like","%" + address + "%"));
			experList.add(new Expression("department", "like","%" + department + "%"));
			experList.add(new Expression("fddelegate", "like","%" + fddelegate + "%"));
			experList.add(new Expression("zzcode", "like","%" + zzcode + "%"));
			return findByCriteria(experList, pageCode);
		}
		
		//execl 表
		public List<Cosmetic> queryAll(String qyname, String address, String department, 
				String fddelegate, String zzcode) throws SQLException{
			
			String sql = "select * from cosmetic where qyname like '%" + qyname + "%' and department like '%" + department + "%' and " +
					"address like '%" + address + "%' and fddelegate like '%" + fddelegate + "%' and zzcode like '%" + zzcode + "%'";
			return qr.query(sql, new BeanListHandler<Cosmetic>(Cosmetic.class));
		}
		
		//通用查询方法
		private PageBean<Cosmetic> findByCriteria(List<Expression> exprList, int pageCode) throws SQLException{
			/*
			 * 1.得到pageSize
			 * 2.得到totalRecord
			 * 3.得到beanList
			 * 4.创建pageBean返回
			 */
			PageBean<Cosmetic> pb1 = new PageBean<Cosmetic>();
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
			String sql = "select count(*) from cosmetic" + whereSql;
			Number number = (Number)qr.query(sql, new ScalarHandler(), params.toArray());
			int totalRecord = number.intValue();
			
			//当前页的记录
			sql = "select * from cosmetic" + whereSql + " order by id limit ?,?";
			params.add((pageCode - 1) * pageSize);
			params.add(pageSize);
			List<Cosmetic> datas = qr.query(sql, new BeanListHandler<Cosmetic>(Cosmetic.class), params.toArray());
			
			PageBean<Cosmetic> pb = new PageBean<Cosmetic>();
			pb.setDatas(datas);
			pb.setPageCode(pageCode);
			pb.setPageSize(pageSize);
			pb.setTotalRecord(totalRecord);
			return pb;
		}
		
		//增添部生产企业监管记录
		public void add_jdjc(Cosmetic_jdjc cosmetic_jdjc) throws SQLException {
			String sql ="insert into cosmetic_jdjc(qyname,scaddress,qydelegate,qyphone,zzcode,scpermit,jcry1,jcry1id,jcry2,"
					+"jcry2id,jcaddress,qyidea,checkednum,pointnum,pointstr,pointproblemnum,pointproblemstr,nopointnum,nopointstr"
					+",nopointproblemnum,nopointproblemstr,isvalue1str,isvalue0str,date1,date2,date3,image_resource,other,markstr,detailspoint,detailsnopoint,departmentName,departmentNameTime,jcryName,jcryNameTime，result,accord)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";	      
			Object[] params = {cosmetic_jdjc.getQyname(),cosmetic_jdjc.getScaddress(),cosmetic_jdjc.getQydelegate(),cosmetic_jdjc.getQyphone(),cosmetic_jdjc.getZzcode(),cosmetic_jdjc.getScpermit(),cosmetic_jdjc.getJcry1(),
					cosmetic_jdjc.getJcry1id(),cosmetic_jdjc.getJcry2(),cosmetic_jdjc.getJcry2id(),cosmetic_jdjc.getJcaddress(),cosmetic_jdjc.getQyidea(),cosmetic_jdjc.getCheckednum(),cosmetic_jdjc.getPointnum(),cosmetic_jdjc.getPointstr(),cosmetic_jdjc.getPointproblemnum(),cosmetic_jdjc.getPointproblemstr(),
					cosmetic_jdjc.getNopointnum(),cosmetic_jdjc.getNopointstr(),cosmetic_jdjc.getNopointproblemnum(),
					cosmetic_jdjc.getNopointproblemstr(),cosmetic_jdjc.getIsvalue1str(),cosmetic_jdjc.getIsvalue0str(),cosmetic_jdjc.getDate1(),cosmetic_jdjc.getDate2(),cosmetic_jdjc.getDate3(),cosmetic_jdjc.getImage_resource(),cosmetic_jdjc.getOther(),
					cosmetic_jdjc.getMarkstr(),cosmetic_jdjc.getDetailspoint(),cosmetic_jdjc.getDetailsnopoint(),
					cosmetic_jdjc.getDepartmentName(),cosmetic_jdjc.getDepartmentNameTime(),cosmetic_jdjc.getJcryName(),cosmetic_jdjc.getJcryNameTime(),cosmetic_jdjc.getResult(),cosmetic_jdjc.getAccord()};
			qr.update(sql,params);
		}
		//查询公司监督检查详细信息
		public Cosmetic_jdjc getjdjcData(int id) throws SQLException{
			String sql = "select * from cosmetic_jdjc where id=?";
			return qr.query(sql, new BeanHandler<Cosmetic_jdjc>(Cosmetic_jdjc.class),id);
		}
		
		//获取全部生产企业名称和id
		public List dispNameData() throws SQLException {
			String sql = "select id,qyname from cosmetic" ;
			return qr.query(sql, new MapListHandler());
		}
				
		//根据企业名称查询该对象
		public Cosmetic byqynameFull(String qyname) throws SQLException {
			String sql = "select * from cosmetic where qyname=?" ;
			return qr.query(sql, new BeanHandler<Cosmetic>(Cosmetic.class),qyname);
		}		
		
}
