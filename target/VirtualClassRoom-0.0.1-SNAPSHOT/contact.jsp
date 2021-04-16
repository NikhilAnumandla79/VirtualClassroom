<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.virtualclassrooms.model.News"%>
<%@ page import="java.util.List"%>
<%@ include file="header.jsp"%>


<div class="row justify-content-center">
                    <div class='col-md-7'>
                     <div class="card m-4 shadow-lg rounded-lg mt-5">
                        <h4 class="text-center card-header">Message us</h4>

                        <form action="" method='post' class='form-group card-body '>
                           <div >
                            <label for="email">Your Email</label>
                            <input class='form-control' type="email" name='email'>
                           </div>
                           <div >
                            <label for="subject">Subject</label>
                            <input class='form-control' type="subject" name='subject'>
                           </div>
                           <div >
                            <label for="msg">Message</label>
                            <textarea class='form-control' name="msg" id="" rows="5"></textarea>
                           </div>
                           <br>
                           <div class="text-center">
                              <input type="submit" name="submit" class="btn btn-primary " value="submit">
                           </div>
                            
                            
                            
                            
                            
                        </form>
                         
                     </div>
                     </div>
                    </div>


<%@ include file="footer.jsp"%>
