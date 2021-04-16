package com.virtualclassrooms.servlets;

import java.io.IOException;

import com.virtualclassrooms.dao.AdminDaoImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ApproveUser
 */
@WebServlet("/approveUser")
public class ApproveUser extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user= request.getParameter("user");
		
		if(user.equals("student")) {
			int course_id= Integer.parseInt(request.getParameter("course_id"));
			int student_id= Integer.parseInt(request.getParameter("student_id"));
			new AdminDaoImpl().approveStudent(course_id,student_id);
			RequestDispatcher rd = request.getRequestDispatcher("admin/approve_students.jsp");
			rd.forward(request, response);
		}
		if(user.equals("teacher")) {
			int course_id= Integer.parseInt(request.getParameter("course_id"));
			int teacher_id= Integer.parseInt(request.getParameter("teacher_id"));
			new AdminDaoImpl().approveTeacher(course_id,teacher_id);
			RequestDispatcher rd = request.getRequestDispatcher("admin/approve_staff.jsp");
			rd.forward(request, response);
		}
		
		
		
	
	}
}
