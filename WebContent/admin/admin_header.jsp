<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
String fullname="";
if(user.equals("admin")){
	fullname="admin";
}
%>
<!DOCTYPE html>
<html lang="en-Us">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Home page</title>
        
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
			
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        
        
         <!-- Bootstrap CSS CDN -->
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <!-- Our Custom CSS -->
        <link rel="stylesheet" href="css/homepage.css">
        <script src="scripts/homepage.js"></script>
    </head>
    <body>



        <div class="wrapper" >
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3>Virtual Classrooms</h3>
                </div>
				
                <ul class="list-unstyled components">
                    <p><%="Hello "+fullname %></p>
                    <li>
                        <a href="homePage">Dashboard</a>
                    </li>
                    <li>
                        <a href="topnews">News</a>
                    </li>
                    <li class="active">
                        <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false">Student & Staff</a>
                        <ul class="collapse list-unstyled" id="homeSubmenu">
                            <li><a href="viewStudents">View Students</a></li>
                            <li><a href="viewStaff">View Staff</a></li>
                            <li><a href="addUser">Add New User</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#videoSubmenu" data-toggle="collapse" aria-expanded="false">Videos</a>
                        <ul class="collapse list-unstyled" id="videoSubmenu">
                        	<li><a href="viewVideos">all videos</a></li>
                        	<li><a href="addVideo">add video</a></li>
                        </ul>
                        <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">Courses</a>
                        <ul class="collapse list-unstyled" id="pageSubmenu">
                        	<li><a href="viewCourses">View Courses</a></li>
                        </ul>
                    </li>
                     <li>
                        <a href="qandA">Chat Q&A</a>
                    </li>
                    <li>
                        <a href="logout">Logout</a>
                    </li>
                </ul>

                <ul class="list-unstyled CTAs">
                    <li><a href="viewStudentRequests" class="download">Student Requests</a></li>
                    <li><a href="viewStaffRequests" class="download">Teacher Requests</a></li>
                </ul>
            </nav>

            <!-- Page Content Holder -->
            <div id="content">

                <nav class="navbar navbar-default">
                    <div class="container-fluid">

                        <div class="navbar-header">
                            <button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn">
                                <i class="glyphicon glyphicon-align-left"></i>
                                <span>Menu</span>
                            </button>
                        </div>

                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="topnews">News</a></li>
                                <li><a href="logout">Logout</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
