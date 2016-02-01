package kr.co.bit.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {

	// 모든 수정 후에는 반드시 test할 것.
	// 1. db 접속(method overloading)
	//   note: static, overloading
	public static Connection getConnection() throws Exception {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";	
		String user = "bit";
		String password = "bit";
		Connection conn = getConnection(url, user, password);
		return conn;
	}
	
	public static Connection getConnection(String url, String user, String password) throws Exception  {
		// 0. 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 1. DB 접속 (Connection 객체를 얻어온다.)
		Connection conn = DriverManager.getConnection(url, user, password);
		return conn;
	}
	
	// 2. db 접속한 자원을 닫아주는 method
	public static void close(Connection conn, PreparedStatement ps) {
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}				
		}		
	}
	
	public static void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		close(conn, ps);
	}
	
}
