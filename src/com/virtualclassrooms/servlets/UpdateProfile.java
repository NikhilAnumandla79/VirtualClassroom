package com.virtualclassrooms.servlets;

import java.io.IOException;

import com.virtualclassrooms.dao.StudentDaoImpl;
import com.virtualclassrooms.dao.TeacherDaoImpl;
import com.virtualclassrooms.model.Student;
import com.virtualclassrooms.model.Teacher;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateProfile
 */
@WebServlet("/updateProfile")
public class UpdateProfile extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		String user=(String) session.getAttribute("user");
		if(user.equals("student")) {
			
			Student student =(Student) session.getAttribute("student");
			int id=student.getId();
			String username=request.getParameter("username");
			String fullname=request.getParameter("fullname");
			String password=request.getParameter("password");
			String email=request.getParameter("email");
			new StudentDaoImpl().updateStudent(id,username,fullname,password,email);
			RequestDispatcher rd = request.getRequestDispatcher("logout");
			rd.forward(request, response);
			
		}
		if(user.equals("teacher")) {
			Teacher teacher =(Teacher) session.getAttribute("teacher");
			int id=teacher.getId();
			String username=request.getParameter("username");
			String fullname=request.getParameter("fullname");
			String password=request.getParameter("password");
			String email=request.getParameter("email");
			new TeacherDaoImpl().updateTeacher(id,username,fullname,password,email);
			RequestDispatcher rd = request.getRequestDispatcher("logout");
			rd.forward(request, response);
			
		}
	
	}

}
