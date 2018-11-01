package cn.tslanpu.test.add.drug.service;

import java.sql.SQLException;
import java.util.List;

import cn.tslanpu.test.add.drug.dao.DrugDao;
import cn.tslanpu.test.add.drug.domain.Drug;
import cn.tslanpu.test.add.drug.domain.Drug_jdjc;
import cn.tslanpu.test.pager.PageBean;

public class DrugService {

	private DrugDao drugDao = new DrugDao();
	public Drug findbyQY(String qyname){
		try{
		return drugDao.findbyQY(qyname);
		}
		catch(SQLException e){
			throw new RuntimeException();
		}
	}
	public List qyData(){
		try
		{
			return drugDao.findQY();
		} catch (SQLException e)
		{
			throw new RuntimeException();
		}
	}

	public void add(Drug drug) throws SQLException {
		drugDao.add(drug);
	}

	

	public  Drug drugFind(int id) {
		try {
			return  drugDao.drugFind(id);
		} catch (Exception e) {
			throw new  RuntimeException(e);
		}
	}

	//execl 表
	public List<Drug> queryAll(String qyname, String address, String department, 
			String fddelegate, String zzcode){
		try {
			return drugDao.queryAll(qyname, address, department, fddelegate, zzcode);
		} catch (SQLException e) {
			throw new  RuntimeException(e);
		}
	}

	public PageBean<Drug> queryZ(String trim, String address,
			String department, String fddelegate, String zzcode, int pageCode) {
		try {
			return  drugDao.queryZ( trim,  address,
					 department,fddelegate,zzcode,  pageCode);
		} catch (Exception e) {
			throw new  RuntimeException(e);
		}
	}



	public void Update(Drug drug) {
		try {
			drugDao.update(drug);
		} catch (Exception e) {
			throw new  RuntimeException(e);
		}
	}



	public void delete(int parseInt) {
		try {
			drugDao.delete(parseInt);
		} catch (Exception e) {
			System.out.println(e);
			throw new  RuntimeException(e);
		}
	}
	
	//查询公司企业监督检查详细信息
	public Drug_jdjc getjdjcData(int id){
			try {
				return drugDao.getjdjcData(id);
			} catch (SQLException e) {
				throw new RuntimeException();
			}
		}

	public void add_jdjc(Drug_jdjc drug_jdjc) {
		try {
			drugDao.add_jdjc(drug_jdjc);
		} catch (SQLException e) {
		    throw new RuntimeException(e);
		}
}
	public Drug byqynameFull(String qyname) {
		try {
			return drugDao.byqynameFull(qyname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//转发企业名称
		public List dispNameData() {
			try {
				return drugDao.dispNameData();
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}

}
