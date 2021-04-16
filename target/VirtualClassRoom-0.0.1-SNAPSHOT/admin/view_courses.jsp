<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.virtualclassrooms.model.News"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page import="java.util.List"%>
<%@ include file="admin_header.jsp"%>
<h3>Add New Course</h3>
<form class="form" action="AddCourse" method="post">
	<input style="padding:5px;" type="text" id="new_course" name="course_name">&nbsp;<input class="btn btn-primary" type="submit" value="add course">
</form>

<br>


<table class="table ">
	<tr>
	<th>Course Id</th><th>Course Name</th><th>Delete</th>
	</tr> 
<%
con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
String query="select * from courses" ;
stmt = con.createStatement();
rs = stmt.executeQuery(query);
while(rs.next()){

%>
	<tr>
	<td><%=rs.getInt("course_id") %></td><td><%=rs.getString("course_name") %></td>
	<td><a href="deleteCourse?course_id=<%=rs.getInt("course_id")%>" class="btn btn-danger">delete </a></td>
	</tr>
<%} %>
</table>
<%
if(con!=null){
	con.close();
}
if(stmt!=null){
	stmt.close();
}
if(rs!=null){
	rs.close();
}

%>

<%@ include file="admin_footer.jsp"%>





