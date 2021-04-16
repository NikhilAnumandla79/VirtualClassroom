<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.virtualclassrooms.model.News"%>
<%@ page import="java.util.List"%>
<%@ include file="header.jsp"%>


<h1><%=request.getAttribute("course_name") %> Course Videos</h1>
<hr>
<% 
con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
if(user.equals("teacher")){
	query="select * from videos where course_id='"+request.getAttribute("course_id")+"' order by video_id desc";
}
if(user.equals("student")){
	String status="approved";
	query="select * from videos where course_id='"+request.getAttribute("course_id")+"' and video_status='"+status+"' order by video_id desc";
}

stmt = con.createStatement();
rs = stmt.executeQuery(query);
if(user.equals("teacher")){

while(rs.next()){
int video_id=rs.getInt("video_id");
int course_id=rs.getInt("course_id");
%>
<div class="card" style="width:50rem;">
  <video controls width="600" height="350">
  <source src="<%=rs.getString("video_filepath") %>" type="video/mp4">
</video>
  <div class="card-body">
    <h5 class="card-title"><%=rs.getString("video_title") %>></h5>
    <br>
    <a href="modifyVideo?video_id=<%=video_id %>&operation=delete" class="btn btn-danger">delete</a>&nbsp;
    <a href="#"  class="btn btn-primary" >like</a>&nbsp;&nbsp;&nbsp;
    
  </div>
  <div class="card-body">
  <br>
  <p>Uploader : <%=rs.getString("uploader") %></p>
    <span>Status : <%=rs.getString("video_status") %></span>&nbsp;&nbsp;&nbsp;&nbsp;<span  class="float-right text-primary">Likes:<%=rs.getInt("video_likes") %></span>
  </div>
  
</div>
<br>
<hr>

<%}

} %>
<% 
if(user.equals("student")){

while(rs.next()){
int video_id=rs.getInt("video_id");
int course_id=rs.getInt("course_id");
%>
<div class="card" style="width:50rem;">
  <video controls width="600" height="350">
  <source src="<%=rs.getString("video_filepath") %>" type="video/mp4">
</video>
  <div class="card-body">
    <h5 class="card-title"><%=rs.getString("video_title") %>></h5>
    <br>
    <a href="#"  class="btn btn-primary" >like</a>&nbsp;&nbsp;&nbsp;
    
  </div>
  <div class="card-body">
  <br>
  <p>Uploader : <%=rs.getString("uploader") %></p>
    <span>Status : <%=rs.getString("video_status") %></span>&nbsp;&nbsp;&nbsp;&nbsp;<span  class="float-right text-primary">Likes:<%=rs.getInt("video_likes") %></span>
  </div>
  
</div>
<br>
<hr>

<%}

} %>
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
