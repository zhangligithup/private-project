package cn.tslanpu.test.add.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.jdbc.TxQueryRunner;
import cn.tslanpu.test.add.bean.JdProduction;

public class JdProductionDao {
	private QueryRunner qr = new TxQueryRunner();
	
	public void add(JdProduction jd) throws SQLException{
		String sql = "insert into jdproduction (name,address,principal,tel,produce,oneOrOne,oneOrOneDescribe,oneOrTwo,oneOrTwoDescribe," +
				"twoOrOne,twoOrOneDescribe,threeOrOne,threeOrOneDescribe,threeOrTwo,threeOrTwoDescribe,fourOrOne,fourOrOneDescribe,fourOrTwo," +
				"fourOrTwoDescribe,fourOrThree,fourOrThreeDescribe,fourOrFour,fourOrFourDescribe,fourOrFive,fourOrFiveDescribe,fiveOrOne," +
				"fiveOrOneDescribe,fiveOrTwo,fiveOrTwoDescribe,fiveOrThree,fiveOrThreeDescribe,fiveOrFour,fiveOrFourDescribe,result,jcryName," +
				"jcDate,bjcryName,bjcDate) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] param = {jd.getName(),jd.getAddress(), jd.getPrincipal(),jd.getTel(),jd.getProduce(),jd.getOneOrOne(),jd.getOneOrOneDescribe(),
				jd.getOneOrTwo(),jd.getOneOrTwoDescribe(),jd.getTwoOrOne(),jd.getTwoOrOneDescribe(),jd.getThreeOrOne(),jd.getThreeOrOneDescribe(),jd.getThreeOrTwo(), jd.getThreeOrTwoDescribe(),
				jd.getFourOrOne(),jd.getFourOrOneDescribe(),jd.getFourOrTwo(),jd.getFourOrTwoDescribe(),jd.getFourOrThree(),jd.getFourOrThreeDescribe(),
				jd.getFourOrFour(),jd.getFourOrFourDescribe(),jd.getFourOrFive(),jd.getFourOrFiveDescribe(),jd.getFiveOrOne(),jd.getFiveOrOneDescribe(),
				jd.getFiveOrTwo(),jd.getFiveOrTwoDescribe(),jd.getFiveOrThree(),jd.getFiveOrThreeDescribe(),jd.getFiveOrFour(),jd.getFiveOrFourDescribe(),
				jd.getResult(),jd.getJcryName(),jd.getJcDate(),jd.getBjcryName(),jd.getBjcDate(),};
		qr.update(sql, param);
	}
	public int queryExits(String name) throws SQLException{
		String sql = "select count(*) from jdproduction where name = ?";
		Number number =  (Number) qr.query(sql, new ScalarHandler(), name);
		return number.intValue();
	}
}
