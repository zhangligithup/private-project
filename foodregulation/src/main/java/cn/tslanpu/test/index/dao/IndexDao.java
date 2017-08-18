package cn.tslanpu.test.index.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.jdbc.TxQueryRunner;
import cn.tslanpu.test.add.agricultural.domain.Agricultural;
import cn.tslanpu.test.complain.domain.Complain;

public class IndexDao {
	private QueryRunner qr = new TxQueryRunner();
	
	private Agricultural agricultural = new Agricultural();
	
	public List<Complain> queryUntreated(String department) throws SQLException{
		String sql = "select * from complain where department = '" + department + "' and result = '0'" ;
		return qr.query(sql, new BeanListHandler<Complain>(Complain.class));
	}
	
	public Map<String, Integer> getNumber() throws SQLException{
		Map<String, Integer> map = new HashMap<String, Integer>();
		IndexDao indexDao = new IndexDao();
		
		//各个
		int agricultural = indexDao.agriculturalNum();
		int cosmetic = indexDao.cosmeticNum();
		int criculate = indexDao.criculateNum();
		int drug = indexDao.drugNum();
		int food = indexDao.foodNum();
		int health = indexDao.healthNum();
		int industry = indexDao.industryNum();
		int medical = indexDao.medicalNum();
		int production = indexDao.productionNum();
		int usemed = indexDao.usemedNum();
		int wine = indexDao.wineNum();
		
		int sum = agricultural + cosmetic + criculate + drug + food + health + industry + medical + production + usemed + wine;
		
		//人员
		int user = indexDao.userNum();
		int gzUserNum = indexDao.gzUserNum();
		int zhiFaNum = user - gzUserNum;
		
		//
		int gongYe = indexDao.gongYeNum();
		int nanPu = indexDao.nanPuNum();
		int shengTai = indexDao.shengTaiNum();
		int tangHai = indexDao.tangHaiNum();
		int liuZan = indexDao.liuZanNum();
		int binHai = indexDao.binHaiNum();
		int one = indexDao.oneNum();
		int three = indexDao.threeNum();
		int four = indexDao.fourNum();
		int five = indexDao.fiveNum();
		int six = indexDao.sixNum();
		int seven = indexDao.sevenNum();
		int eight = indexDao.eightNum();
		int nine = indexDao.nineNum();
		int ten = indexDao.tenNum();
		int eleven = indexDao.elevenNum();
		int baLi = indexDao.baLiNum();
		int shiLi = indexDao.shiLiNum();
		
		map.put("agricultural", agricultural); 
		map.put("cosmetic", cosmetic);
		map.put("criculate", criculate);
		map.put("drug", drug);
		map.put("food", food);
		map.put("health", health);
		map.put("industry", industry);
		map.put("medical", medical);
		map.put("production", production);
		map.put("usemed", usemed);
		map.put("wine", wine);
		map.put("sum", sum);
		
		map.put("user", user);
		map.put("gzUserNum", gzUserNum);
		map.put("zhiFaNum", zhiFaNum);
		
		map.put("gongYe", gongYe);
		map.put("nanPu", nanPu);
		map.put("shengTai", shengTai);
		map.put("tangHai", tangHai);
		map.put("liuZan", liuZan);
		map.put("binHai", binHai);
		map.put("one", one);
		map.put("three", three);
		map.put("four", four);
		map.put("five", five);
		map.put("six", six);
		map.put("seven", seven);
		map.put("eight", eight);
		map.put("nine", nine);
		map.put("ten", ten);
		map.put("eleven", eleven);
		map.put("baLi", baLi);
		map.put("shiLi", shiLi);
		
		return map;
	}
	
	
	public int agriculturalNum() throws SQLException{
		String sql = "select count(*) from agricultural";
		Number agricultural = (Number) qr.query(sql, new ScalarHandler());
		return agricultural.intValue();
	}
	
