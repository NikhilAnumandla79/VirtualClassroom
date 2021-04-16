<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.virtualclassrooms.model.News"%>
<%@ page import="java.util.List"%>
<%@ include file="admin_header.jsp"%>

<h3>Upload New Course Video</h3>
<hr>
     <form action="postVideo" method="post">
<div class="form-group">
   
       Select Course :<select class="form-control" name="course_id" style="width:10rem" required>
       
<% 
con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
String query="SELECT * FROM courses";
stmt = con.createStatement();
 rs = stmt.executeQuery(query);
while(rs.next()){%>
    <option value="<%=rs.getInt("course_id")%>"><%=rs.getString("course_name")%></option>
                        
    <% } %>
                          
 </select>
 <br>
  <br>
 <input type="file" name="filepath"/>
  <br> <br>
  <input type="text" name="title" placeholder="enter title for video">
  <br> <br>
 <input type="submit" value="post video" class="btn btn-primary" accept="video/mp4,video/x-m4v,video/*"/>
  <br>
 </div>
</form>
<%@ include file="admin_footer.jsp"%>
