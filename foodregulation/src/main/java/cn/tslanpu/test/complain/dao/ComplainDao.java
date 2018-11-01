package cn.tslanpu.test.complain.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.itcast.jdbc.TxQueryRunner;
import cn.tslanpu.test.complain.domain.Complain;

public class ComplainDao {
	private QueryRunner qr = new TxQueryRunner();
	
	//增加信息
	public void add(Complain complain) throws SQLException{
		String sql = "insert into complain(time, number, type, mode, informerName, sex, address, tel, name, " +
				"phone,scaddress,content,idea,department, organizerTime,replyTime,replyWay,yesOrNo,register," +
				"undertaker,situation,signature,signatureTime,result) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		Object[] params = {complain.getTime(),complain.getNumber(),complain.getType(), complain.getMode(), complain.getInformerName(),
				complain.getSex(), complain.getAddress(), complain.getTel(), complain.getName(), complain.getPhone(),
				complain.getScaddress(), complain.getContent(), complain.getIdea(), complain.getDepartment(), complain.getOrganizerTime(),
				complain.getReplyTime(), complain.getReplyWay(), complain.getYesOrNo(), complain.getRegister(),complain.getUndertaker(),
				complain.getSituation(), complain.getSignature(), complain.getSignatureTime(), complain.getResult() };
		qr.update(sql, params);
	}
	
	//更新信息
	public void complainUpdate(int id, Complain complain) throws SQLException{
		String sql = "update complain set time=?, number=?, type=?, mode=?, informerName=?, sex=?, address=?, tel=?, name=?, " +
				"phone=?,scaddress=?,content=?,idea=?,department=?, organizerTime=?,replyTime=?,replyWay=?,yesOrNo=?,register=?," +
				"undertaker=?,situation=?,signature=?,signatureTime=?,result=? where id=?";
		Object[] params = {complain.getTime(),complain.getNumber(),complain.getType(), complain.getMode(), complain.getInformerName(),
				complain.getSex(), complain.getAddress(), complain.getTel(), complain.getName(), complain.getPhone(),
				complain.getScaddress(), complain.getContent(), complain.getIdea(), complain.getDepartment(), complain.getOrganizerTime(),
				complain.getReplyTime(), complain.getReplyWay(), complain.getYesOrNo(), complain.getRegister(),complain.getUndertaker(),
				complain.getSituation(), complain.getSignature(), complain.getSignatureTime(),complain.getResult(), id };
		qr.update(sql, params);
	}
	
	//部分更新
	public void update(int id, Complain complain) throws SQLException{
		String sql = "update complain set organizerTime=?,replyTime=?,replyWay=?,yesOrNo=?,register=?," +
				"undertaker=?,situation=?,signature=?,signatureTime=?,result=? where id=?";
		Object[] params = {complain.getOrganizerTime(),
				complain.getReplyTime(), complain.getReplyWay(), complain.getYesOrNo(), complain.getRegister(),complain.getUndertaker(),
				complain.getSituation(), complain.getSignature(), complain.getSignatureTime(),complain.getResult(), id };
		qr.update(sql, params);
	}
	
	//查询详细信息
	public Complain complainFind(int id) throws SQLException{
			String sql = "select * from complain where id=?";
			return qr.query(sql, new BeanHandler<Complain>(Complain.class),id);
	}
	
	//删除
	public void complainDelete(int id) throws Exception {
		String sql = "delete from complain where id=?";
		qr.update(sql,id);
	}

}
