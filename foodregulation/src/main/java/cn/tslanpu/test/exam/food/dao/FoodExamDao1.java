package cn.tslanpu.test.exam.food.dao;


import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import cn.itcast.jdbc.TxQueryRunner;
import cn.tslanpu.test.exam.food.domain.FoodExam1;

public class FoodExamDao1
{

	private QueryRunner qr = new TxQueryRunner();
	public void add(FoodExam1 foodex1) throws SQLException{
		String sql="insert into examfood(no,examedfood,examdw,exampepl,examdate,examedqy,examtype,d2no,d2cydnum,"
				+ "d2missionsource,d2missiontype,d2bcydwname,d2areatype,d2dwadress,d2legaldelegate,d2yearsail,d2zzcode,"
				+ "d2contact,d2tele,d2fax,d2mailcode,d2production,d2cpk,d2circulation,d2cother,d2food,d2cgtype,d2sttype,"
				+ "d2foodother,d2samplesource,d2sampleattr,d2sampletype,d2samplename,d2examtime,d2samplelogo,d2sampledatetype,"
				+ "d2samplesize,d2sampleno,d2bzq,d2zxwj,d2qualitylv,d2scxkcode,d2price,d2export,d2examedtime,d2backupno,d2samplext,"
				+ "d2samplepacktyp,d2productor,d2productoraddr,d2productorcontact,d2procell,d2samplestorage,d2storagetem,d2deadline,d2sampledist,"
				+ "d2samplemethod,d2examdwname,d2examaddr,d2examcontactor,d2examtele,d2examfax,d2exammail,d2remarks,d2cyview,d2scview,"
				+ "d2sampledate,d2samplepack,d3no,d3examtime,d3examdwname,d3exampeplname,d3idcard,d3buysample,d3sealsample,d3storesample,d3fair,"
				+ "d3remark,d3examtele,d3examemail,d3examfax,d3dwname,d3dwdzybdz,d3dwtele,d3dwdz,d3tbtime,d3legalsign,d4bgzname,d4market,d4year,d4cydno,"
				+ "d4fptittle,d4project,d4taxsign,d4bankname,d4acount,d4samplename1,d4price1,d4num1,d4sumprice1,d4samplename2,d4price2,d4num2,d4sumprice2"
				+ ",d4samplename3,d4price3,d4num3,d4sumprice3,d4samplename4,d4price4,d4num4,d4sumprice4,d4samplename5,d4price5,d4num5,d4sumprice5,"
				+ "d4sumpricedx,d4sumpricexx,d4paydwname,d4payaddr,d4paycontactor,d4paytele,d4examedqyname,d4examaedbankname,d4examedbankacount,d4examedcontact,"
				+ "d4examedtele,d5examedw,d5ptpepld,d5examsite,d5legaldelegate,d5legalcontact,d5examer,d5noter,d5examtype,d5examtimestart,d5examtimeend,d5examdw,"
				+ "d5exampepl1,d5exampepl2,d5legalid,d5problem,d5examnote,d5huida,d6cydw,d6cypepl,d6examtime,d6sampleno,d6samplename,d6package,d6productserial,d6size,d6examedtype,"
				+ "d6productdw,d6exameddwname,d6exameddwdz,d7to,d7sytime,d7samplecount,d7sampleno,d7fentiao,d7samplepack,d7sampleamount,d7samplestate,d7ppworknum,"
				+ "d7ppworkok,d7result,d7reject,d7examdw,d7sampletrans,d7comfirmer,d9examdw,d9examedfood,d9size,d9exampepl,d9examedpepl,d9examsite,d9examtime,d9examedsign,d9examitem,"
				+ "d9standard,d9examresult,d9examvalue,d9examersign,d9examestua,d9remark,d8infored,d8examedqy,d8rule,d8limit,d8to,d8date,d8recivedate,d8reciversign,d8exam,d8inforno,d1examedpeplsign)"
	+"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,"
	+ "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,"
	+ "?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params={foodex1.getNo(),foodex1.getExamedfood(),foodex1.getExamdw(),foodex1.getExampepl(),foodex1.getExamdate(),
				foodex1.getExamedqy(),foodex1.getExamtype(),foodex1.getD2no(),foodex1.getD2cydnum(),foodex1.getD2missionsource(),foodex1.getD2missiontype(),
				foodex1.getD2bcydwname(),foodex1.getD2areatype(),foodex1.getD2dwadress(),foodex1.getD2legaldelegate(),foodex1.getD2yearsail(),foodex1.getD2zzcode(),
				foodex1.getD2contact(),foodex1.getD2tele(),foodex1.getD2fax(),foodex1.getD2mailcode(),foodex1.getD2production(),foodex1.getD2cpk(),foodex1.getD2circulation(),
				foodex1.getD2cother(),foodex1.getD2food(),foodex1.getD2cgtype(),foodex1.getD2sttype(),foodex1.getD2foodother(),foodex1.getD2samplesource(),foodex1.getD2sampleattr(),
				foodex1.getD2sampletype(),foodex1.getD2samplename(),foodex1.getD2examtime(),foodex1.getD2samplelogo(),foodex1.getD2sampledatetype(),foodex1.getD2samplesize(),foodex1.getD2sampleno(),
				foodex1.getD2bzq(),foodex1.getD2zxwj(),foodex1.getD2qualitylv(),foodex1.getD2scxkcode(),foodex1.getD2price(),foodex1.getD2export(),foodex1.getD2examedtime(),foodex1.getD2backupno(),foodex1.getD2samplext(),
				foodex1.getD2samplepacktyp(),foodex1.getD2productor(),foodex1.getD2productoraddr(),foodex1.getD2productorcontact(),foodex1.getD2procell(),foodex1.getD2samplestorage(),
				foodex1.getD2storagetem(),foodex1.getD2deadline(),foodex1.getD2sampledist(),foodex1.getD2samplemethod(),foodex1.getD2examdwname(),foodex1.getD2examaddr(),foodex1.getD2examcontactor(),foodex1.getD2examtele(),
				foodex1.getD2examfax(),foodex1.getD2exammail(),foodex1.getD2remarks(),foodex1.getD2cyview(),foodex1.getD2scview(),foodex1.getD2sampledate(),foodex1.getD2samplepack(),foodex1.getD3no(),foodex1.getD3examtime(),foodex1.getD3examdwname(),
				foodex1.getD3exampeplname(),foodex1.getD3idcard(),foodex1.getD3buysample(),foodex1.getD3sealsample(),foodex1.getD3storesample(),foodex1.getD3fair(),foodex1.getD3remark(),foodex1.getD3examtele(),foodex1.getD3examemail(),
				foodex1.getD3examfax(),foodex1.getD3dwname(),foodex1.getD3dwdzybdz(),foodex1.getD3dwtele(),foodex1.getD3dwdz(),foodex1.getD3tbtime(),foodex1.getD3legalsign(),foodex1.getD4bgzname(),foodex1.getD4market(),foodex1.getD4year(),
				foodex1.getD4cydno(),foodex1.getD4fptittle(),foodex1.getD4project(),foodex1.getD4taxsign(),foodex1.getD4bankname(),foodex1.getD4acount(),foodex1.getD4samplename1(),foodex1.getD4price1(),foodex1.getD4num1(),foodex1.getD4sumprice1(),
				foodex1.getD4samplename2(),foodex1.getD4price2(),foodex1.getD4num2(),foodex1.getD4sumprice2(),foodex1.getD4samplename3(),foodex1.getD4price3(),foodex1.getD4num3(),foodex1.getD4sumprice3(),foodex1.getD4samplename4(),foodex1.getD4price4(),foodex1.getD4num4(),
				foodex1.getD4sumprice4(),foodex1.getD4samplename5(),foodex1.getD4price5(),foodex1.getD4num5(),foodex1.getD4sumprice5(),foodex1.getD4sumpricedx(),foodex1.getD4sumpricexx(),foodex1.getD4paydwname(),foodex1.getD4payaddr(),foodex1.getD4paycontactor(),
				foodex1.getD4paytele(),foodex1.getD4examedqyname(),foodex1.getD4examaedbankname(),foodex1.getD4examedbankacount(),foodex1.getD4examedcontact(),foodex1.getD4examedtele(),foodex1.getD5examedw(),foodex1.getD5ptpepld(),foodex1.getD5examsite(),foodex1.getD5legaldelegate(),
				foodex1.getD5legalcontact(),foodex1.getD5examer(),foodex1.getD5noter(),foodex1.getD5examtype(),foodex1.getD5examtimestart(),foodex1.getD5examtimeend(),foodex1.getD5examdw(),foodex1.getD5exampepl1(),foodex1.getD5exampepl2(),foodex1.getD5legalid(),foodex1.getD5problem(),
				foodex1.getD5examnote(),foodex1.getD5huida(),foodex1.getD6cydw(),foodex1.getD6cypepl(),foodex1.getD6examtime(),foodex1.getD6sampleno(),foodex1.getD6samplename(),foodex1.getD6package(),foodex1.getD6productserial(),
				foodex1.getD6size(),foodex1.getD6examedtype(),foodex1.getD6productdw(),foodex1.getD6exameddwname(),foodex1.getD6exameddwdz(),foodex1.getD7to(),foodex1.getD7sytime(),foodex1.getD7samplecount(),foodex1.getD7sampleno(),foodex1.getD7fentiao(),foodex1.getD7samplepack(),
				foodex1.getD7sampleamount(),foodex1.getD7samplestate(),foodex1.getD7ppworknum(),foodex1.getD7ppworkok(),foodex1.getD7result(),foodex1.getD7reject(),foodex1.getD7examdw(),foodex1.getD7sampletrans(),foodex1.getD7comfirmer(),foodex1.getD9examdw(),foodex1.getD9examedfood(),
				foodex1.getD9size(),foodex1.getD9exampepl(),foodex1.getD9examedpepl(),foodex1.getD9examsite(),foodex1.getD9examtime(),foodex1.getD9examedsign(),foodex1.getD9examitem(),foodex1.getD9standard(),foodex1.getD9examresult(),foodex1.getD9examvalue(),foodex1.getD9examersign(),
				foodex1.getD9examestua(),foodex1.getD9remark(),foodex1.getD8infored(),foodex1.getD8examedqy(),foodex1.getD8rule(),foodex1.getD8limit(),foodex1.getD8to(),foodex1.getD8date(),foodex1.getD8recivedate(),foodex1.getD8reciversign(),foodex1.getD8exam(),foodex1.getD8inforno(),
				foodex1.getD1examedpeplsign()};
		qr.update(sql,params);
	}

}
