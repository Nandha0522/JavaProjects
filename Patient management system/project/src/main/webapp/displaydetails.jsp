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
int id = Integer.parseInt(request.getParameter("patid"));
%>
<jsp:useBean id="dbobj" class="com.db.DBcode"></jsp:useBean>
<%@ page import="com.db.patient" %>
<%
patient pat = dbobj.selectbyid(id);
pageContext.setAttribute("id",emp.getId(),PageContext.SESSION_SCOPE);
%>
<p> Name : <%= pat.getName() %></p>
<p> Department : <%= pat.getstatus() %></p>
<p> date of join : <%= pat.getDoj() %></p>
<p> salary : <%= pat.getward() %></p>
<p> mail Id : <%= pat.getMailid() %></p>
<p> mobile : <%= pat.getMobile()%></p>

<a href="displaylist.jsp">Home</a>
<a href="DeleteST?id=<%= emp.getId()%>">Delete</a>
<a href="editform.jsp">Edit</a>
</body>
</html>
