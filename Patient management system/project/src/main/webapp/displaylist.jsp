<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>List of Employees</h1>
<a href="newempform.html">Add New Employee</a>
<jsp:useBean id="dbobj" class="com.db.DBcode"></jsp:useBean>
<%@ page import="java.util.ArrayList,com.db.Employee" %>

<%
ArrayList<Employee> emplist = dbobj.selectall();
%>

<table border="5">
	<tr> <th>NAME</th> <th>STATUS</th> <th>ACTION</th> </tr>
<%
for(Employee emp:emplist)
{
	
%>
	<tr>
		<td> <%= emp.getName() %></td>
		<td> <%= emp.getstatus() %></td>
		<td>
			<form action="displaydetails.jsp" method="post">
				<input type="hidden" name="empid" value="<%= emp.getId() %>">
				<input type="submit" value="View">
			</form> 
		</td>
	</tr>
<%
}
%>
</table>
</body>
</html>