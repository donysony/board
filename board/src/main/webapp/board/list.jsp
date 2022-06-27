<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="bMgr" class = "board.BoardMgr"/>
<%
	request.setCharacterEncoding("UTF-8");
	int totalRecord =0;     // 전체 레코드 수  ex)68개
	int numPerPage = 10;    //10개씩 보여지도록 = 1페이지당 보여주는 레코드수
	int pagePerBlock = 5;   //페이지번호?블록 5개까지만 보여지도록 = 블록당 페이지수 [1][2][3][4][5]
			
	int totalPage = 0;      // 전체 페이지수 65페이지가 있다면 [1][2][3][4][5]/[6][7]까지 보여야함
	int totalBlock = 0;		// 전체 블록수 : 2
	
	int nowPage = 1;  		// 현재 레코드가 해당하는 페이지 
	int nowBlock = 1;		// 현재 레코드가 해당하는 블록
	
	int start = 0;			// DB테이블의 select시작번호()
	int listSize = 0;		// 읽어온 게시물의 수 
	String keyWord ="", keyField="";
	Vector<BoardBean> vlist= null;
	if(request.getParameter("keyWord") != null){
		keyWord = request.getParameter("keyWord");
		keyField=request.getParameter("keyField");
	}
	if(request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage*numPerPage) - numPerPage + 1;

	totalRecord = bMgr.getTotalCount(keyField, keyWord);
	totalPage = (int)Math.ceil((double)totalRecord/numPerPage);     // 전체 페이지수
	nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock);      //현재 블럭 계산
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);  //전체 블럭 계산
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table align="center" width="700">
	<tr>
		<td colspan="5">Total : <%=totalRecord %>Articles(<font color="#ffcc80"><%=nowPage %>/<%=totalPage %></font>page)</td>
	</tr>
	<tr bgcolor="#d0d0d0" align="center">
		<td width="10%">번호</td>
		<td width="40%">제목</td>
		<td width="15%">이름</td>
		<td width="25%">날짜</td>
		<td width="10%">조회수</td>
	</tr>
	<%
		vlist = bMgr.getBoardList(keyField, keyWord, start, numPerPage);
	
	
	%>
	<tr>
	<!-- 페이징 시작 -->
		<td colspan="3"></td>
	<!-- 페이징 끝 -->
		<td colspan="2" align = "right">
			<a href="post.jsp">[글쓰기]</a>&nbsp;
			<a href="javascript:list()">[처음으로]</a>
		</td>
	</tr>
</table>
<hr width="700">
<form name ="searchFrm" method="get" action="list.jsp">
	<table align="center" width="800">
	
		<tr>
			<td align="center">
			<select name="keyField">
				<option value="name">이름</option>
				<option value="subject">제목</option>
				<option value="name"></option>
			</select>
				<input name ="keyWord">	
				<input type="button" value="찾기" onClick="">	
				<input type="hidden" name="nowPage" value="1">
			</td>
		</tr>	
	</table>
</form>
</body>
</html>