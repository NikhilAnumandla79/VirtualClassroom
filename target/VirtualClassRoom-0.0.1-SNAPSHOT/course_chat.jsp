<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.virtualclassrooms.model.News"%>
<%@ page import="java.util.List"%>
<%@ include file="header.jsp"%>
<div style="position:'relative'" >
<%
String course_name=(String)request.getParameter("course") ;
int course_id=Integer.parseInt(request.getParameter("course_id")) ;

%>
<h1><%=course_name %> Q&A</h1>
<hr>
<%
con = DriverManager.getConnection(dbUrl,dbUser,dbPass);

query="select * from questions where course_id='"+course_id+"' order by question_id desc";


stmt = con.createStatement();
rs = stmt.executeQuery(query);
while(rs.next()){
	int question_id=rs.getInt("question_id");	

%>

<div class="card" style="width:100rem;">
  <div class="card-body">
     <h4 class="card-title d-inline"><span class="text-light">Questioner > <%=rs.getString("questioner") %></span> : <%=rs.getString("question") %></h4>
     <div class="text-left">
     <% 
     String subQuery="select * from answers where question_id='"+question_id+"' order by answer_id";


     stmt = con.createStatement();
     rs = stmt.executeQuery(subQuery);
     while(rs.next()){
     %>
     <p><span><%=rs.getString("responder")%> : </span> <%=rs.getString("answer")%></p>
     <%} %>
     </div>
    <br><br>
    <form action="postAnswer?responder=<%=user_fullname %>&question_id=<%=question_id%>&course_id=<%=course_id %>&course_name=<%=course_name %>" class="form" method="post">
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












<form action="postQuestion?course_id=<%=course_id %>&course_name=<%=course_name %>"  method="post" class="form" >
<div class="card" style="position:fixed; bottom:1px; width:100rem" >
  <input type="text" placeholder="your question.." class="form-control" name="question">
  <div class="card-body">
   <h5 class="card-title text-center bg-light">Ask your question</h5>
  <input type="submit" class="form-control btn btn-primary" value="post" />
    
  </div>
</div>
</form>
</div>
<%@ include file="footer.jsp"%>
