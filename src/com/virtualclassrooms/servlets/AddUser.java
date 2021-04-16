package com.virtualclassrooms.servlets;

import java.io.IOException;

import com.virtualclassrooms.model.Student;
import com.virtualclassrooms.model.Teacher;
import com.virtualclassrooms.services.StudentServices;
import com.virtualclassrooms.services.StudentServicesImpl;
import com.virtualclassrooms.services.TeacherServices;
import com.virtualclassrooms.services.TeacherServicesImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddUser
 */
@WebServlet("/addUser")
public class AddUser extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("admin/add_user.jsp");
		rd.forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String profession=request.getParameter("profession");
		if(profession.equals("student")) {
			String fullname=request.getParameter("fullname");
			String username=request.getParameter("username");
			String password=request.getParameter("pass");
			String email=request.getParameter("email");
			StudentServices ss=new StudentServicesImpl();
			Student student=ss.insertNewStudent(fullname, username, password,email);
			if(student!=null) {
				RequestDispatcher rd = request.getRequestDispatcher("admin/view_students.jsp");
				rd.forward(request, response);
			}
			
		}
		if(profession.equals("teacher")) {
			String fullname=request.getParameter("fullname");
			String username=request.getParameter("username");
			String password=request.getParameter("pass");
			String email=request.getParameter("email");
			TeacherServices ss=new TeacherServicesImpl();
			Teacher teacher=ss.insertNewTeacher(fullname, username, password,email);
			if(teacher!=null) {
				RequestDispatcher rd = request.getRequestDispatcher("admin/view_staff.jsp");
				rd.forward(request, response);
			}
		}
	}

}
