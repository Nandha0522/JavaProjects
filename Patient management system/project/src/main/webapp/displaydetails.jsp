<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Details</h1>
<%
int id = Integer.parseInt(request.getParameter("empid"));
%>
<jsp:useBean id="dbobj" class="com.db.DBcode"></jsp:useBean>
<%@ page import="com.db.Employee" %>
<%
Employee emp = dbobj.selectbyid(id);
pageContext.setAttribute("id",emp.getId(),PageContext.SESSION_SCOPE);
%>
<p> Name : <%= emp.getName() %></p>
<p> Department : <%= emp.getstatus() %></p>
<p> date of join : <%= emp.getDoj() %></p>
<p> salary : <%= emp.getward() %></p>
<p> mail Id : <%= emp.getMailid() %></p>
<p> mobile : <%= emp.getMobile()%></p>

<a href="displaylist.jsp">Home</a>
<a href="DeleteST?id=<%= emp.getId()%>">Delete</a>
<a href="editform.jsp">Edit</a>
</body>
</html>