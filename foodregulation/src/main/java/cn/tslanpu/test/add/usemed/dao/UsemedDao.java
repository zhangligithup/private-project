package cn.tslanpu.test.add.usemed.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.jdbc.TxQueryRunner;
import cn.tslanpu.test.add.usemed.domain.Usemed;
import cn.tslanpu.test.add.usemed.domain.Usemed_jdjc;
import cn.tslanpu.test.pager.Expression;
import cn.tslanpu.test.pager.PageBean;

public class UsemedDao {
		private QueryRunner qr = new TxQueryRunner();
	
	//增加信息
		public void add(Usemed usemed) throws SQLException{
			String sql = "insert into usemed(qyname, address, scaddress, ems, phone, fax, email, jjtype, gsorganization, zzcode, " +
					"fddelegate, fdphone, qydelegate, qyphone, department, spdelegate, jiandurenyuan, xieguanrenyuan, jyArea, useCategory, " +
					"scpermit, fazhengjiguan, fazhengriqi, youxiaodate, longitude, latitude, market, useEnterprise, name, manufacturer, " +
					"guiGe, priductCode, supplier,time, amend ) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			Object[] params = {usemed.getQyname(),usemed.getAddress(),usemed.getScaddress(),usemed.getEms(),usemed.getPhone(),
					usemed.getFax(),usemed.getEmail(),usemed.getJjtype(),usemed.getGsorganization(),usemed.getZzcode(),
					usemed.getFddelegate(),usemed.getFdphone(),usemed.getQydelegate(),usemed.getQyphone(),usemed.getDepartment(),
					usemed.getSpdelegate(),usemed.getJiandurenyuan(),usemed.getXieguanrenyuan(),usemed.getJyArea(),usemed.getUseCategory(),
					usemed.getScpermit(),usemed.getFazhengjiguan(),usemed.getFazhengriqi(),usemed.getYouxiaodate(),usemed.getLongitude(),
					usemed.getLatitude(),usemed.getMarket(),usemed.getUseEnterprise(),usemed.getName(),usemed.getManufacturer(),
					usemed.getGuiGe(),usemed.getPriductCode(),usemed.getSupplier(),usemed.getTime(),usemed.getAmend() };
			qr.update(sql, params);
		}
		
		//更新信息
		public void usemedUpdate(int id, Usemed usemed) throws SQLException{
			String sql = "update usemed set qyname=?, address=?, scaddress=?, ems=?, phone=?, fax=?, email=?, jjtype=?, gsorganization=?, zzcode=?, " +
					"fddelegate=?, fdphone=?, qydelegate=?, qyphone=?, department=?, spdelegate=?, jiandurenyuan=?, xieguanrenyuan=?, jyArea=?, useCategory=?, " +
					"scpermit=?, fazhengjiguan=?, fazhengriqi=?, youxiaodate=?, longitude=?, latitude=?, market=?, useEnterprise=?, name=?, manufacturer=?, " +
					"guiGe=?, priductCode=?, supplier=?,time=?, amend=? where id=?";
			Object[] params = {usemed.getQyname(),usemed.getAddress(),usemed.getScaddress(),usemed.getEms(),usemed.getPhone(),
				usemed.getFax(),usemed.getEmail(),usemed.getJjtype(),usemed.getGsorganization(),usemed.getZzcode(),
				usemed.getFddelegate(),usemed.getFdphone(),usemed.getQydelegate(),usemed.getQyphone(),usemed.getDepartment(),
				usemed.getSpdelegate(),usemed.getJiandurenyuan(),usemed.getXieguanrenyuan(),usemed.getJyArea(),usemed.getUseCategory(),
				usemed.getScpermit(),usemed.getFazhengjiguan(),usemed.getFazhengriqi(),usemed.getYouxiaodate(),usemed.getLongitude(),
				usemed.getLatitude(),usemed.getMarket(),usemed.getUseEnterprise(),usemed.getName(),usemed.getManufacturer(),
				usemed.getGuiGe(),usemed.getPriductCode(),usemed.getSupplier(),usemed.getTime(),usemed.getAmend(), id };
			qr.update(sql, params);
		}
		//查询详细信息
		public Usemed usemedFind(int id) throws SQLException{
				String sql = "select * from usemed where id=?";
				return qr.query(sql, new BeanHandler<Usemed>(Usemed.class),id);
		}
		
		//删除
		public void usemedDelete(int id) throws Exception {
			String sql = "delete from usemed where id=?";
			qr.update(sql,id);
		}
		
		//execl 表
		public List<Usemed> queryAll(String qyname, String address, String department, 
				String fddelegate, String zzcode) throws SQLException{
			
			String sql = "select * from usemed where qyname like '%" + qyname + "%' and department like '%" + department + "%' and " +
					"address like '%" + address + "%' and fddelegate like '%" + fddelegate + "%' and zzcode like '%" + zzcode + "%'";
			return qr.query(sql, new BeanListHandler<Usemed>(Usemed.class));
		}
		
		//根据所属单位进行分页查询
		public PageBean<Usemed> queryZ(String qyname, String address, String department, String fddelegate, String zzcode, int pageCode) throws SQLException{
			List<Expression> experList = new ArrayList<Expression>();
			experList.add(new Expression("qyname", "like","%" + qyname + "%"));
			experList.add(new Expression("department", "like","%" + department + "%"));
			experList.add(new Expression("address", "like","%" + address + "%"));
			experList.add(new Expression("department", "like","%" + department + "%"));
			experList.add(new Expression("fddelegate", "like","%" + fddelegate + "%"));
			experList.add(new Expression("zzcode", "like","%" + zzcode + "%"));
			return findByCriteria(experList, pageCode);
		}
		
		//获取全部生产企业名称和id
		public List dispNameData() throws SQLException {
			String sql = "select id,qyname from usemed" ;
			return qr.query(sql, new MapListHandler());
		}
		//根据企业名称查询该对象
		public Usemed byqynameFull(String qyname) throws SQLException {
				String sql = "select * from usemed where qyname=?" ;
				return qr.query(sql, new BeanHandler<Usemed>(Usemed.class),qyname);
		}	
		
		//查询公司监督检查详细信息
		public Usemed_jdjc getjdjcData(int id) throws SQLException{
				String sql = "select * from usemed_jdjc where id=?";
				return qr.query(sql, new BeanHandler<Usemed_jdjc>(Usemed_jdjc.class),id);
		}
		//增添部生产企业监管记录
		public void add_jdjc(Usemed_jdjc usemed_jdjc) throws SQLException {
					String sql ="insert into usemed_jdjc(qyname,scaddress,qydelegate,qyphone,zzcode,scpermit,jcry1,jcry1id,jcry2,"
							+"jcry2id,jcaddress,qyidea,checkednum,pointnum,pointstr,pointproblemnum,pointproblemstr,nopointnum,nopointstr"
							+",nopointproblemnum,nopointproblemstr,isvalue1str,isvalue0str,date1,date2,date3,image_resource,other,markstr,detailspoint,detailsnopoint" +
									",departmentName,departmentNameTime,jcryName,jcryNameTime,result,accord)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";	      
					Object[] params = {usemed_jdjc.getQyname(),usemed_jdjc.getScaddress(),usemed_jdjc.getQydelegate(),usemed_jdjc.getQyphone(),usemed_jdjc.getZzcode(),usemed_jdjc.getScpermit(),usemed_jdjc.getJcry1(),
							usemed_jdjc.getJcry1id(),usemed_jdjc.getJcry2(),usemed_jdjc.getJcry2id(),usemed_jdjc.getJcaddress(),usemed_jdjc.getQyidea(),usemed_jdjc.getCheckednum(),usemed_jdjc.getPointnum(),usemed_jdjc.getPointstr(),usemed_jdjc.getPointproblemnum(),usemed_jdjc.getPointproblemstr(),usemed_jdjc.getNopointnum(),usemed_jdjc.getNopointstr(),usemed_jdjc.getNopointproblemnum(),
							usemed_jdjc.getNopointproblemstr(),usemed_jdjc.getIsvalue1str(),usemed_jdjc.getIsvalue0str(),usemed_jdjc.getDate1(),usemed_jdjc.getDate2(),usemed_jdjc.getDate3(),usemed_jdjc.getImage_resource(),usemed_jdjc.getOther(),usemed_jdjc.getMarkstr(),usemed_jdjc.getDetailspoint(),usemed_jdjc.getDetailsnopoint(),
							usemed_jdjc.getDepartmentName(),usemed_jdjc.getDepartmentNameTime(),usemed_jdjc.getJcryName(),usemed_jdjc.getJcryNameTime(),usemed_jdjc.getResult(),usemed_jdjc.getAccord()};
					qr.update(sql,params);
				}
		
		//通用查询方法
		private PageBean<Usemed> findByCriteria(List<Expression> exprList, int pageCode) throws SQLException{
			/*
			 * 1.得到pageSize
			 * 2.得到totalRecord
			 * 3.得到beanList
			 * 4.创建pageBean返回
			 */
			PageBean<Usemed> pb1 = new PageBean<Usemed>();
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
			String sql = "select count(*) from usemed" + whereSql;
			Number number = (Number)qr.query(sql, new ScalarHandler(), params.toArray());
			int totalRecord = number.intValue();
			
			//当前页的记录
			sql = "select * from usemed" + whereSql + " order by id limit ?,?";
			params.add((pageCode - 1) * pageSize);
			params.add(pageSize);
			List<Usemed> datas = qr.query(sql, new BeanListHandler<Usemed>(Usemed.class), params.toArray());
			
			PageBean<Usemed> pb = new PageBean<Usemed>();
			pb.setDatas(datas);
			pb.setPageCode(pageCode);
			pb.setPageSize(pageSize);
			pb.setTotalRecord(totalRecord);
			return pb;
		}
}
