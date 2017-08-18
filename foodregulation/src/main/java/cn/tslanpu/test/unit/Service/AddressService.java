package cn.tslanpu.test.unit.Service;

import java.sql.SQLException;
import java.util.List;

import com.foodregulation.dao.entity.Dictionary;

import cn.tslanpu.test.unit.dao.AddressDao;

public class AddressService {
	private AddressDao addressDao = new AddressDao();
	public List<Dictionary> queryAddress(){
		try {
			return addressDao.queryAddress();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
