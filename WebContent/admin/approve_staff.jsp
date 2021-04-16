<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.virtualclassrooms.model.News"%>
<%@ page import="java.util.List"%>
<%@ include file="admin_header.jsp"%>

<h1>Approve Staff</h1>

<table class="table ">
	<tr>
	<th>Course Id</th><th>Course Name</th><th>Staff Id</th><th>Staff Name</th><th>Status</th><th>approve</th><th>delete</th>
	</tr>
<% 
con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
String query="select * from teachers s join (select c.course_id,c.course_name,r.teacher_id,r.request_status from courses c join teacher_requests r where c.course_id=r.course_id) as x where s.teacher_id=x.teacher_id";
stmt = con.createStatement();
rs = stmt.executeQuery(query);
while(rs.next()){
int course_id=rs.getInt("course_id");
if(user.equals("admin")){
%>


	<tr>
	<td><%=rs.getInt("course_id") %></td><td><%=rs.getString("course_name") %>
	<td><%=rs.getInt("teacher_id") %><td><%=rs.getString("teacher_fullname") %>
	<td><%=rs.getString("request_status") %>
	</td><td><a href="approveUser?user=teacher&course_id=<%=course_id%>&teacher_id=<%=rs.getInt("teacher_id") %>" class="btn btn-primary">approve</a></td>
	<td><a href="deleteRequest?user=teacher&course_id=<%=course_id%>&teacher_id=<%=rs.getInt("teacher_id") %>" class="btn btn-danger">delete</a></td>
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
