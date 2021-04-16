package com.virtualclassrooms.servlets;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddCourseVideo
 */
@WebServlet("/addCourseVideo")
public class AddCourseVideo extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int course_id = Integer.parseInt(request.getParameter("course_id"));
		String course_name = (String)request.getParameter("course");
		request.setAttribute("course_id", course_id);
		request.setAttribute("course_name", course_name);
		RequestDispatcher rd = request.getRequestDispatcher("add_course_video.jsp");
		rd.forward(request, response);
	}

}