	/*public List<Integer> agriculturalNumList() throws SQLException{
		
		String sql = "select * from criculate";
		List<Agricultural> list = qr.query(sql, new BeanListHandler<Agricultural>(Agricultural.class) );
		
		
	}*/
	
	/*public List<Integer> count(List<Object> list){
		List<Integer> listInteger = new LinkedList<Integer>();
		int gongYe = 0;
		int nanPu = 0;
		int shengTai = 0;
		int tangHai = 0;
		int liuZan = 0;
		int binHai = 0;
		int one = 0;
		int three = 0;
		int four = 0;
		int five = 0;
		int six = 0;
		int seven = 0;
		int eight = 0;
		int nine = 0;
		int ten = 0;
		int eleven = 0;
		int baLi = 0;
		int shiLi = 0;
		for(Object lis : list){
			if(lis.getAddress().equals("工业区")){
				gongYe += 1;
			}else if(lis.getAddress().equals("南堡开发区")){
				nanPu += 1;
			}else if(lis.getAddress().equals("生态城")){
				shengTai += 1;
			}else if(lis.getAddress().equals("唐海镇")){
				tangHai += 1;
			}else if(lis.getAddress().equals("柳赞镇")){
				liuZan += 1;
			}else if(lis.getAddress().equals("滨海镇")){
				binHai += 1;
			}else if(lis.getAddress().equals("一农场")){
				one += 1;
			}else if(lis.getAddress().equals("三农场")){
				three += 1;
			}else if(lis.getAddress().equals("四农场")){
				four += 1;
			}else if(lis.getAddress().equals("五农场")){
				five += 1;
			}else if(lis.getAddress().equals("六农场")){
				six += 1;
			}else if(lis.getAddress().equals("七农场")){
				seven += 1;
			}else if(lis.getAddress().equals("八农场")){
				eight += 1;
			}else if(lis.getAddress().equals("九农场")){
				nine += 1;
			}else if(lis.getAddress().equals("十农场")){
				ten += 1;
			}else if(lis.getAddress().equals("十一农场")){
				eleven += 1;
			}else if(lis.getAddress().equals("八里滩十里海")){
				baLi += 1;
			}else if(lis.getAddress().equals("十里海")){
				shiLi += 1;
			}
		}
		
		listInteger.add(gongYe);
		listInteger.add(nanPu);
		listInteger.add(shengTai);
		listInteger.add(tangHai);
		listInteger.add(liuZan);
		listInteger.add(binHai);
		listInteger.add(one);
		listInteger.add(three);
		listInteger.add(four);
		listInteger.add(five);
		listInteger.add(six);
		listInteger.add(seven);
		listInteger.add(eight);
		listInteger.add(nine);
		listInteger.add(ten);
		listInteger.add(eleven);
		listInteger.add(baLi);
		listInteger.add(shiLi);
		listInteger.add(list.size());
		
		return listInteger;
	}*/
	
	public int cosmeticNum() throws SQLException{
		String sql = "select count(*) from cosmetic";
		Number cosmetic = (Number) qr.query(sql, new ScalarHandler());
		return cosmetic.intValue();
	}
	
	public int criculateNum() throws SQLException{
		String sql = "select count(*) from criculate";
		Number criculate = (Number) qr.query(sql, new ScalarHandler());
		return criculate.intValue();
	}
	
	public int drugNum() throws SQLException{
		String sql = "select count(*) from drug";
		Number drug = (Number) qr.query(sql, new ScalarHandler());
		return drug.intValue();
	}
	
	public int foodNum() throws SQLException{
		String sql = "select count(*) from food";
		Number food = (Number) qr.query(sql, new ScalarHandler());
		return food.intValue();
	}
	
	public int healthNum() throws SQLException{
		String sql = "select count(*) from health";
		Number health = (Number) qr.query(sql, new ScalarHandler());
		return health.intValue();
	}
	
