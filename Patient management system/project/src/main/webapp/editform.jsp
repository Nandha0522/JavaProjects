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
<%@ page import="com.db.Employee" %>
<%
Integer id = (Integer) pageContext.getAttribute("id",PageContext.SESSION_SCOPE);
Employee emp = dbobj.selectbyid(id);
%>


<h1>Edit Employee Data</h1>
<form method="post">
	<div>
		<label>ID</label>
		<input type="number" name="id" value="<%= emp.getId() %>" readonly>
	</div>
	
	<div>
		<label>Name</label>
		<input type="text" name="name" value="<%= emp.getName() %>" readonly>
	</div>
	
	<div>
		<label>Mail ID</label>
		<input type="email" name="mailid" value="<%= emp.getMailid() %>">
	</div>
	
	<div>
		<label>Mobile Number</label>
		<input type="number" name="mobile" value="<%= emp.getMobile() %>">
	</div>
	<hr>
	<div>
		<label>Department</label>
		<select name="dept" readonly>
			<option <%= emp.getstatus().equals("Developer")?"selected":""%>>
				Developer
			</option>
			<option <%= emp.getstatus().equals("Tester")?"selected":""%>>
				Tester
			</option>
		</select>
	</div>
	
	<div>
		<label>Date of joining</label>
		<input type="date" name="doj" value="<%= emp.getDoj() %>" readonly>
	</div>
	
	<div>
		<label>Salary</label>
		<input type="number" name="salary"  value="<%= emp.getward() %>">
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
	<jsp:useBean id="employee" class="com.db.Employee"></jsp:useBean>
	<jsp:setProperty property="*" name="employee"/>
<%
	int count = dbobj.update(employee);
%>
<jsp:forward page="displaylist.jsp"></jsp:forward>	
<%	
}
%>