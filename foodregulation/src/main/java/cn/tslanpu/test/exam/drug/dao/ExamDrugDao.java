package cn.tslanpu.test.exam.drug.dao;

import java.sql.SQLException;

import org.apache.commons.collections.iterators.ObjectArrayIterator;
import org.apache.commons.dbutils.QueryRunner;

import cn.itcast.jdbc.TxQueryRunner;
import cn.tslanpu.test.exam.drug.domain.ExamDrug;

public class ExamDrugDao
{
	QueryRunner qr = new TxQueryRunner();
	public void add(ExamDrug examDrug) throws SQLException{
		String sql="insert into examdrug(d1no,d1to,d1examtype,d1exameddrug,d1examdw,"
				+ "d1exampepl,d1examdate,d2examdw,d2exampeplsign,d2examserial,d2examtime,d2drugname,"
				+ "d2prdctdate,d2oktime,d2size,d2allowno,d2productsite,d2examedsite,d2exameddwaddr,d2mailcode,"
				+ "d2tele,d2drugtype,d2packtype,d2packtypeother,d2xiangfu,d2packstate,d2packstateother,"
				+ "d2storage,d2storagetem,d2samplepack,d2samplepackother,d2samplesum,d2examdexplan,d2remarks,"
				+ "d2exameddwsign)"
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params= {examDrug.getD1no(),examDrug.getD1to(),examDrug.getD1examtype(),examDrug.getD1exameddrug(),
				examDrug.getD1examdw(),examDrug.getD1exampepl(),examDrug.getD1examdate(),examDrug.getD2examdw(),
				examDrug.getD2exampeplsign(),examDrug.getD2examserial(),examDrug.getD2examtime(),examDrug.getD2drugname(),
				examDrug.getD2prdctdate(),examDrug.getD2oktime(),examDrug.getD2size(),examDrug.getD2allowno(),
				examDrug.getD2productsite(),examDrug.getD2examedsite(),examDrug.getD2exameddwaddr(),examDrug.getD2mailcode(),
				examDrug.getD2tele(),examDrug.getD2drugtype(),examDrug.getD2packtype(),examDrug.getD2packtypeother(),
				examDrug.getD2xiangfu(),examDrug.getD2packstate(),examDrug.getD2packstateother(),examDrug.getD2samplesum(),
				examDrug.getD2examdexplan(),examDrug.getD2remarks(),examDrug.getD2exameddwsign()
		
		};
		qr.update(sql,params);
	}
}
