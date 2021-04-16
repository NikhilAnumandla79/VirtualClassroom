<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.virtualclassrooms.model.News"%>
<%@ page import="java.util.List"%>
<%@ include file="admin_header.jsp"%>

<h1>Chats - Question And Answers</h1>
<hr>
<%
con = DriverManager.getConnection(dbUrl,dbUser,dbPass);

String query="select * from questions order by question_id desc";


stmt = con.createStatement();
rs = stmt.executeQuery(query);
while(rs.next()){
	int question_id=rs.getInt("question_id");	
	int course_id=rs.getInt("course_id");
	con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
	String courseQuery="SELECT * FROM courses where course_id='"+course_id+"'";
	stmt = con.createStatement();
	 ResultSet rsCourse = stmt.executeQuery(courseQuery);
	 String course_name="";
	if(rsCourse.next()){
	   course_name=rsCourse.getString("course_name");
	                        
	}
%>

<div class="card" style="width:100rem;">
  <div class="card-body">
     <h4 class="card-title d-inline"><span class="text-light">Questioner > <%=rs.getString("questioner") %></span> : <%=rs.getString("question") %></h4>
     <div class="text-left">
     <% 
     String subQuery="select * from answers where question_id='"+question_id+"' order by answer_id";


     stmt = con.createStatement();
     ResultSet rsSub = stmt.executeQuery(subQuery);
     while(rsSub.next()){
     %>
     <p><span><%=rsSub.getString("responder")%> : </span> <%=rsSub.getString("answer")%></p>
     <%} %>
     </div>
    <br><br>
    <form action="postAnswer?responder=admin&question_id=<%=question_id%>&course_id=<%=course_id %>&course_name=<%=course_name %>" class="form" method="post">
    <input type="text" class="input-sm" width="20rem" placeholder="reply...." name="reply"><input type="submit" class="btn btn-primary" value="reply"/>
    </form>
  </div>
  <div class="card-body">
  <br>
 
  <span  class="float-right text-primary">Course : <%=course_name %></span>
  </div>
  
</div>
<br>
<hr>

<%}
%>


<%@ include file="admin_footer.jsp"%>