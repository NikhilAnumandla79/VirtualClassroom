package com.virtualclassrooms.servlets;

import java.io.IOException;

import com.virtualclassrooms.dao.StudentStaffDaoImpl;
import com.virtualclassrooms.model.Student;
import com.virtualclassrooms.model.Teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class PostQuestion
 */
@WebServlet("/postQuestion")
public class PostQuestion extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String question = request.getParameter("question");
		String course_name =(String) request.getParameter("course_name");
		int course_id = Integer.parseInt(request.getParameter("course_id"));
		HttpSession session = request.getSession();
		String user = (String)session.getAttribute("user");
		if(user.equals("student")) {
			Student student =(Student) session.getAttribute("student");
			new StudentStaffDaoImpl().postQuestion(question,student.getFullname(),course_id);
			response.sendRedirect("courseChat?course_id="+course_id+"&course="+course_name);
		}
		if(user.equals("teacher")) {
			Teacher teacher =(Teacher) session.getAttribute("teacher");
			new StudentStaffDaoImpl().postQuestion(question,teacher.getFullname(),course_id);
			response.sendRedirect("courseChat?course_id="+course_id+"&course="+course_name);
		}
	}

}