	public int industryNum() throws SQLException{
		String sql = "select count(*) from industry";
		Number industry = (Number) qr.query(sql, new ScalarHandler());
		return industry.intValue();
	}
	
	public int medicalNum() throws SQLException{
		String sql = "select count(*) from medical";
		Number medical = (Number) qr.query(sql, new ScalarHandler());
		return medical.intValue();
	}
	
	public int productionNum() throws SQLException{
		String sql = "select count(*) from production";
		Number production = (Number) qr.query(sql, new ScalarHandler());
		return production.intValue();
	}
	
	public int usemedNum() throws SQLException{
		String sql = "select count(*) from usemed";
		Number usemed = (Number) qr.query(sql, new ScalarHandler());
		return usemed.intValue();
	}
	
	public int wineNum() throws SQLException{
		String sql = "select count(*) from wine";
		Number wine = (Number) qr.query(sql, new ScalarHandler());
		return wine.intValue();
	}
	
	public int userNum() throws SQLException{
		String sql = "select count(*) from user";
		Number user = (Number) qr.query(sql, new ScalarHandler());
		return user.intValue();
	}
	
	public int gzUserNum() throws SQLException{
		String sql = "SELECT COUNT(*) FROM user WHERE ISNULL(zhiFaNumber)";
		Number gzUser = (Number) qr.query(sql, new ScalarHandler());
		return gzUser.intValue();
	}
	
	public int gongYeNum() throws SQLException{
		String sql = "SELECT SUM(C) FROM ( SELECT COUNT(*) C FROM agricultural WHERE address = '工业区' UNION ALL SELECT COUNT(*) C FROM cosmetic WHERE address = '工业区'"+ 
					 "UNION SELECT COUNT(*) C FROM criculate WHERE address = '工业区' UNION SELECT COUNT(*) C FROM drug WHERE address = '工业区' "+ 
					 "UNION SELECT COUNT(*) C FROM food WHERE address = '工业区' UNION SELECT COUNT(*) C FROM health WHERE address = '工业区'"+ 
					 "UNION SELECT COUNT(*) C FROM industry WHERE address = '工业区' UNION SELECT COUNT(*) C FROM medical WHERE address = '工业区'"+ 
					 "UNION SELECT COUNT(*) C FROM production WHERE address = '工业区' UNION SELECT COUNT(*) C FROM usemed WHERE address = '工业区'"+ 
					 "UNION SELECT COUNT(*) C FROM wine WHERE address = '工业区') a";
		Number gongYe = (Number) qr.query(sql, new ScalarHandler());
		return gongYe.intValue();
	}
	
	public int nanPuNum() throws SQLException{
		String sql = "SELECT SUM(C) FROM ( SELECT COUNT(*) C FROM agricultural WHERE address = '南堡开发区' UNION ALL SELECT COUNT(*) C FROM cosmetic WHERE address = '南堡开发区'"+ 
					 "UNION SELECT COUNT(*) C FROM criculate WHERE address = '南堡开发区' UNION SELECT COUNT(*) C FROM drug WHERE address = '南堡开发区' "+ 
					 "UNION SELECT COUNT(*) C FROM food WHERE address = '南堡开发区' UNION SELECT COUNT(*) C FROM health WHERE address = '南堡开发区'"+ 
					 "UNION SELECT COUNT(*) C FROM industry WHERE address = '南堡开发区' UNION SELECT COUNT(*) C FROM medical WHERE address = '南堡开发区'"+ 
					 "UNION SELECT COUNT(*) C FROM production WHERE address = '南堡开发区' UNION SELECT COUNT(*) C FROM usemed WHERE address = '南堡开发区'"+ 
					 "UNION SELECT COUNT(*) C FROM wine WHERE address = '南堡开发区') a";
		Number gongYe = (Number) qr.query(sql, new ScalarHandler());
		return gongYe.intValue();
	} 
	
