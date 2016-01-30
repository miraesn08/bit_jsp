package exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import kr.co.bit.dao.DbUtil;

public class MemberTable {
	private final static String TABLE_NAME = "member";

	public static boolean Insert(String id, String name, String password, String phone, String email) throws Exception {
		// check data
		// 0.load Driver
		Class.forName(DbUtil.DRIVER_NAME);
		// 1.connection
		Connection conn = DriverManager.getConnection(DbUtil.URL, DbUtil.USER, DbUtil.PASSWORD);
		// 2.query
		String sql = "insert into " + MemberTable.TABLE_NAME + "(id,name,password,phone,email,reg_date) values (?,?,?,?,?,sysdate)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, name);
		ps.setString(3, password);
		ps.setString(4, phone);
		ps.setString(5, email);
		// 3.execute
		int count = ps.executeUpdate();
		// 4.close
		ps.close();
		conn.close();
		// 5.result
		return (count == 1);
	}

	public static boolean Update(String id, String name, String password, String phone, String email) throws Exception {
		// check data
		// 0.load Driver
		Class.forName(DbUtil.DRIVER_NAME);
		// 1.connection
		Connection conn = DriverManager.getConnection(DbUtil.URL, DbUtil.USER, DbUtil.PASSWORD);
		// 2.query
		String sql = "update " + MemberTable.TABLE_NAME + " set name=?, password=?, phone=?, email=? where id = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, password);
		ps.setString(3, phone);
		ps.setString(4, email);
		ps.setString(5, id);
		// 3.execute
		int count = ps.executeUpdate();
		// 4.close
		ps.close();
		conn.close();
		// 5.result
		return (count > 0);
	}

    public static boolean Delete(String id) throws Exception {
		// check data
		// 0.load Driver
		Class.forName(DbUtil.DRIVER_NAME);
		// 1.connection
		Connection conn = DriverManager.getConnection(DbUtil.URL, DbUtil.USER, DbUtil.PASSWORD);
		// 2.query
		String sql = "delete from " + MemberTable.TABLE_NAME + " where id = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		// 3.execute
		int count = ps.executeUpdate();
		// 4.close
		ps.close();
		conn.close();
		// 5.result
		return (count > 0);
	}

}
