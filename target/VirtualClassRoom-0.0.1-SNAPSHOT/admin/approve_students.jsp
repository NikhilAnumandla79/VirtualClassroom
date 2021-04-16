<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.virtualclassrooms.model.News"%>
<%@ page import="java.util.List"%>
<%@ include file="admin_header.jsp"%>

<h1>Approve Students</h1>

<table class="table ">
	<tr>
	<th>Course Id</th><th>Course Name</th><th>Student Id</th><th>Student Name</th><th>Status</th><th>approve</th><th>delete</th>
	</tr>
<% 
con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
String query="select * from students s join (select c.course_id,c.course_name,r.student_id,r.request_status from courses c join student_requests r where c.course_id=r.course_id) as x where s.student_id=x.student_id";
stmt = con.createStatement();
rs = stmt.executeQuery(query);
while(rs.next()){
int course_id=rs.getInt("course_id");
if(user.equals("admin")){
%>


	<tr>
	<td><%=rs.getInt("course_id") %></td><td><%=rs.getString("course_name") %>
	<td><%=rs.getInt("student_id") %><td><%=rs.getString("student_fullname") %>
	<td><%=rs.getString("request_status") %>
	</td><td><a href="approveUser?user=student&course_id=<%=course_id%>&student_id=<%=rs.getInt("student_id") %>" class="btn btn-primary">approve</a></td>
	<td><a href="deleteRequest?user=student&course_id=<%=course_id%>&student_id=<%=rs.getInt("student_id") %>" class="btn btn-danger">delete</a></td>
	</tr>
<%}

} %>
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