	public int shengTaiNum() throws SQLException{
		String sql = "SELECT SUM(C) FROM ( SELECT COUNT(*) C FROM agricultural WHERE address = '生态城' UNION ALL SELECT COUNT(*) C FROM cosmetic WHERE address = '生态城'"+ 
					 "UNION SELECT COUNT(*) C FROM criculate WHERE address = '生态城' UNION SELECT COUNT(*) C FROM drug WHERE address = '生态城' "+ 
					 "UNION SELECT COUNT(*) C FROM food WHERE address = '生态城' UNION SELECT COUNT(*) C FROM health WHERE address = '生态城'"+ 
					 "UNION SELECT COUNT(*) C FROM industry WHERE address = '生态城' UNION SELECT COUNT(*) C FROM medical WHERE address = '生态城'"+ 
					 "UNION SELECT COUNT(*) C FROM production WHERE address = '生态城' UNION SELECT COUNT(*) C FROM usemed WHERE address = '生态城'"+ 
					 "UNION SELECT COUNT(*) C FROM wine WHERE address = '生态城') a";
		Number gongYe = (Number) qr.query(sql, new ScalarHandler());
		return gongYe.intValue();
	} 
	
	public int tangHaiNum() throws SQLException{
		String sql = "SELECT SUM(C) FROM ( SELECT COUNT(*) C FROM agricultural WHERE address = '唐海镇' UNION ALL SELECT COUNT(*) C FROM cosmetic WHERE address = '唐海镇'"+ 
					 "UNION SELECT COUNT(*) C FROM criculate WHERE address = '唐海镇' UNION SELECT COUNT(*) C FROM drug WHERE address = '唐海镇' "+ 
					 "UNION SELECT COUNT(*) C FROM food WHERE address = '唐海镇' UNION SELECT COUNT(*) C FROM health WHERE address = '唐海镇'"+ 
					 "UNION SELECT COUNT(*) C FROM industry WHERE address = '唐海镇' UNION SELECT COUNT(*) C FROM medical WHERE address = '唐海镇'"+ 
					 "UNION SELECT COUNT(*) C FROM production WHERE address = '唐海镇' UNION SELECT COUNT(*) C FROM usemed WHERE address = '唐海镇'"+ 
					 "UNION SELECT COUNT(*) C FROM wine WHERE address = '唐海镇') a";
		Number gongYe = (Number) qr.query(sql, new ScalarHandler());
		return gongYe.intValue();
	} 
	
	public int liuZanNum() throws SQLException{
		String sql = "SELECT SUM(C) FROM ( SELECT COUNT(*) C FROM agricultural WHERE address = '柳赞镇' UNION ALL SELECT COUNT(*) C FROM cosmetic WHERE address = '柳赞镇'"+ 
					 "UNION SELECT COUNT(*) C FROM criculate WHERE address = '柳赞镇' UNION SELECT COUNT(*) C FROM drug WHERE address = '柳赞镇' "+ 
					 "UNION SELECT COUNT(*) C FROM food WHERE address = '柳赞镇' UNION SELECT COUNT(*) C FROM health WHERE address = '柳赞镇'"+ 
					 "UNION SELECT COUNT(*) C FROM industry WHERE address = '柳赞镇' UNION SELECT COUNT(*) C FROM medical WHERE address = '柳赞镇'"+ 
					 "UNION SELECT COUNT(*) C FROM production WHERE address = '柳赞镇' UNION SELECT COUNT(*) C FROM usemed WHERE address = '柳赞镇'"+ 
					 "UNION SELECT COUNT(*) C FROM wine WHERE address = '柳赞镇') a";
		Number gongYe = (Number) qr.query(sql, new ScalarHandler());
		return gongYe.intValue();
	} 
	
