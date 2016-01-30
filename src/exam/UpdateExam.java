package exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UpdateExam {

	public static void main(String[] args) throws Exception {
		// 0. load Driver
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 1. connection
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "bit";
		String password = "bit";
		Connection conn = DriverManager.getConnection(url, user, password);
		// 2. query
		String id = "ccc";
		String name  = "홍길동";
		String sql = "update member set name = ? where id = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1,  name);
		ps.setString(2,  id);
		// 3. execute
		int count = ps.executeUpdate();
		// 4. close
		ps.close();
		conn.close();
		
		// check result
		if (count > 0) {
			System.out.println(count + " rows updated");
		} else {
			System.out.println("not found");
		}
		

	}

}
