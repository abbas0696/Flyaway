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
Class.forName("com.jdbc.mysql.Driver");
Connection com = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","Mysql@123");
String source = request.getParameter("Source");
String destination = request.getParameter("Destination");
String sql= "select * from flight where Source='" + source + "'and Destination='" + destination + "'";
Statement stmt = com.createStatement();
ResultSet rs = stmt.executeQuery(sql);
%>
<h1>Available Flights :</h1>
<table border="1">
	<tr>
		<th>name</th>
		<th>airline</th>
		<th>way</th>
		<th>price</th>
		<th>source</th>
		<th>destination</th>
	</tr>
	<%
	while (rs.next()) {
	%>
	<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><%=rs.getString(6)%></td>
	</tr>
	<%
	}
	%>
</table>
<br>
<form action="customerdetails.jsp" method="post">
	No of Persons <input type="number" name="no of persons" required> <br>
	<br> <input type="submit" value="Book Ticket">

</form>
</body>
</html>