	public int binHaiNum() throws SQLException{
		String sql = "SELECT SUM(C) FROM ( SELECT COUNT(*) C FROM agricultural WHERE address = '滨海镇' UNION ALL SELECT COUNT(*) C FROM cosmetic WHERE address = '滨海镇'"+ 
					 "UNION SELECT COUNT(*) C FROM criculate WHERE address = '滨海镇' UNION SELECT COUNT(*) C FROM drug WHERE address = '滨海镇' "+ 
					 "UNION SELECT COUNT(*) C FROM food WHERE address = '滨海镇' UNION SELECT COUNT(*) C FROM health WHERE address = '滨海镇'"+ 
					 "UNION SELECT COUNT(*) C FROM industry WHERE address = '滨海镇' UNION SELECT COUNT(*) C FROM medical WHERE address = '滨海镇'"+ 
					 "UNION SELECT COUNT(*) C FROM production WHERE address = '滨海镇' UNION SELECT COUNT(*) C FROM usemed WHERE address = '滨海镇'"+ 
					 "UNION SELECT COUNT(*) C FROM wine WHERE address = '滨海镇') a";
		Number gongYe = (Number) qr.query(sql, new ScalarHandler());
		return gongYe.intValue();
	} 
	
	public int oneNum() throws SQLException{
		String sql = "SELECT SUM(C) FROM ( SELECT COUNT(*) C FROM agricultural WHERE address = '一农场' UNION ALL SELECT COUNT(*) C FROM cosmetic WHERE address = '一农场'"+ 
					 "UNION SELECT COUNT(*) C FROM criculate WHERE address = '一农场' UNION SELECT COUNT(*) C FROM drug WHERE address = '一农场' "+ 
					 "UNION SELECT COUNT(*) C FROM food WHERE address = '一农场' UNION SELECT COUNT(*) C FROM health WHERE address = '一农场'"+ 
					 "UNION SELECT COUNT(*) C FROM industry WHERE address = '一农场' UNION SELECT COUNT(*) C FROM medical WHERE address = '一农场'"+ 
					 "UNION SELECT COUNT(*) C FROM production WHERE address = '一农场' UNION SELECT COUNT(*) C FROM usemed WHERE address = '一农场'"+ 
					 "UNION SELECT COUNT(*) C FROM wine WHERE address = '一农场') a";
		Number gongYe = (Number) qr.query(sql, new ScalarHandler());
		return gongYe.intValue();
	} 
	
	public int threeNum() throws SQLException{
		String sql = "SELECT SUM(C) FROM ( SELECT COUNT(*) C FROM agricultural WHERE address = '三农场' UNION ALL SELECT COUNT(*) C FROM cosmetic WHERE address = '三农场'"+ 
					 "UNION SELECT COUNT(*) C FROM criculate WHERE address = '三农场' UNION SELECT COUNT(*) C FROM drug WHERE address = '三农场' "+ 
					 "UNION SELECT COUNT(*) C FROM food WHERE address = '三农场' UNION SELECT COUNT(*) C FROM health WHERE address = '三农场'"+ 
					 "UNION SELECT COUNT(*) C FROM industry WHERE address = '三农场' UNION SELECT COUNT(*) C FROM medical WHERE address = '三农场'"+ 
					 "UNION SELECT COUNT(*) C FROM production WHERE address = '三农场' UNION SELECT COUNT(*) C FROM usemed WHERE address = '三农场'"+ 
					 "UNION SELECT COUNT(*) C FROM wine WHERE address = '三农场') a";
		Number gongYe = (Number) qr.query(sql, new ScalarHandler());
		return gongYe.intValue();
	} 
	
