package cn.tslanpu.test.unit.Service;

import java.sql.SQLException;
import java.util.List;

import cn.tslanpu.test.unit.dao.PositionDao;
import cn.tslanpu.test.unit.domain.Position;

public class PositionService {
	private PositionDao positionDao = new PositionDao();
	
	public List<Position> query(){
		try {
			return positionDao.query();
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
}
