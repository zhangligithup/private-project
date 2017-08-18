package cn.tslanpu.test.exam.food.service;

import java.sql.SQLException;

import cn.tslanpu.test.exam.food.dao.FoodExamDao1;
import cn.tslanpu.test.exam.food.domain.FoodExam1;

public class FoodExamService
{
	private FoodExamDao1 foodExDao1= new FoodExamDao1();
	public void add(FoodExam1 foodex1) throws SQLException{
	
			foodExDao1.add(foodex1);
		
	}
}
