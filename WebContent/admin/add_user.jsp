<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.virtualclassrooms.model.News"%>
<%@ page import="java.util.List"%>
<%@ include file="admin_header.jsp"%>

<h1>Add New Staff or Student</h1>
<hr>
<form action="addUser" method="post" onsubmit="return verify()">
                    <div class="form-group">
                       <label for="fullname ">FullName</label><span id="fullnameId"></span>
                        <input type="text" class="form-control" name="fullname" id="fullname" placeholder="fullname" autofocus>
                    </div>
                    
                    <div class="form-group">
                       <label for="username">Username</label><span id="usernameId"></span>
                        <input type="text" class="form-control"  name="username" id="username" placeholder="username">
                    </div>
                    <div class="form-group">
                       <label for="pass">Password</label><span id="passwordId"></span>
                        <input type="password" class="form-control" name="pass" id="pass" placeholder="password"">
                    </div>
                    <div class="form-group">
                       <label for="confirm-pass">Confirm Password</label><span id="confirm-passId"></span>
                        <input type="password" class="form-control" name="confirm-pass" id="confirm-pass" placeholder="confirm password">
                    </div>
                    <div class="form-group">
                       <label for="email ">User email...</label><span id="email"></span>
                        <input type="email" class="form-control" name="email" id="email" placeholder="enter email">
                    </div>
                    <div class="form-group">
                    	<label for="profession">Choose your profession:</label>
            						<select id="profession" name="profession" class="dropdown">
                							<option value="no">Select</option>
                							<option value="student">Student</option>
               								 <option value="teacher">Teacher</option>
            						</select> <span id="professionId"></span><br>
            
                    
                    </div>
                    
                    <div class="form-group text-center">
                        <input type="submit" class="btn btn-primary" value="Add User" >
                    </div>
     				<div class="form-group text-center">
                        <input type="reset" class="btn btn-info" value="Reset" name="reset">
                    </div>
                   
                  
                    </form>

<%@ include file="admin_footer.jsp"%>
