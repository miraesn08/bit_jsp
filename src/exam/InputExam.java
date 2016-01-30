package exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class InputExam {

	public static void main(String[] args) throws Exception {
		// 0. 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");	// package_name.ClassName
				
		// 1. DB 접속 (Connection 객체를 얻어온다.)
		String url = "jdbc:oracle:thin:@localhost:1521:XE";	// jdbc:oracle:thin:@127.0.0.1:1521:XE	
		String user = "bit";
		String password = "bit";
		Connection conn = DriverManager.getConnection(url, user, password);
				
		// 2. 쿼리 작성 (PreparedStatement, Statement)
		String sql = "insert into member(id,password,name,phone,email,reg_date) "
				+ "values(?,?,?,?,?,sysdate)";
			// index 1~
		String id = "ccc";
		String name = "ddd";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2,  "1111");
		ps.setString(3,  name);
		ps.setString(4, "010-234-5678");
		ps.setString(5,  "ddd@fff.com");
		
		// 3. 쿼리 실행
		int count = ps.executeUpdate();	// executeUpdate() - insert, update ,delete
			// executeQuery() - select

		// 4. 접속 종료
		ps.close();
		conn.close();
		
		if (count == 1) {
			System.out.println("insert o.k");
		} else {
			System.out.println("fail");
		}

	}

}
