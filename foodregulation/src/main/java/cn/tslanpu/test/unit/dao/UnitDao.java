package cn.tslanpu.test.unit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.foodregulation.dao.entity.Dictionary;

import cn.itcast.jdbc.TxQueryRunner;

public class UnitDao {
	private QueryRunner qr = new TxQueryRunner();
	
	public List<Dictionary> query() throws SQLException{
		String sql = "select id,t_dictionary_code as tDictionaryCode,t_dictionary_name as tDictionaryName,t_dictionary_type as tDictionaryType from t_dictionary where t_dictionary_type = 2";
        return qr.query(sql, new BeanListHandler<Dictionary>(Dictionary.class));
	}
	
	public List<Dictionary> queryEnterpriseInfo() throws SQLException{
		String sql = "select id,t_dictionary_code as tDictionaryCode,t_dictionary_name as tDictionaryName,t_dictionary_type as tDictionaryType from t_dictionary where t_dictionary_type = 1";
        return qr.query(sql, new BeanListHandler<Dictionary>(Dictionary.class));
	}
	
	public List<Dictionary> queryEconomic() throws SQLException{
		String sql = "select id,t_dictionary_code as tDictionaryCode,t_dictionary_name as tDictionaryName,t_dictionary_type as tDictionaryType from t_dictionary where t_dictionary_type = 5";
		return qr.query(sql, new BeanListHandler<Dictionary>(Dictionary.class));
	}
}
