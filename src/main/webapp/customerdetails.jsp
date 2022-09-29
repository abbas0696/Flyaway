<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Select route</h1>
<form action="showdetails.jsp" method="post">
<datalist id="Source">
<%
Class.forName("com.jdbc.mysql.Driver");
Connection com = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","Mysql@123");
String sql = "select * from places order by Source";
Statement stmt = com.createStatement();
ResultSet rs = stmt.executeQuery(sql);
while(rs.next()){
	String source = rs.getString("Source");
%>
<option value="<%=source%>">
<%
}
%>
</datalist>
<p>
Source: <input type="text" name="source" list="source" required/>
</p>
<datalist id="Destination">
<%
Class.forName("com.jdbc.mysql.Driver");
Connection com1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","Mysql@123");
String sql1 = "select * from places order by Destination";
Statement stmt1 = com.createStatement();
ResultSet rs1 = stmt.executeQuery(sql);
while(rs1.next()){
	String destination = rs1.getString("destination");
%>
<option value="<%=destination%>">
<%
}
rs.close();
com.close();
%>
</datalist>
<p>
		Destination: <input type="text" name ="destination" list="destination" required/>
		<h2>Enter your details</h2>
		<%
		int count = Integer.parseInt(request.getParameter("no of persons"));
		for (int i = 1; i <= count; i++) {
		%>
		Passenger Name <%=i %> : <input type="text" name="fullname" required> <br> 
		Aadhar UID <%=i %> : <input type="number" name="uid" required><br> 
		Phone Number <%=i %> : <input type="number" name="phone" required> <br>
		Age <%=i %> : <input type="number" name="age" required><br>
		-----------------------------------------------------------------------<br>
		<%
		}
		%>
		<input type="submit" value="Book Ticket"><br>
</form>
</body>
</html>