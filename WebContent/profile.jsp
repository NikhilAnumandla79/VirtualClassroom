<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.virtualclassrooms.model.News"%>
<%@ page import="java.util.List"%>
<%@ include file="header.jsp"%>

<h1>Profile</h1>


<form action="updateProfile" method="post">
                    <div class="form-group">
                       <label for="user_firstName ">FullName</label>
                        <input type="text" class="form-control" value="<%=user_fullname %>" name="fullname" required>
                    </div>
                    <div class="form-group">
                       <label for="username">Username...</label>
                        <input type="text" class="form-control" value="<%=user_username %>" name="username" required>
                    </div>
                    <div class="form-group">
                       <label for="user_password">Set new password...</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    <div class="form-group">
                       <label for="user_email ">User email...</label>
                        <input type="email" name="email" class="form-control" value="<%=user_email %>" required>
                    </div>
                    
                    
                    <div class="form-group text-center">
                        <input type="submit" class="btn btn-primary" value="Update" name="update_user">
                    </div>
     
                   
                  
                    </form>
<p>NOTE : After Profile Update you need to login again....</p>
<%@ include file="footer.jsp"%>
