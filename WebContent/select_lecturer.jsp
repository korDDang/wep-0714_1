<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp"%>
<%@ include file="nav.jsp"%>
<%@ include file="DBConn.jsp"%>
<%
int cnt=0;
try{
	String sql="select count(*) from lecturer0714";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<section id="sec1">
<h2>학사정보 목록</h2>
<div style="margin: 0 10%">총 <%=cnt %>명의 강사가 있습니다.</div>
<hr>
<table border="1" id="tab1">
<tr>
<th class="th1">강사코드</th>
<th class="th1">강사명</th>
<th class="th1">전공</th>
<th class="th1">세부전공</th>
<th class="th1">관리</th>
</tr>
<% 
try{
	String sql="select * from lecturer0714";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String idx=rs.getString(1);
		String name=rs.getString(2);
		String major=rs.getString(3);
		String field=rs.getString(4);
%>
<tr>
<td class="td1"><%=idx %></td>
<td class="td1"><%=name %></td>
<td class="td1"><%=major %></td>
<td class="td1"><%=field %></td>
<td class="td1">
<a href="update_lecturer.jsp?idx=<%=idx %>">수정</a>/
<a href="delete_lecturer.jsp?idx=<%=idx %>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a>
</td>
</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</table>
<br>
<div class="td1"><input type="button" value="작성" onclick="location.href='insert_lecturer.jsp'" class="bt2"></div>
</section>
<%@ include file="footer.jsp"%>
</body>
</html>