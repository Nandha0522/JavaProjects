<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dbcode" class="com.db.DBcode"></jsp:useBean>
<jsp:useBean id="patient" class="com.db.Patient"></jsp:useBean>
<jsp:setProperty property="*" name="patient"/>
<%
int count = dbcode.insert(patient);
%>
<jsp:forward page="displaylist.jsp"></jsp:forward>
</body>
</html>
