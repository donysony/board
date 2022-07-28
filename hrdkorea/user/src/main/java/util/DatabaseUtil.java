package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	
	//connection객체를 사용하여 실제로 데이터베이스와 연동된상태를 관리
	public static Connection getConnection() throws Exception{
		
			Class.forName("oracle.jdbc.OracleDriver");  //이 클래스를 찾아 사용하겠다고 정의
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			return con;
		
	}
	
	
}
