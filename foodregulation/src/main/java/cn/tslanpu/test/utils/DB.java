package cn.tslanpu.test.utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DB
{
  private static String driver = null;
  private static String url = null;
  private static String userName = null;
  private static String password = null;

  public static Connection getConnection() {
    if ((driver == null) || (url == null) || (userName == null) || (password == null)) {
      synchronized (DB.class) {
        if ((driver == null) || (url == null) || (userName == null) || (password == null)) {
          InputStream in = DB.class.getResourceAsStream("/jdbc.properties");
          Properties props = new Properties();
          try
          {
            props.load(in);

            driver = props.getProperty("jdbc.driver");
            url = props.getProperty("jdbc.url");
            userName = props.getProperty("jdbc.username");
            password = props.getProperty("jdbc.password");
          } catch (IOException e) {
            e.printStackTrace();
          }
        }
      }
    }

    Connection conn = null;
    try {
      Class.forName(driver);
      conn = DriverManager.getConnection(url, userName, password);
    }
    catch (ClassNotFoundException e)
    {
      e.printStackTrace();
    }
    catch (SQLException e) {
      e.printStackTrace();
    }

    return conn;
  }

  public static PreparedStatement createPST(Connection conn, String sql) {
    PreparedStatement PST = null;
    try {
      PST = conn.prepareStatement(sql);
    }
    catch (SQLException e) {
      e.printStackTrace();
    }
    return PST;
  }

  public static ResultSet getRs(PreparedStatement PST) {
    ResultSet rs = null;
    try {
      rs = PST.executeQuery();
    }
    catch (SQLException e) {
      e.printStackTrace();
    }
    return rs;
  }

  public static void close(Connection conn, PreparedStatement pst, ResultSet rs) {
    closeRS(rs);
    closePST(pst);
    closeConn(conn);
  }

  public static void closeConn(Connection conn) {
    try {
      if ((conn != null) && (!conn.isClosed()))
        try {
          conn.close();
        }
        catch (SQLException e) {
          e.printStackTrace();
        }
    }
    catch (SQLException e)
    {
      e.printStackTrace();
    }
  }

  public static void closePST(PreparedStatement pst) {
    try {
      if ((pst != null) && (!pst.isClosed()))
        try {
          pst.close();
        }
        catch (SQLException e) {
          e.printStackTrace();
        }
    }
    catch (SQLException e)
    {
      e.printStackTrace();
    }
  }

  public static void closeRS(ResultSet rs) {
    try {
      if ((rs != null) && (!rs.isClosed()))
        try {
          rs.close();
        }
        catch (SQLException e) {
          e.printStackTrace();
        }
    }
    catch (SQLException e)
    {
      e.printStackTrace();
    }
  }
}