package hrd;

import java.sql.*;
import java.util.ArrayList;

public class MemberMgr {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	public MemberMgr() throws Exception{
		con = getConnection();
		
	}
	//데이터베이스와 연동하는 부분을 정의함
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		return con;
	}

	public int getMaxCustno() {
		int maxNum = 0;
		try {
			sql ="select max(custno) from member_tbl_02 ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				maxNum = rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(con != null)
					con.close();
				if(rs != null)
					rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return maxNum;
	}
	public boolean insertMember(MemberBean bean) {
		boolean flag = false;
		try {
			sql="insert into Member_tbl_02 values(num_seq.nextval,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getCustname());
			pstmt.setString(2, bean.getPhone());
			pstmt.setString(3, bean.getAddress());
			pstmt.setString(4, bean.getJoindate());
			pstmt.setString(5, bean.getGrade());
			pstmt.setString(6, bean.getCity());
			if(pstmt.executeUpdate() == 1)
				flag = true;
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(con != null)
					con.close();
				if(rs != null)
					rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	//회원목록 가져오기
	public ArrayList<MemberBean> getAllList(){
		ArrayList<MemberBean> vlist = new ArrayList<MemberBean>();
		try {
			sql = "select * from member_tbl_02 order by custno desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			//rs에 있는 것을 bean에 넣어줌
			while(rs.next()) {
				MemberBean bean = new MemberBean();
//				bean.setCustno(rs.getInt(1)); 표현방식1
//				bean.setCustname(rs.getString(2));
				bean.setCustno(rs.getInt("custno"));//표현방식2
				bean.setCustname(rs.getString("custname"));
				bean.setPhone(rs.getString("phone"));
				bean.setAddress(rs.getString("address"));
				bean.setJoindate(rs.getString("joindate"));
				bean.setGrade(rs.getString("Grade"));
				bean.setCity(rs.getString("City"));
				
				vlist.add(bean);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(con != null)
					con.close();
				if(rs != null)
					rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return vlist;
		
		
	}
	
	//회원 상세 조회
	public MemberBean getMember(int custno) {
		MemberBean bean = new MemberBean();  // memberBean객체를 생성함
		try {
			sql="select * from member_tbl_02 where custno=?"; //select문으로 정보를 조회
			pstmt = con.prepareStatement(sql); //조회한 정보를 연결해주는 con.prepareStatement
			pstmt.setInt(1, custno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setCustno(rs.getInt("custno"));
				bean.setCustname(rs.getString("custname"));
				bean.setPhone(rs.getString("phone"));
				bean.setAddress(rs.getString("address"));
				bean.setJoindate(rs.getString("joindate"));
				bean.setGrade(rs.getString("grade"));
				bean.setCity(rs.getString("city"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(con != null)
					con.close();
				if(rs != null)
					rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return bean;
		}
	
	//회원정보 업데이트
	public boolean updateMember(MemberBean bean) {
		boolean flag = false;
	try {	
		sql="update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=? ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getCustname());
		pstmt.setString(2, bean.getPhone());
		pstmt.setString(3, bean.getAddress());
		pstmt.setString(4, bean.getJoindate());
		pstmt.setString(5, bean.getGrade());
		pstmt.setString(6, bean.getCity());
		pstmt.setInt(7, bean.getCustno());
		if(pstmt.executeUpdate() == 1) {
			flag = true;
		}
		
	}catch(Exception e) {
	e.printStackTrace();
	}finally {
	try {
		if(pstmt != null)
			pstmt.close();
		if(con != null)
			con.close();
		if(rs != null)
			rs.close();
	}catch(Exception e) {
		e.printStackTrace();
	}
		
	}
	return flag;
	
	}
	
	
	public ArrayList<MemberBean> getSalesInfo() {
		ArrayList<MemberBean> vlist = new ArrayList<MemberBean>();
		try {
			sql ="select A.custno, A.custname, A.grade, sum(B.price) as total from member_tbl_02 A join money_tbl_02 B on A.custno = B.custno group by (A.custno, A.custname, A.grade) order by total desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();// select문-> 가져오는 것은 executeQuery를 사용
			while(rs.next()) {
				MemberBean bean = new MemberBean();
				bean.setCustno(rs.getInt(1));  //컬럼명을 써도 됨
				bean.setCustname(rs.getString(2));
				bean.setGrade(rs.getString(3));
				bean.setPrice(rs.getInt(4));
				vlist.add(bean);  //반드시 add해줘야함!!
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(con != null)
					con.close();
				if(rs != null)
					rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return vlist;
		
		
	}
	
}












