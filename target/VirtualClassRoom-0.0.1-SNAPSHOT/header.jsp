<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="com.virtualclassrooms.model.Student"%>
<%@page import="com.virtualclassrooms.model.Teacher"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<% 
HttpSession ses = request.getSession();
String dbUrl="jdbc:mysql://localhost:3306/virtualclassrooms";
String dbUser="root";
String dbPass="Nikhil@79";
Class.forName("com.mysql.jdbc.Driver");
Connection con=null;
Statement stmt=null;
PreparedStatement pstmt=null;
ResultSet rs =null;
String user = (String)ses.getAttribute("user");
String user_fullname="";
String user_type="";
String user_username="";
String user_email="";
int user_id=0;
if(user.equals("student")){
	Student student = (Student)ses.getAttribute("student");
	user_fullname=student.getFullname();
	user_type="student";
	user_username=student.getUsername();
	user_email=student.getEmail();
	user_id=student.getId();
	
}
if(user.equals("teacher")){
	Teacher teacher = (Teacher)ses.getAttribute("teacher");
	user_fullname=teacher.getFullname();
	user_type="teacher";
	user_username=teacher.getUsername();
	user_email=teacher.getEmail();
	user_id=teacher.getId();
}
	
%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Home page</title>

<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Our Custom CSS -->
<link rel="stylesheet" href="css/homepage.css">
<script src="scripts/homepage.js"></script>
</head>
<body>



	<div class="wrapper">
		<!-- Sidebar Holder -->
		<nav id="sidebar">
			<div class="sidebar-header">
				<h3>Virtual Classrooms</h3>
			</div>
		
			<ul class="list-unstyled components">
				<p><%= "Hi "+user_fullname %></p>
				<li><a href="home.jsp">Home</a></li>
				<li><a href="topnews">News</a></li>
<%

con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
String query="";
if(user.equals("student")){
query="select * from student_requests s join courses c where s.course_id=c.course_id and s.student_id=(select student_id from students where student_id='"+user_id+"')and s.request_status='approved'";
}else{
	query="select * from teacher_requests t join courses c where t.course_id=c.course_id and t.teacher_id=(select teacher_id from teachers where teacher_id='"+user_id+"')and t.request_status='approved'";
}
stmt = con.createStatement();
rs= stmt.executeQuery(query);
while(rs.next()){
String course=rs.getString("course_name");
int course_id=rs.getInt("course_id");
%>
	<li class="active"><a href="#homeSubmenu<%=course_id%>"
					data-toggle="collapse" aria-expanded="false"><%=course %></a>
					<ul class="collapse list-unstyled" id="homeSubmenu<%=course_id%>">
						<% 
if(user.equals("teacher")){
%>
						<li><a href="addCourseVideo?course_id=<%=course_id%>&course=<%=course%>">upload video</a></li>
						<li><a href="viewCourseStudents?course_id=<%=course_id%>&course=<%=course%>">View Students</a></li>
					<%} %>
						<li><a href="viewCourseVideos?course_id=<%=course_id%>&course=<%=course%>">Videos</a></li>
						<li><a href="courseChat?course_id=<%=course_id%>&course=<%=course%>">Chat Q&A</a></li>
						
						<li><a href="#">Live Class</a></li>
					</ul></li>
<%} %>
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

System.out.println(user);
%>

				<%
							
							if(user.equals("teacher")){%>
								<li><a href="viewStaff">View Staff</a></li>
								
							<%}%>
				<li><a href="profile.jsp">Profile</a></li>
				<li><a href="contact.jsp">Contact</a></li>
				<li><a href="logout">Logout</a></li>
			</ul>

			<ul class="list-unstyled CTAs">
				<li><a
					href="request_course.jsp" class="download">Request Course</a></li>
			</ul>
		</nav>

		<!-- Page Content Holder -->
		<div id="content">

			<nav class="navbar navbar-default">
				<div class="container-fluid">

					<div class="navbar-header">
						<button type="button" id="sidebarCollapse"
							class="btn btn-info navbar-btn">
							<i class="glyphicon glyphicon-align-left"></i> <span>Menu</span>
						</button>
					</div>

					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="home.jsp">Home</a></li>
							<li><a href="topnews">News</a></li>
							<li><a href="about.jsp">About</a></li>
							<li><a href="contact.jsp">Contact</a></li>
							<li><a href="#">Profile</a></li>
							
							<li><a href="logout">Logout</a></li>
						</ul>
					</div>
				</div>
			</nav>