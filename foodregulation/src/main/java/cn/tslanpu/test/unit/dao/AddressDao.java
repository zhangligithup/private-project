package cn.tslanpu.test.unit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.foodregulation.dao.entity.Dictionary;

import cn.itcast.jdbc.TxQueryRunner;

public class AddressDao {

    private QueryRunner qr = new TxQueryRunner();


    public List<Dictionary> queryAddress() throws SQLException {
        String sql = "select id,t_dictionary_code as tDictionaryCode,t_dictionary_name as tDictionaryName,t_dictionary_type as tDictionaryType from t_dictionary where t_dictionary_type = 0";
        return qr.query(sql, new BeanListHandler<Dictionary>(Dictionary.class));
    }
}
