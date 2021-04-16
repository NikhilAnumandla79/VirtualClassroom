<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.virtualclassrooms.model.News"%>
<%@ page import="java.util.List"%>
<%@ include file="header.jsp"%>
<%
int course_id=(Integer)request.getAttribute("course_id");
String course_name=(String)request.getAttribute("course_name") ;
System.out.println(course_id);
System.out.println(course_name);
%>


<h1><%=course_name%> > Course Students</h1>
<hr>

<table class="table ">
	<tr>
	<th>Student Id</th><th>Student Name</th><th>Student Email</th><th>Student Marks</th>
	</tr> 
<% 
con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
if(user.equals("teacher")){
	query="select * from student_requests r join students s where s.student_id=r.student_id and r.course_id='"+course_id+"' and r.request_status='approved'";
}
stmt = con.createStatement();
rs = stmt.executeQuery(query);
if(user.equals("teacher")){

while(rs.next()){
	int student_id=rs.getInt("student_id");
%>
	
	<tr>
	<td><%=student_id %></td><td><%=rs.getString("student_fullname") %></td><td><%=rs.getString("student_email") %></td>
	<td>
	<form action="updateMarks" method="get">
	
	<input type="number" class="form-control d-inline" value="<%=rs.getInt("student_marks") %>" name="student_marks"/>
	<input name="student_id" type="hidden" value="<%=student_id%>">
	<input name="course_id" type="hidden" value="<%=course_id %>">
	<input name="course_name" type="hidden" value="<%=course_name%>">
	<input type="submit" class="btn btn-primary" value="update marks"/>
	</form>
	</td>
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
