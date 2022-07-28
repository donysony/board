package user;

public class UserDTO {
//	DataTransformObject
	//jsp프로그램안에서 일시적으로 하나의 데이터 단위를 담기위한 용도로 정의
	String userID;
	String userPassword;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	
	
}
