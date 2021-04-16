package com.virtualclassrooms.servlets;

import java.io.IOException;

import com.virtualclassrooms.dao.StudentDaoImpl;
import com.virtualclassrooms.dao.TeacherDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/requestCourse")
public class RequestCourse extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int course_id=Integer.parseInt(request.getParameter("course_id"));
		if(request.getParameter("user").equals("student")) {
			int student_id=Integer.parseInt(request.getParameter("student_id"));
			new StudentDaoImpl().insertRequest(course_id,student_id);
			response.sendRedirect("request_course.jsp?requested=true");
		}
		if(request.getParameter("user").equals("teacher")) {
			int teacher_id=Integer.parseInt(request.getParameter("teacher_id"));
			new TeacherDaoImpl().insertRequest(course_id,teacher_id);
			response.sendRedirect("request_course.jsp?requested=true");
		}
		
		
	}

}
