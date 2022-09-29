<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int count=Integer.parseInt(request.getParameter("no of persons"));
out.println("<h1>"+"Payment of amount " + 6000*count + "/- is successful" +"</h1>");
RequestDispatcher rd = request.getRequestDispatcher("/showdetails.jsp");
rd.include(request, response);
%>
</body>
</html>