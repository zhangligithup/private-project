package cn.tslanpu.test.unit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.itcast.jdbc.TxQueryRunner;
import cn.tslanpu.test.unit.domain.Position;

public class PositionDao {
	private QueryRunner qr = new TxQueryRunner();
	
	public List<Position> query() throws SQLException{
		String sql = "select * from position";
		return qr.query(sql, new BeanListHandler<Position>(Position.class));
	}
}
