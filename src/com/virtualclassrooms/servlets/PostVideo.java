package com.virtualclassrooms.servlets;

import java.io.IOException;

import com.virtualclassrooms.dao.AdminDaoImpl;
import com.virtualclassrooms.model.Teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class PostVideo
 */
@WebServlet("/postVideo")
public class PostVideo extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title=(String)request.getParameter("title");
		String filepath="videos/"+(String)request.getParameter("filepath");
		HttpSession session = request.getSession();
		String user = (String)session.getAttribute("user");
		if(user.equals("admin")) {
			int course_id = Integer.parseInt(request.getParameter("course_id"));
			
			new AdminDaoImpl().addVideo(course_id,filepath,"admin",title);
			response.sendRedirect("viewVideos");
		}
		if(user.equals("teacher")) {
			int course_id = Integer.parseInt(request.getParameter("course_id"));
			Teacher teacher =(Teacher)session.getAttribute("teacher");
			String course_name=(String)request.getParameter("course_name");
			new AdminDaoImpl().addVideo(course_id,filepath,teacher.getFullname(),title);
			response.sendRedirect("viewCourseVideos?course_id="+course_id+"&course="+course_name);
		}
		
	}

}
