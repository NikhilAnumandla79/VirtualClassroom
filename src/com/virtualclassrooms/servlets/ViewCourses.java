package com.virtualclassrooms.servlets;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewCourses
 */
@WebServlet("/viewCourses")
public class ViewCourses extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			RequestDispatcher rd = request.getRequestDispatcher("admin/view_courses.jsp");
			rd.forward(request, response);
		
	}

}
