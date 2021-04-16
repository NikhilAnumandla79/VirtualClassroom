<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.virtualclassrooms.model.News"%>
<%@ page import="java.util.List"%>
<%@ include file="header.jsp"%>

<h1>Request Courses</h1>


<table class="table ">
	<tr>
	<th>Course Id</th><th>Course Name</th><th>Request</th>
	</tr>
<% 
con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
if(user.equals("student")){
	query="select * from courses c where c.course_id not in (select r.course_id from student_requests r where student_id='"+user_id+"')";
}
if(user.equals("teacher")){
	query="select * from courses c where c.course_id not in (select r.course_id from teacher_requests r where teacher_id='"+user_id+"')";
}

stmt = con.createStatement();
rs = stmt.executeQuery(query);
while(rs.next()){
int course_id=rs.getInt("course_id");
if(user.equals("student")){
%>


	<tr>
	<td><%=rs.getInt("course_id") %></td><td><%=rs.getString("course_name") %>
	</td><td><a href="requestCourse?user=student&course_id=<%=course_id%>&student_id=<%=user_id %>" class="btn btn-primary">Request</a></td>
	</tr>
<%}else{%>
	<tr>
	<td><%=rs.getInt("course_id") %></td><td><%=rs.getString("course_name") %>
	</td><td><a href="requestCourse?user=teacher&course_id=<%=course_id%>&teacher_id=<%=user_id %>" class="btn btn-primary">Request</a></td>
	</tr>

<%	
}

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
<%@ include file="footer.jsp"%>
