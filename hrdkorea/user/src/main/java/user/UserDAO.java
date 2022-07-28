package user;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

public class UserDAO {

	//DatabaseAccessObject 데이터베이스 접근 객체
	//데이터베이스와 1대1로 연동되어 실제로 데이터베이스에 기록하고 가져오는
	
	//데이터베이스와 연동하는 부분을 정의함
	
	public int join (String userID, String userPassword) {
		String SQL = "insert into user values (?,?)";
		try {
			//PreparedStatment는 ?에 데이터를 각각 넣어줄 수 있도록 함
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
