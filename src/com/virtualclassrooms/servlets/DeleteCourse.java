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
 * Servlet implementation class DeleteCourse
 */
@WebServlet("/deleteCourse")
public class DeleteCourse extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int course_id=Integer.parseInt(request.getParameter("course_id"));
		new AdminDaoImpl().deleteCourse(course_id);
			RequestDispatcher rd = request.getRequestDispatcher("admin/view_courses.jsp");
			rd.forward(request, response);
	}

}
