package com.virtualclassrooms.servlets;

import java.io.IOException;

import com.virtualclassrooms.dao.AdminDaoImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddCourse")
public class AddCourse extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String course=request.getParameter("course_name");
		new AdminDaoImpl().insertCourse(course);
			RequestDispatcher rd = request.getRequestDispatcher("admin/view_courses.jsp");
			rd.forward(request, response);
		
	}

}
