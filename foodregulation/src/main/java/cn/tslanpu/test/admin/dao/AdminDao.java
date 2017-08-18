package cn.tslanpu.test.admin.dao;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.foodregulation.util.StringUtils;

import cn.itcast.jdbc.TxQueryRunner;
import cn.tslanpu.test.admin.domain.Admin;
import cn.tslanpu.test.pager.Expression;
import cn.tslanpu.test.pager.PageBean;

public class AdminDao {

    private QueryRunner qr = new TxQueryRunner();


    // 判断用户是否存在
    public Admin query(String username, String password) throws SQLException {
        String sql = "select a.username,a.password,a.is_super as isSuper,a.menu_ids as menuIds,b.person_name as name,b.person_id as id,d.t_dictionary_type as accountType,d.t_dictionary_code as unitCode from user a,t_person_info b LEFT JOIN t_dictionary d ON b.person_company_id=d.id where a.username=? ";
        if(StringUtils.isNotBlank(password)){	   
        	sql+= "and a.password=? ";
        }
        	   sql+="and a.username = b.user_name";
        if(StringUtils.isNotBlank(password)){	
        	return qr.query(sql, new BeanHandler<Admin>(Admin.class), username, password);
        }else{
        	return qr.query(sql, new BeanHandler<Admin>(Admin.class), username);
        }
    }


    // 判断用户名是否存在
    public int exists(String username) throws SQLException {
        String sql = "select count(*) from user where username=?";
        Number number = (Number) qr.query(sql, new ScalarHandler(), username);
        return number.intValue();
    }


    // 根据Id查询当前工作人员信息
    public Admin queryInfor(int id) throws SQLException {
        String sql = "select * from user where id=?";
        return qr.query(sql, new BeanHandler<Admin>(Admin.class), id);
    }


    // 根据Id删除当前工作人员
    public void delete(int id) throws SQLException {
        String sql = "delete from user where id=?";
        qr.update(sql, id);
    }


    // 初次登陆更新当前用户密码
    public void updatePassword(String username, String password) throws SQLException {
        String sql = "update user set password=? where username=?";
        qr.update(sql, password, username);
    }


    // 初始化当前用户密码
    public void initialize(int id) throws SQLException {
        String sql = "update user set password=? where id=?";
        qr.update(sql, "666666", id);
    }


    // 查询所有工作人员
    public PageBean<Admin> queryAll(int pageCode) throws SQLException {
        List<Expression> experList = new ArrayList<Expression>();
        return findByAdmin(experList, pageCode);
    }


    // 查询部门的所有工作人员
    public PageBean<Admin> queryDep(String department, int pageCode) throws SQLException {
        List<Expression> experList = new ArrayList<Expression>();
        experList.add(new Expression("department", "=", department));
        return findByAdmin(experList, pageCode);
    }


    // 根据名称进行模糊查询
    public PageBean<Admin> queryByName(String name, int pageCode) throws SQLException {
        List<Expression> experList = new ArrayList<Expression>();
        experList.add(new Expression("name", "like", "%" + name + "%"));
        return findByAdmin(experList, pageCode);
    }


    // 联合模糊查询
    public PageBean<Admin> query(String name, String department, int pageCode) throws SQLException {
        List<Expression> experList = new ArrayList<Expression>();
        experList.add(new Expression("name", "like", "%" + name + "%"));
        experList.add(new Expression("department", "like", "%" + department + "%"));
        return findByAdmin(experList, pageCode);
    }


    // 通用查询方法
    private PageBean<Admin> findByAdmin(List<Expression> exprList, int pageCode) throws SQLException {
        /*
         * 1.得到pageSize 2.得到totalRecord 3.得到beanList 4.创建pageBean返回
         */
        PageBean<Admin> pb1 = new PageBean<Admin>();
        int pageSize = pb1.getPageSize();
        /*
         * 通过ecprList生产where子句
         */
        StringBuilder whereSql = new StringBuilder(" where 1=1 ");
        List<Object> params = new ArrayList<Object>();
        for (Expression expr : exprList) {
            whereSql.append(" and ").append(expr.getName()).append(" ").append(expr.getOperator()).append(" ");
            if (!expr.getOperator().equals("is null")) {
                whereSql.append("?");
                params.add(expr.getValue());
            }
        }

        // 总记录数
        String sql = "select count(*) from user" + whereSql;
        Number number = (Number) qr.query(sql, new ScalarHandler(), params.toArray());
        int totalRecord = number.intValue();

        // 当前页的记录
        sql = "select * from user" + whereSql + " order by id limit ?,?";
        params.add((pageCode - 1) * pageSize);
        params.add(pageSize);
        List<Admin> datas = qr.query(sql, new BeanListHandler<Admin>(Admin.class), params.toArray());

        PageBean<Admin> pb = new PageBean<Admin>();
        pb.setDatas(datas);
        pb.setPageCode(pageCode);
        pb.setPageSize(pageSize);
        pb.setTotalRecord(totalRecord);
        return pb;
    }


}
