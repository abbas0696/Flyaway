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
String SOURCE = request.getParameter("Source");
String DESTINATION = request.getParameter("Destination");
String time = "11:55 pm";
Class.forName("com.jdbc.mysql.Driver");
Connection com = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","Mysql@123");
Statement stmt = com.createStatement();
String sql = "select * from places where Source='" + SOURCE + "'and Destination='" + DESTINATION + "'";
ResultSet rs = stmt.executeQuery(sql);
%>
<h1>Your Flight Details :</h1>
<table border="1">
	<tr>
		<th>Flight name</th>
		<th>airline</th>
		<th>way</th>
		<th>price</th>
		<th>source</th>
		<th>destination</th>
		<th>Time</th>
	</tr>
	<%
	while (rs.next()) {
	%>
	<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4) + "/-"%></td>
		<td><%=rs.getString(5)%></td>
		<td><%=rs.getString(6)%></td>
		<td><%=time%></td>
	</tr>
	<%
	}
	%>	
</table>

<form action="payment.jsp" method="post">
	No of Persons <input type="number" name="no of persons" required><br>
	<h1>Payment Details :</h1>
	Debit card Number : <input type="number" required><br>
	Expiry Date : <input type="text"><br>
	CVV : <input type="number" required><br>
        <input type="submit" value="submit" ><br>
</form>	
</body>
</html>