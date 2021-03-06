package board;

import java.io.*;
import java.sql.*;
import java.util.Vector;

import javax.servlet.http.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardMgr {
	private DBConnectionMgr pool;
	private static final String SAVEFOLDER = "D:/PKS/06_jspworkspace/board/src/main/webapp/fileupload";
	private static final String ENCTYPE = "UTF-8";
	private static final int MAXSIZE = 5*1024*1024;
	
	public BoardMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MultipartRequest multi = null;
		String filename = null;
		int filesize = 0;
		
		try {
			con = pool.getConnection();
			sql = "select max(num) from tblboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int ref = 1;
			if(rs.next()) {
				ref = rs.getInt(1) + 1;//결과가 하나라도 있으면(rs.getInt(1)) max값에다 +1해주기
			}
			File file = new File(SAVEFOLDER);
			if(!file.exists()) {
				//파일이 존재하지 않으면 생성해라
				file.mkdirs();//s가 안붙으면 파일만 생성, s 붙으면 경로도 생성
			}
			multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
			if(multi.getFilesystemName("filename") != null){//파일이 들어있으면
				filename = multi.getFilesystemName("filename");
				filesize = (int)multi.getFile("filename").length();
			}
			sql = "insert into tblboard values(?,?,?,?,0,?,0,SYSDATE,?,?,0,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setString(2, multi.getParameter("name"));
			pstmt.setString(3, multi.getParameter("subject"));
			pstmt.setString(4, multi.getParameter("content"));
			pstmt.setInt(5, ref);
			pstmt.setString(6, multi.getParameter("pass"));
			pstmt.setString(7, multi.getParameter("ip"));
			pstmt.setString(8, filename);
			pstmt.setInt(9, filesize);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	//게시물의 총 개수
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if(keyWord.equals("null") || keyWord.equals("")) {
				sql = "select count(num) from tblboard";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyWord+"%");
			}else {
				sql = " select count(num) from tblboard where " + keyField + " like ?";
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount; //총개수
		
	}
	// 게시판 리스트
	public Vector<BoardBean> getBoardList(String keyField, String keyWord, int start, int end){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>();
		try {
			con = pool.getConnection();
			if(keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from (select * from tblboard order by ref desc, pos ) where ROWNUM >= ? AND ROWNUM <= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from(select * from tblboard where "+keyField+" like ? order by ref desc, pos) where ROWNUM >= ? AND ROWNUM <= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyWord+"%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num")); //db에서 가져온 num값을 bean에 넣어줌
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
				vlist.add(bean);
			}
		}catch(Exception e){
			e.printStackTrace();
	}finally {
		pool.freeConnection(con, pstmt, rs);
	}
		return vlist;
	
	
}	
	}
