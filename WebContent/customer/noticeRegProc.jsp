<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
String title=request.getParameter("title");
String content=request.getParameter("content");

//dbconnect
String sql="insert into notices VALUES("
		+"(select max(to_number(seq))+1 from notices),"
		+"?,'cj',?,SYSTIMESTAMP,0)";
//db connect//드라이버로드
Class.forName("oracle.jdbc.driver.OracleDriver");
//접속
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";
Connection con=DriverManager.getConnection(url, user, pw);
//실행
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, title);
pstmt.setString(2, content);

//결과
pstmt.executeUpdate();//insert 실행

//목록으로 이동
response.sendRedirect("notice.jsp");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>noticeRegProc.jsp</h3>

</body>
</html>

<%
pstmt.close();
con.close();
%>