<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
String id=request.getParameter("id");
try{
	String sql="delete from sub0714 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.executeUpdate();
	%>
	<script>
	alert("완료되었습니다!");
	location.href="select_sub.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("삭제 실패");
}

%>
</body>
</html>