package com.virtualclassrooms.servlets;

import java.io.IOException;

import com.virtualclassrooms.dao.TeacherDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateMarks
 */
@WebServlet("/updateMarks")
public class UpdateMarks extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int student_marks=Integer.parseInt(request.getParameter("student_marks"));
		int course_id =(Integer)Integer.parseInt(request.getParameter("course_id"));
		String course_name=(String)request.getParameter("course_name");
		int student_id =(Integer)Integer.parseInt(request.getParameter("student_id"));

		new TeacherDaoImpl().updateStudentMarks(student_id, student_marks,course_id);
		response.sendRedirect("viewCourseStudents?course_id="+course_id+"&course="+course_name);

	}

}