	public int fourNum() throws SQLException{
		String sql = "SELECT SUM(C) FROM ( SELECT COUNT(*) C FROM agricultural WHERE address = '四农场' UNION ALL SELECT COUNT(*) C FROM cosmetic WHERE address = '四农场'"+ 
					 "UNION SELECT COUNT(*) C FROM criculate WHERE address = '四农场' UNION SELECT COUNT(*) C FROM drug WHERE address = '四农场' "+ 
					 "UNION SELECT COUNT(*) C FROM food WHERE address = '四农场' UNION SELECT COUNT(*) C FROM health WHERE address = '四农场'"+ 
					 "UNION SELECT COUNT(*) C FROM industry WHERE address = '四农场' UNION SELECT COUNT(*) C FROM medical WHERE address = '四农场'"+ 
					 "UNION SELECT COUNT(*) C FROM production WHERE address = '四农场' UNION SELECT COUNT(*) C FROM usemed WHERE address = '四农场'"+ 
					 "UNION SELECT COUNT(*) C FROM wine WHERE address = '四农场') a";
		Number gongYe = (Number) qr.query(sql, new ScalarHandler());
		return gongYe.intValue();
	} 
	
	
	public int fiveNum() throws SQLException{
		String sql = "SELECT SUM(C) FROM ( SELECT COUNT(*) C FROM agricultural WHERE address = '五农场' UNION ALL SELECT COUNT(*) C FROM cosmetic WHERE address = '五农场'"+ 
					 "UNION SELECT COUNT(*) C FROM criculate WHERE address = '五农场' UNION SELECT COUNT(*) C FROM drug WHERE address = '五农场' "+ 
					 "UNION SELECT COUNT(*) C FROM food WHERE address = '五农场' UNION SELECT COUNT(*) C FROM health WHERE address = '五农场'"+ 
					 "UNION SELECT COUNT(*) C FROM industry WHERE address = '五农场' UNION SELECT COUNT(*) C FROM medical WHERE address = '五农场'"+ 
					 "UNION SELECT COUNT(*) C FROM production WHERE address = '五农场' UNION SELECT COUNT(*) C FROM usemed WHERE address = '五农场'"+ 
					 "UNION SELECT COUNT(*) C FROM wine WHERE address = '五农场') a";
		Number gongYe = (Number) qr.query(sql, new ScalarHandler());
		return gongYe.intValue();
	} 
	
	public int sixNum() throws SQLException{
		String sql = "SELECT SUM(C) FROM ( SELECT COUNT(*) C FROM agricultural WHERE address = '六农场' UNION ALL SELECT COUNT(*) C FROM cosmetic WHERE address = '六农场'"+ 
					 "UNION SELECT COUNT(*) C FROM criculate WHERE address = '六农场' UNION SELECT COUNT(*) C FROM drug WHERE address = '六农场' "+ 
					 "UNION SELECT COUNT(*) C FROM food WHERE address = '六农场' UNION SELECT COUNT(*) C FROM health WHERE address = '六农场'"+ 
					 "UNION SELECT COUNT(*) C FROM industry WHERE address = '六农场' UNION SELECT COUNT(*) C FROM medical WHERE address = '六农场'"+ 
					 "UNION SELECT COUNT(*) C FROM production WHERE address = '六农场' UNION SELECT COUNT(*) C FROM usemed WHERE address = '六农场'"+ 
					 "UNION SELECT COUNT(*) C FROM wine WHERE address = '六农场') a";
		Number gongYe = (Number) qr.query(sql, new ScalarHandler());
		return gongYe.intValue();
	} 
	
	public int sevenNum() throws SQLException{
		String sql = "SELECT SUM(C) FROM ( SELECT COUNT(*) C FROM agricultural WHERE address = '七农场' UNION ALL SELECT COUNT(*) C FROM cosmetic WHERE address = '七农场'"+ 
					 "UNION SELECT COUNT(*) C FROM criculate WHERE address = '七农场' UNION SELECT COUNT(*) C FROM drug WHERE address = '七农场' "+ 
					 "UNION SELECT COUNT(*) C FROM food WHERE address = '七农场' UNION SELECT COUNT(*) C FROM health WHERE address = '七农场'"+ 
					 "UNION SELECT COUNT(*) C FROM industry WHERE address = '七农场' UNION SELECT COUNT(*) C FROM medical WHERE address = '七农场'"+ 
					 "UNION SELECT COUNT(*) C FROM production WHERE address = '七农场' UNION SELECT COUNT(*) C FROM usemed WHERE address = '七农场'"+ 
					 "UNION SELECT COUNT(*) C FROM wine WHERE address = '七农场') a";
		Number gongYe = (Number) qr.query(sql, new ScalarHandler());
		return gongYe.intValue();
	} 
	
