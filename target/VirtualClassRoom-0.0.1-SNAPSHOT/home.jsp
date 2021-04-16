<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.virtualclassrooms.model.News"%>
<%@ page import="java.util.List"%>
<%@ include file="header.jsp"%>

<h1>Welcome <%=user_fullname %></h1>
<hr>
<% 
con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
if(user.equals("student")){
	query="select * from student_requests r join courses c where r.course_id=c.course_id and r.student_id='"+user_id+"' and request_status='approved'";
}
if(user.equals("teacher")){
	query="select * from teacher_requests r join courses c where r.course_id=c.course_id and r.teacher_id='"+user_id+"' and request_status='approved'";
}
stmt = con.createStatement();
rs = stmt.executeQuery(query);
if(user.equals("student")){%>

<p><b>Full Name : </b><%=user_fullname %></p>
<p><strong>User Name : </strong><%=user_username %></p>
<p><strong>Email Id  : </strong><%=user_email %></p>
<table class="table ">
	<tr>
	<th>Course Enrolled</th><th>Course Marks</th>
	</tr> 
	
<% 

while(rs.next()){
%>
	<tr>
	<td><%=rs.getString("course_name") %></td><td><%=rs.getString("student_marks") %></td>
	</tr> 
	

<%
} 
}%>
</table>
<%
if(user.equals("teacher")){

%>

<p><b>Full Name : </b><%=user_fullname %></p>
<p><strong>User Name : </strong><%=user_username %></p>
<p><strong>Email Id  : </strong><%=user_email %></p>
<table class="table ">
	<tr>
	<th>Courses Teaching</th>
	</tr> 
	
<% 

while(rs.next()){
%>
	<tr>
	<td><%=rs.getString("course_name") %></td>
	</tr> 
	

<%
} 
}%>
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
