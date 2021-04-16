package com.virtualclassrooms.servlets;

import java.io.IOException;

import com.virtualclassrooms.dao.StudentStaffDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@WebServlet("/postAnswer")
public class PostAnswer extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String responder=(String)request.getParameter("responder");
		int question_id = Integer.parseInt(request.getParameter("question_id"));
		String reply=request.getParameter("reply");

		String course_name =(String) request.getParameter("course_name");
		int course_id = Integer.parseInt(request.getParameter("course_id"));
		
		new StudentStaffDaoImpl().postAnswer(reply,question_id,responder);
		
		HttpSession session = request.getSession();
		String user =(String) session.getAttribute("user");
		if(user.equals("admin")) {
			response.sendRedirect("qandA");
		}else {
			response.sendRedirect("courseChat?course_id="+course_id+"&course="+course_name);
		}
		
		
	}
}
