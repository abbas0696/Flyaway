<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String pass = request.getParameter("new password");
String oldpass = request.getParameter("existing password");
String Oldpass = "";
String confirm = request.getParameter("confirm password");
Class.forName("com.jdbc.mysql.Driver");
Connection com = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","Mysql@123");
String sql1 = "select password from login where password='" + oldpass + "'";
String sql2 = "update login set password=" + confirm + " where username='Abbas'";
Statement stmt = com.createStatement();
ResultSet rs = stmt.executeQuery(sql1);
if (rs.next()) {
	Oldpass = rs.getString("password");
}
if (pass.equals(confirm)) {
	if (oldpass.equals(Oldpass)) {
		stmt = com.createStatement();
		int i = stmt.executeUpdate(sql2);
		out.println("password updated");
		RequestDispatcher rd = request.getRequestDispatcher("/passdata.jsp");
		rd.include(request, response);
	} else {
		out.println("old password doesn't match");
		RequestDispatcher rd = request.getRequestDispatcher("/passdata.jsp");
		rd.include(request, response);
	}
} else {
	out.println("passwords dont match");
	RequestDispatcher rd = request.getRequestDispatcher("/passdata.jsp");
	rd.include(request, response);
}
%>
</body>
</html>