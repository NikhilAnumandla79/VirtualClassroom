package com.virtualclassrooms.servlets;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ViewStaff
 */
@WebServlet("/viewStaff")
public class ViewStaff extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("user").equals("admin")) {
			RequestDispatcher rd = request.getRequestDispatcher("admin/view_staff.jsp");
			rd.forward(request, response);
		}
		if(session.getAttribute("user").equals("teacher")) {
			RequestDispatcher rd = request.getRequestDispatcher("view_staff.jsp");
			rd.forward(request, response);
		}
	}

}
