package cn.tslanpu.test.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DB {
	
	public static void main(String[] args) {
		System.out.println(DB.getConnection());
	}
	
	public static Connection getConnection(){
		Connection conn = null;
		String driver = "com.mysql.jdbc.Driver";
	    String url = "jdbc:mysql://localhost:3306/jianguan?user=root&password=1908366654&characterEncoding=UTF-8&mysqlEncoding=UTF-8";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public static PreparedStatement createPST(Connection conn, String sql) {
		PreparedStatement PST = null;
		try {
			PST = conn.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return PST;
	}
	
	public static ResultSet getRs(PreparedStatement PST) {
		ResultSet rs = null;
		try {
			rs = PST.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	
	public static void closeConn(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void closePST(PreparedStatement PST) {
		if (PST != null) {
			try {
				PST.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void closeRS(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
