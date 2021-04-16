<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.virtualclassrooms.model.News"%>
<%@ page import="java.util.List"%>
<%@ include file="header.jsp"%>

<h1>Staff Details</h1>
<hr>
<table class="table ">
	<tr>
	<th>Staff Id</th><th>Staff Name</th><th>Staff Email</th>
	</tr> 
<%
 con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
query="SELECT * FROM teachers";
stmt = con.createStatement();
rs = stmt.executeQuery(query);
while(rs.next()){

%>
	<tr>
	<td><%=rs.getString("teacher_id") %></td><td><%=rs.getString("teacher_fullname") %></td><td><%=rs.getString("teacher_email") %></td>
	</tr>
<%} %>
</table>
<%
if(con!=null){
	con.close();
}
if(con!=null){
	stmt.close();
}
if(rs!=null){
	rs.close();
}

%>
<%@ include file="footer.jsp"%>
