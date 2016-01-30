package exam;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnExam {

	public static void main(String[] args) throws Exception {
		// 0. 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");	// package_name.ClassName
		
		// 1. DB 접속 (Connection 객체를 얻어온다.)
		String url = "jdbc:oracle:thin:@localhost:1521:XE";	// jdbc:oracle:thin:@127.0.0.1:1521:XE	
		String user = "bit";
		String password = "bit";
		Connection conn = DriverManager.getConnection(url, user, password);
		if (conn != null) {
			System.out.println("done");
		} else {
			System.out.println("fail");
		}
		
		// 2. 쿼리 작성 (
		// 3. 쿼리 실행
		// 4. 접속 종료
	}

}
/*
	oracle driver folder : 설치된 폴더에서 
		D:\oraclexe\app\oracle\product\10.2.0\server\jdbc\lib
			ojdbc14.jar --> c:\bit로 복사
			web project 에서는 eclipse -> Web Root -> WEB-INF>lib에 복사
			java project 에서는 project properties에서 Java Build Path에서 Add External JARs로 추가
*/