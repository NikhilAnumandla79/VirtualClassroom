package com.virtualclassrooms.servlets;

import java.io.IOException;

import com.virtualclassrooms.model.Student;
import com.virtualclassrooms.model.Teacher;
import com.virtualclassrooms.services.StudentServices;
import com.virtualclassrooms.services.StudentServicesImpl;
import com.virtualclassrooms.services.TeacherServices;
import com.virtualclassrooms.services.TeacherServicesImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class Register extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String user=req.getParameter("profession");
		HttpSession session = req.getSession();
		String stud="student";
		if(user.equals(stud)) {
			String fullname=req.getParameter("fullname");
			String username=req.getParameter("username");
			String password=req.getParameter("pass");
			String email=req.getParameter("email");
			StudentServices ss=new StudentServicesImpl();
			Student student=ss.insertNewStudent(fullname, username, password,email);
			if(student!=null) {
				session.setAttribute(stud,student);
				session.setAttribute("user",stud);
				RequestDispatcher rd = req.getRequestDispatcher("home.jsp");
				rd.forward(req, res);
			}
			
		}else {
			String fullname=req.getParameter("fullname");
			String username=req.getParameter("username");
			String password=req.getParameter("pass");
			String email=req.getParameter("email");
			TeacherServices ss=new TeacherServicesImpl();
			Teacher teacher=ss.insertNewTeacher(fullname, username, password,email);
			if(teacher!=null) {
				session.setAttribute("teacher",teacher);
				session.setAttribute("user","teacher");
				RequestDispatcher rd = req.getRequestDispatcher("home.jsp");
				rd.forward(req, res);
			}
		}
	}
}
 