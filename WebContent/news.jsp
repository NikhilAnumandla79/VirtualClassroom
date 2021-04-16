
<%@ page import="com.virtualclassrooms.model.News"%>
<%@ page import="java.util.List"%>
<%@ include file="header.jsp"%>

<h1>News Updates</h1>
<hr>
<% List<News> topnews =(List<News>) request.getAttribute("topnews");
	for(News news : topnews){
%>
<div class="card" style="width: 100%;">
	<div class="card-body">
		<h2 class="card-title"><%=news.getHeadLine() %></h2>
		<p class="card-text"><%=news.getContent() %></p>
		<a href="#" class="btn btn-primary">read more</a>
	</div>
</div>
<%} %>
<%@ include file="footer.jsp"%>
