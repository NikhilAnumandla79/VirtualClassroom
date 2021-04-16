<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.virtualclassrooms.model.News"%>
<%@ page import="java.util.List"%>
<%@ include file="admin_header.jsp"%>

<%
con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
String query="select count(*) from students";
stmt = con.createStatement();
rs = stmt.executeQuery(query);
rs.next();
int totalStudents=rs.getInt("count(*)");

query="select count(*) from teachers";
stmt = con.createStatement();
rs = stmt.executeQuery(query);
rs.next();
int totalStaff=rs.getInt("count(*)");

query="select count(*) from student_requests where request_status='unapproved'";
stmt = con.createStatement();
rs = stmt.executeQuery(query);
rs.next();
int studentRequests=rs.getInt("count(*)");

query="select count(*) from teacher_requests where request_status='unapproved'";
stmt = con.createStatement();
rs = stmt.executeQuery(query);
rs.next();
int staffRequests=rs.getInt("count(*)");

query="select count(*) from courses";
stmt = con.createStatement();
rs = stmt.executeQuery(query);
rs.next();
int totalCourses=rs.getInt("count(*)");

%>




<h1>Welcome Admin</h1>
<hr>
<div class="row">
    <div class="col-lg-3 col-md-6">
        <div class="panel bg-warning">
            <div class="panel-heading">
                <div class="row text-white">
                    <div class="col-xs-3">
                        <i class="fa fa-user fa-5x" style="color:#6D7FCC"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                    <div class='h2'><%=totalStudents%></div>
                        <div>Students</div>
                    </div>
                </div>
            </div>
            <a href="viewStudents">
                <div class="panel-footer">
                    <span class="pull-left">View Students</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right" style="color:#6D7FCC"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel bg-success">
            <div class="panel-heading">
                <div class="row text-white">
                    <div class="col-xs-3">
                        <i class="fa fa-comments fa-5x" style="color:#6D7FCC"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                     <div class='h2'><%=studentRequests%></div>
                      <div>Student Requests</div>
                    </div>
                </div>
            </div>
            <a href="viewStudentRequests">
                <div class="panel-footer">
                    <span class="pull-left">View Student Requests</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right" style="color:#6D7FCC"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel bg-warning">
            <div class="panel-heading">
                <div class="row text-white">
                    <div class="col-xs-3">
                        <i class="fa fa-user fa-5x" style="color:#6D7FCC"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                    <div class='h2'><%=totalStaff%></div>
                        <div>Staff</div>
                    </div>
                </div>
            </div>
            <a href="viewStaff">
                <div class="panel-footer">
                    <span class="pull-left">View Staffs</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right" style="color:#6D7FCC"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel bg-danger">
            <div class="panel-heading">
                <div class="row text-white">
                    <div class="col-xs-3">
                        <i class="fa fa-comments fa-5x" style="color:#6D7FCC"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class='h2'><%=staffRequests%></div>
                         <div>Staff Requests</div>
                    </div>
                </div>
            </div>
            <a href="viewStaffRequests">
                <div class="panel-footer">
                    <span class="pull-left">View Staff Requests</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right" style="color:#6D7FCC"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel bg-danger">
            <div class="panel-heading">
                <div class="row text-white">
                    <div class="col-xs-3">
                        <i class="fa fa-list fa-5x" style="color:#6D7FCC"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class='h2'><%=totalCourses%></div>
                         <div>Courses</div>
                    </div>
                </div>
            </div>
            <a href="viewCourses">
                <div class="panel-footer">
                    <span class="pull-left">View Courses</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right" style="color:#6D7FCC"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
</div>
<%@ include file="admin_footer.jsp"%>
