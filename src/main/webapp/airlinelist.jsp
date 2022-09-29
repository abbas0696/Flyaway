<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String sql = "select * from airline order by name";
Class.forName("com.jdbc.mysql.Driver");
Connection com = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","Mysql@123");
Statement stmt = com.createStatement();
ResultSet rs = stmt.executeQuery(sql);
%>
<h1>AirLines List :</h1>
<table border="1">
	<tr>
		<th>code</th>
		<th>name</th>
	</tr>
	<%
	while (rs.next()) {
	%>
	<tr>
		<td>
			<%=
			rs.getString(1)
			%>
		</td>
		<td>
			<%=
			rs.getString(2)
			%>
		</td>
		
	</tr>
	<%
	}
	%>
</table>
</body>
</html>