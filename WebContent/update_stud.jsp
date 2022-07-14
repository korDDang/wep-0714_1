<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check() {
	var doc=document.form;
	if(doc.studno.value==""){
		alert("학번이 입력되지 않았습니다.");
		doc.studno.focus();
		return false;
	}else{
		doc.submit();
	}
}

</script>
</head>
<body>
<%@ include file="header.jsp"%>
<%@ include file="nav.jsp"%>
<%@ include file="DBConn.jsp"%>
<section id="sec1">
<%
String studno=request.getParameter("studno");
try{
	String sql="select * from stud0714 where studno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, studno);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		String name=rs.getString(2);
		String dept=rs.getString(3);
		String position=rs.getString(4);
		String address=rs.getString(5);
		String phone=rs.getString(6);
		String hobby=rs.getString(7);
		String hobbys[]=hobby.split(",");
	
%>
<h2>학사정보 수정</h2>
<hr>
<form name="form" method="post" action="update_studProcess.jsp">
<table border="1" id="tab1">
<tr>
	<th class="th1">학번</th>
		<td> <input type="text" name="studno"  value=<%=studno %>></td>
		</tr>
<tr>
	<th class="th1">성명</th>
		<td> <input type="text" name="name" value=<%=name%>></td>
		</tr>
<tr>
	<th class="th1">학과</th>
		<td>
		<select name="dept">
		<option value="1" <%=dept.equals("1")?"selected":"" %>>컴퓨터공학과</option>
		<option value="2" <%=dept.equals("2")?"selected":"" %> >기계공학과</option>
		<option value="3" <%=dept.equals("3")?"selected":"" %>>전자과</option>
		<option value="4" <%=dept.equals("4")?"selected":"" %>>영문학과</option>
		<option value="5" <%=dept.equals("5")?"selected":"" %>>일어과</option>
		<option value="6" <%=dept.equals("6")?"selected":"" %>>경영학과</option>
		<option value="7" <%=dept.equals("7")?"selected":"" %>>무역학과</option>
		<option value="8" <%=dept.equals("8")?"selected":"" %>>교육학과</option>
		</select>
		</td>
		</tr>
<tr>
	<th class="th1">학년</th>
	<td>
     <input type="radio" name="position" value="1" <%=position.equals("1")?"checked":"" %>>1학년
	 <input type="radio" name="position" value="2" <%=position.equals("2")?"checked":"" %>>2학년
	 <input type="radio" name="position" value="3" <%=position.equals("3")?"checked":"" %>>3학년
	 <input type="radio" name="position" value="4" <%=position.equals("4")?"checked":"" %>>4학년
		</td>
		</tr>

<tr>
	<th class="th1">취미</th>
	<td>
	 <input type="checkbox" name="hobby" value="프로그램" <%for(int i=0;i<hobbys.length;i++){if(hobbys[i].equals("프로그램")){%>checked<%}}%>>프로그램
	 <input type="checkbox" name="hobby" value="독서"  <%for(int i=0;i<hobbys.length;i++){if(hobbys[i].equals("독서")){%>checked<%}}%>>독서
	 <input type="checkbox" name="hobby" value="등산"  <%for(int i=0;i<hobbys.length;i++){if(hobbys[i].equals("등산")){%>checked<%}}%>>등산
	 <input type="checkbox" name="hobby" value="여행"  <%for(int i=0;i<hobbys.length;i++){if(hobbys[i].equals("여행")){%>checked<%}}%>>여행
	 <input type="checkbox" name="hobby" value="낚시"  <%for(int i=0;i<hobbys.length;i++){if(hobbys[i].equals("낚시")){%>checked<%}}%>>낚시
	 <input type="checkbox" name="hobby" value="영화보기"  <%for(int i=0;i<hobbys.length;i++){if(hobbys[i].equals("영화보기")){%>checked<%}}%>>영화보기
	 <input type="checkbox" name="hobby" value="잠자기"  <%for(int i=0;i<hobbys.length;i++){if(hobbys[i].equals("잠자기")){%>checked<%}}%>>잠자기
	 <input type="checkbox" name="hobby" value="멍때리기"  <%for(int i=0;i<hobbys.length;i++){if(hobbys[i].equals("멍때리기")){%>checked<%}}%>>멍때리기
		</td>
		</tr>
<tr>
	<th class="th1">주소</th>
		<td> <input type="text" name="address" value="<%=address %>" ></td>
		</tr>
<tr>
	<th class="th1">연락처</th>
		<td> <input type="text" name="phone" value="<%=phone %>"></td>
		</tr>
<tr>
<td colspan="2" class="td1">
<input type="button" value="목록" onclick="check()" class="bt1"> 
<input type="button" value="수정" onclick="location.href='index.jsp'" class="bt1">
</td>
</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</table>
</form>
</section>
<%@ include file="footer.jsp"%>
</body>
</html>