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
	<th>Staff Id</th><th>Staff Name</th><th>Staff Email Id</th><th>Delete</th>
	</tr> 
<%
con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
String query="SELECT * FROM teachers order by teacher_id desc";
stmt = con.createStatement();
rs = stmt.executeQuery(query);
while(rs.next()){

%>
	<tr>
	<td><%=rs.getInt("teacher_id") %></td><td><%=rs.getString("teacher_fullname") %></td><td><%=rs.getString("teacher_email") %></td>
	<td><a href="deleteUser?user=teacher&teacher_id=<%=rs.getInt("teacher_id")%>" class="btn btn-danger">delete </a></td>
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
