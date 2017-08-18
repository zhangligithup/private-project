package cn.tslanpu.test.exam.drug.service;

import java.sql.SQLException;

import cn.tslanpu.test.add.drug.dao.DrugDao;
import cn.tslanpu.test.exam.drug.dao.ExamDrugDao;
import cn.tslanpu.test.exam.drug.domain.ExamDrug;

public class ExamDrugService
{
	private ExamDrugDao examDrugDao = new ExamDrugDao();
	public void add(ExamDrug examDrug) throws SQLException{
		examDrugDao.add(examDrug);
	}
}
