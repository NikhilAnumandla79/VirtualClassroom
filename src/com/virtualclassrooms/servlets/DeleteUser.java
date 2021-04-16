package com.virtualclassrooms.servlets;

import java.io.IOException;

import com.virtualclassrooms.dao.StudentDaoImpl;
import com.virtualclassrooms.dao.TeacherDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("user");
		if(user.equals("student")) {
			int id=Integer.parseInt(request.getParameter("student_id"));
			new StudentDaoImpl().deleteStudent(id);
			request.getRequestDispatcher("admin/view_students.jsp").forward(request, response);
			
			
		}else {
			int id=Integer.parseInt(request.getParameter("teacher_id"));
			new TeacherDaoImpl().deleteStudent(id);
			request.getRequestDispatcher("admin/view_staff.jsp").forward(request, response);
			
		}
		

	}
}
