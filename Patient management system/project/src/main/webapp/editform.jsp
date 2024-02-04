<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="dbobj" class="com.db.DBcode"></jsp:useBean>
<%@ page import="com.db.Patient" %>
<%
Integer id = (Integer) pageContext.getAttribute("id",PageContext.SESSION_SCOPE);
Patient pat = dbobj.selectbyid(id);
%>


<h1>Edit Patient Data</h1>
<form method="post">
	<div>
		<label>ID</label>
		<input type="number" name="id" value="<%= pat.getId() %>" readonly>
	</div>
	
	<div>
		<label>Name</label>
		<input type="text" name="name" value="<%= pat.getName() %>" readonly>
	</div>
	
	<div>
		<label>Mail ID</label>
		<input type="email" name="mailid" value="<%= pat.getMailid() %>">
	</div>
	
	<div>
		<label>Mobile Number</label>
		<input type="number" name="mobile" value="<%= pat.getMobile() %>">
	</div>
	<hr>
	<div>
		<label>Status</label>
		<select name="status" readonly>
			<option <%= pat.getstatus().equals("heavy fever")?"selected":""%>>
				heavy fever
			</option>
			<option <%= pat.getstatus().equals("stomach pain")?"selected":""%>>
				stomach pain
			</option>
		</select>
	</div>
	
	<div>
		<label>Date</label>
		<input type="date" name="doj" value="<%= pat.getDoj() %>" readonly>
	</div>
	
	<div>
		<label>Word no</label>
		<input type="number" name="sword"  value="<%= pat.getward() %>">
	</div>
	
	<div>
		<input type="submit" name="btn">
	</div>
</form>
</body>
</html>

<%
String button = request.getParameter("btn");
if(button!=null)
{
%>
	<jsp:useBean id="patient" class="com.db.Patient"></jsp:useBean>
	<jsp:setProperty property="*" name="patient"/>
<%
	int count = dbobj.update(patient);
%>
<jsp:forward page="displaylist.jsp"></jsp:forward>	
<%	
}
%>
