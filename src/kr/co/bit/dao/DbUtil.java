package kr.co.bit.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbUtil {
	public final static String  DRIVER_NAME = "oracle.jdbc.driver.OracleDriver";
	public final static String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public final static String USER = "bit";
	public final static String PASSWORD = "bit";
	
	public static Connection getConnect() {
		Connection conn = null;
		
		try {
			// 3. 드라이버 로딩
			Class.forName(DbUtil.DRIVER_NAME);
			// 4. 접속
			conn = DriverManager.getConnection(DbUtil.URL, DbUtil.USER, DbUtil.PASSWORD);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}

}