	public int eightNum() throws SQLException{
		String sql = "SELECT SUM(C) FROM ( SELECT COUNT(*) C FROM agricultural WHERE address = '八农场' UNION ALL SELECT COUNT(*) C FROM cosmetic WHERE address = '八农场'"+ 
					 "UNION SELECT COUNT(*) C FROM criculate WHERE address = '八农场' UNION SELECT COUNT(*) C FROM drug WHERE address = '八农场' "+ 
					 "UNION SELECT COUNT(*) C FROM food WHERE address = '八农场' UNION SELECT COUNT(*) C FROM health WHERE address = '八农场'"+ 
					 "UNION SELECT COUNT(*) C FROM industry WHERE address = '八农场' UNION SELECT COUNT(*) C FROM medical WHERE address = '八农场'"+ 
					 "UNION SELECT COUNT(*) C FROM production WHERE address = '八农场' UNION SELECT COUNT(*) C FROM usemed WHERE address = '八农场'"+ 
					 "UNION SELECT COUNT(*) C FROM wine WHERE address = '八农场') a";
		Number gongYe = (Number) qr.query(sql, new ScalarHandler());
		return gongYe.intValue();
	} 
	
	public int nineNum() throws SQLException{
		String sql = "SELECT SUM(C) FROM ( SELECT COUNT(*) C FROM agricultural WHERE address = '九农场' UNION ALL SELECT COUNT(*) C FROM cosmetic WHERE address = '九农场'"+ 
					 "UNION SELECT COUNT(*) C FROM criculate WHERE address = '九农场' UNION SELECT COUNT(*) C FROM drug WHERE address = '九农场' "+ 
					 "UNION SELECT COUNT(*) C FROM food WHERE address = '九农场' UNION SELECT COUNT(*) C FROM health WHERE address = '九农场'"+ 
					 "UNION SELECT COUNT(*) C FROM industry WHERE address = '九农场' UNION SELECT COUNT(*) C FROM medical WHERE address = '九农场'"+ 
					 "UNION SELECT COUNT(*) C FROM production WHERE address = '九农场' UNION SELECT COUNT(*) C FROM usemed WHERE address = '九农场'"+ 
					 "UNION SELECT COUNT(*) C FROM wine WHERE address = '九农场') a";
		Number gongYe = (Number) qr.query(sql, new ScalarHandler());
		return gongYe.intValue();
	} 
	
	public int tenNum() throws SQLException{
		String sql = "SELECT SUM(C) FROM ( SELECT COUNT(*) C FROM agricultural WHERE address = '十农场' UNION ALL SELECT COUNT(*) C FROM cosmetic WHERE address = '十农场'"+ 
					 "UNION SELECT COUNT(*) C FROM criculate WHERE address = '十农场' UNION SELECT COUNT(*) C FROM drug WHERE address = '十农场' "+ 
					 "UNION SELECT COUNT(*) C FROM food WHERE address = '十农场' UNION SELECT COUNT(*) C FROM health WHERE address = '十农场'"+ 
					 "UNION SELECT COUNT(*) C FROM industry WHERE address = '十农场' UNION SELECT COUNT(*) C FROM medical WHERE address = '十农场'"+ 
					 "UNION SELECT COUNT(*) C FROM production WHERE address = '十农场' UNION SELECT COUNT(*) C FROM usemed WHERE address = '十农场'"+ 
					 "UNION SELECT COUNT(*) C FROM wine WHERE address = '十农场') a";
		Number gongYe = (Number) qr.query(sql, new ScalarHandler());
		return gongYe.intValue();
	} 
	
