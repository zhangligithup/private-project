package cn.tslanpu.test.add.agricultural.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.jdbc.TxQueryRunner;
import cn.tslanpu.test.add.agricultural.domain.Agricultural;
import cn.tslanpu.test.pager.Expression;
import cn.tslanpu.test.pager.PageBean;

public class AgriculturalDao {

	private QueryRunner qr = new TxQueryRunner();

	// 通过企业名查询
	public Agricultural findByQyname(String qyname) throws SQLException {
		String sql = "select * from agricultural where qyname=?";
		return qr.query(sql, new BeanHandler<Agricultural>(Agricultural.class), qyname);
	}

	// 查询企业名
	public List qynameData() throws SQLException {
		String sql = "select qyname from agricultural";
		return qr.query(sql, new MapListHandler());
	}

	// 增加信息
	public void add(Agricultural agricultural) throws SQLException {
		String sql = "insert into agricultural(qyname, address, scaddress, qydelegate, qyphone, zzcode, scpermit, jyType, itemsOfBusiness, longitude, "
				+ "latitude,department,spdelegate,jiandurenyuan,xieguanrenyuan, amend,idNumber,numberOfEmployees,recordDate,recordEffectiveDate,recordOrgan,recordCardNumber,mainBody,businessScope,businessLicense,smallStallregistrationCard,healthCertificate)"
				+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		Object[] params = { agricultural.getQyname(), agricultural.getAddress(), agricultural.getScaddress(),
				agricultural.getQydelegate(), agricultural.getQyphone(), agricultural.getZzcode(),
				agricultural.getScpermit(), agricultural.getJyType(), agricultural.getItemsOfBusiness(),
				agricultural.getLongitude(), agricultural.getLatitude(), agricultural.getDepartment(),
				agricultural.getSpdelegate(), agricultural.getJiandurenyuan(), agricultural.getXieguanrenyuan(),
				agricultural.getAmend(),agricultural.getIdNumber(),agricultural.getNumberOfEmployees(),agricultural.getRecordDate(),agricultural.getRecordEffectiveDate(),agricultural.getRecordOrgan(),agricultural.getRecordCardNumber(),agricultural.getMainBody()
				,agricultural.getBusinessScope(),agricultural.getBusinessLicense(),agricultural.getSmallStallregistrationCard(),agricultural.getHealthCertificate()};
		qr.update(sql, params);
	}

	// 更新信息
	public void agriculturalUpdate(int id, Agricultural agricultural) throws SQLException {
		String sql = "update agricultural set qyname=?, address=?, scaddress=?, qydelegate=?, qyphone=?, zzcode=?, scpermit=?, jyType=?, itemsOfBusiness=?, longitude=?, "
				+ "latitude=?,department=?,spdelegate=?,jiandurenyuan=?,xieguanrenyuan=?, amend=?,idNumber=?,numberOfEmployees=?,recordDate=?,recordEffectiveDate=?,"
				+ "recordOrgan=?,recordCardNumber=?,mainBody=?,businessScope=?,businessLicense=?,smallStallregistrationCard=?,healthCertificate=? where id=?";
		Object[] params = { agricultural.getQyname(), agricultural.getAddress(), agricultural.getScaddress(),
				agricultural.getQydelegate(), agricultural.getQyphone(), agricultural.getZzcode(),
				agricultural.getScpermit(), agricultural.getJyType(), agricultural.getItemsOfBusiness(),
				agricultural.getLongitude(), agricultural.getLatitude(), agricultural.getDepartment(),
				agricultural.getSpdelegate(), agricultural.getJiandurenyuan(), agricultural.getXieguanrenyuan(),
				agricultural.getAmend(),agricultural.getIdNumber(),agricultural.getNumberOfEmployees(),agricultural.getRecordDate(),agricultural.getRecordEffectiveDate(),agricultural.getRecordOrgan(),agricultural.getRecordCardNumber(),agricultural.getMainBody()
				,agricultural.getBusinessScope(),agricultural.getBusinessLicense(),agricultural.getSmallStallregistrationCard(),agricultural.getHealthCertificate(), id };
		qr.update(sql, params);
	}

	// 查询详细信息
	public Agricultural agriculturalFind(int id) throws SQLException {
		String sql = "select * from agricultural where id=?";
		Agricultural agricultural = qr.query(sql, new BeanHandler<Agricultural>(Agricultural.class), id);
		return agricultural;
	}

	// 删除
	public void agriculturalDelete(int id) throws Exception {
		String sql = "delete from agricultural where id=?";
		qr.update(sql, id);
	}

	// 根据所属单位进行分页查询
	public PageBean<Agricultural> queryZ(String qyname, String address, String department, String fddelegate,
			String zzcode, int pageCode) throws SQLException {
		List<Expression> experList = new ArrayList<Expression>();
		experList.add(new Expression("qyname", "like", "%" + qyname + "%"));
		experList.add(new Expression("department", "like", "%" + department + "%"));
		experList.add(new Expression("address", "like", "%" + address + "%"));
		experList.add(new Expression("department", "like", "%" + department + "%"));
		experList.add(new Expression("qydelegate", "like", "%" + fddelegate + "%"));
		experList.add(new Expression("zzcode", "like", "%" + zzcode + "%"));
		return findByAgricultural(experList, pageCode);
	}

	// execl 表
	public List<Agricultural> queryAll(String qyname, String address, String department, String fddelegate,
			String zzcode) throws SQLException {

		String sql = "select * from agricultural where qyname like '%" + qyname + "%' and department like '%"
				+ department + "%' and " + "address like '%" + address + "%' and qydelegate like '%" + fddelegate
				+ "%' and zzcode like '%" + zzcode + "%'";
		return qr.query(sql, new BeanListHandler<Agricultural>(Agricultural.class));
	}

	// 通用查询方法
	private PageBean<Agricultural> findByAgricultural(List<Expression> exprList, int pageCode) throws SQLException {
		/*
		 * 1.得到pageSize 2.得到totalRecord 3.得到beanList 4.创建pageBean返回
		 */
		PageBean<Agricultural> pb1 = new PageBean<Agricultural>();
		int pageSize = pb1.getPageSize();
		/*
		 * 通过ecprList生产where子句
		 */
		StringBuilder whereSql = new StringBuilder(" where 1=1 ");
		List<Object> params = new ArrayList<Object>();
		for (Expression expr : exprList) {
			whereSql.append(" and ").append(expr.getName()).append(" ").append(expr.getOperator()).append(" ");
			if (!expr.getOperator().equals("is null")) {
				whereSql.append("?");
				params.add(expr.getValue());
			}
		}

		// 总记录数
		String sql = "select count(*) from agricultural" + whereSql;
		Number number = (Number) qr.query(sql, new ScalarHandler(), params.toArray());
		int totalRecord = number.intValue();

		// 当前页的记录
		sql = "select * from agricultural" + whereSql + " order by id limit ?,?";
		params.add((pageCode - 1) * pageSize);
		params.add(pageSize);
		List<Agricultural> datas = qr.query(sql, new BeanListHandler<Agricultural>(Agricultural.class),
				params.toArray());

		PageBean<Agricultural> pb = new PageBean<Agricultural>();
		pb.setDatas(datas);
		pb.setPageCode(pageCode);
		pb.setPageSize(pageSize);
		pb.setTotalRecord(totalRecord);
		return pb;
	}

}
