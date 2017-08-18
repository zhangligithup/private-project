package mybatis;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JdbcExample {

	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			//注册mysql驱动
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/mybatis?characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull";
			String user = "root";
			String password = "root";
			
			//获取连接
		    conn = DriverManager.getConnection(url, user, password);
		    
		    //定义sql语句
			String sql = "select * from user where user_name=?";
			
			//
			ps = conn.prepareStatement(sql);
			ps.setString(1, "name1");
			rs = ps.executeQuery();
			while(rs.next()){
				System.out.println(rs.getString(1));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
		}
	}
}
                                                                                                                                                                 