	public int shiLiNum() throws SQLException{
		String sql = "SELECT SUM(C) FROM ( SELECT COUNT(*) C FROM agricultural WHERE address = '十一农场' UNION ALL SELECT COUNT(*) C FROM cosmetic WHERE address = '十一农场'"+ 
					 "UNION SELECT COUNT(*) C FROM criculate WHERE address = '十一农场' UNION SELECT COUNT(*) C FROM drug WHERE address = '十一农场' "+ 
					 "UNION SELECT COUNT(*) C FROM food WHERE address = '十一农场' UNION SELECT COUNT(*) C FROM health WHERE address = '十一农场'"+ 
					 "UNION SELECT COUNT(*) C FROM industry WHERE address = '十一农场' UNION SELECT COUNT(*) C FROM medical WHERE address = '十一农场'"+ 
					 "UNION SELECT COUNT(*) C FROM production WHERE address = '十一农场' UNION SELECT COUNT(*) C FROM usemed WHERE address = '十一农场'"+ 
					 "UNION SELECT COUNT(*) C FROM wine WHERE address = '十一农场') a";
		Number gongYe = (Number) qr.query(sql, new ScalarHandler());
		return gongYe.intValue();
	} 
	
	public int elevenNum() throws SQLException{
		String sql = "SELECT SUM(C) FROM ( SELECT COUNT(*) C FROM agricultural WHERE address = '八里滩' UNION ALL SELECT COUNT(*) C FROM cosmetic WHERE address = '八里滩'"+ 
					 "UNION SELECT COUNT(*) C FROM criculate WHERE address = '八里滩' UNION SELECT COUNT(*) C FROM drug WHERE address = '八里滩' "+ 
					 "UNION SELECT COUNT(*) C FROM food WHERE address = '八里滩' UNION SELECT COUNT(*) C FROM health WHERE address = '八里滩'"+ 
					 "UNION SELECT COUNT(*) C FROM industry WHERE address = '八里滩' UNION SELECT COUNT(*) C FROM medical WHERE address = '八里滩'"+ 
					 "UNION SELECT COUNT(*) C FROM production WHERE address = '八里滩' UNION SELECT COUNT(*) C FROM usemed WHERE address = '八里滩'"+ 
					 "UNION SELECT COUNT(*) C FROM wine WHERE address = '八里滩') a";
		Number gongYe = (Number) qr.query(sql, new ScalarHandler());
		return gongYe.intValue();
	} 
	
	public int baLiNum() throws SQLException{
		String sql = "SELECT SUM(C) FROM ( SELECT COUNT(*) C FROM agricultural WHERE address = '十里海' UNION ALL SELECT COUNT(*) C FROM cosmetic WHERE address = '十里海'"+ 
					 "UNION SELECT COUNT(*) C FROM criculate WHERE address = '十里海' UNION SELECT COUNT(*) C FROM drug WHERE address = '十里海' "+ 
					 "UNION SELECT COUNT(*) C FROM food WHERE address = '十里海' UNION SELECT COUNT(*) C FROM health WHERE address = '十里海'"+ 
					 "UNION SELECT COUNT(*) C FROM industry WHERE address = '十里海' UNION SELECT COUNT(*) C FROM medical WHERE address = '十里海'"+ 
					 "UNION SELECT COUNT(*) C FROM production WHERE address = '十里海' UNION SELECT COUNT(*) C FROM usemed WHERE address = '十里海'"+ 
					 "UNION SELECT COUNT(*) C FROM wine WHERE address = '十里海') a";
		Number gongYe = (Number) qr.query(sql, new ScalarHandler());
		return gongYe.intValue();
	} 
	
	public static void main(String[] args) throws SQLException {
		IndexDao indexDao = new IndexDao();
		
		Map<String, Integer> map = new HashMap<String, Integer>();
	}
}
