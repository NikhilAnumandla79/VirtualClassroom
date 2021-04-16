<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.virtualclassrooms.model.News"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page import="java.util.List"%>
<%@ include file="admin_header.jsp"%>
<table class="table ">
	<tr>
	<th>Student Id</th><th>Student Name</th><th>Student Email</th><th>Delete</th>
	</tr> 
<%

con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
String query="SELECT * from students order by student_id desc";
stmt = con.createStatement();
rs = stmt.executeQuery(query);
while(rs.next()){

%>

	<tr>
	<td><%=rs.getInt("student_Id") %></td><td><%=rs.getString("student_fullname") %></td><td><%=rs.getString("student_email") %></td>
	<td><a href="deleteUser?user=student&student_id=<%=rs.getInt("student_id")%>" class="btn btn-danger">delete </a></td>
	</tr>
<%} %>
</table>
<%
if(con!=null){
	con.close();
}
if(con!=null){
	stmt.close();
}
if(rs!=null){
	rs.close();
}

%>

<%@ include file="admin_footer.jsp"%>
