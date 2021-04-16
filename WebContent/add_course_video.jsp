<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.virtualclassrooms.model.News"%>
<%@ page import="java.util.List"%>
<%@ include file="header.jsp"%>
<%
String course_name=(String)request.getAttribute("course_name") ;
int course_id=(Integer)request.getAttribute("course_id") ;

%>
<h1>Upload new Video for Course - <%=course_name%></h1>

<hr>
     <form action="postVideo?course_id=<%=course_id %>&course_name=<%=course_name %>" method="post">
     
<div class="form-group">
   
       Course :<%=course_name%>
 <br><br>
 
 <input type="file" name="filepath"/>
  <br> 
  <input type="text" name="title" placeholder="enter title for video">
  <br><br>
 <input type="submit" value="post video" class="btn btn-primary" accept="video/mp4,video/x-m4v,video/*"/>
  <br>
 </div>
</form>
<%@ include file="footer.jsp"%>
