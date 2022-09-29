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
try{
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	Class.forName("com.jdbc.mysql.Driver");
	Connection com = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","Mysql@123");
	PreparedStatement stmt = com.prepareStatement("select username,password from login where username=? and password=?");
	stmt.setString(1, username);
	stmt.setString(2, password);
	ResultSet rs = stmt.executeQuery();
	if(rs.next()){
		response.sendRedirect("adminhome.jsp");
	}
	else{
		System.out.println("Invalid credentials");
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>