<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>List of Patients</h1>
<a href="newempform.html">Add New Patients</a>
<jsp:useBean id="dbobj" class="com.db.DBcode"></jsp:useBean>
<%@ page import="java.util.ArrayList,com.db.Patient" %>

<%
ArrayList<Patient> patlist = dbobj.selectall();
%>

<table border="5">
	<tr> <th>NAME</th> <th>STATUS</th> <th>ACTION</th> </tr>
<%
for(Patient pat:patlist)
{
	
%>
	<tr>
		<td> <%= pat.getName() %></td>
		<td> <%= pat.getstatus() %></td>
		<td>
			<form action="displaydetails.jsp" method="post">
				<input type="hidden" name="patid" value="<%= pat.getId() %>">
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
