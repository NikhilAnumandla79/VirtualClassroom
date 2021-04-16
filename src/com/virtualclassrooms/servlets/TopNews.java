package com.virtualclassrooms.servlets;

import java.io.IOException;
import java.util.List;

import com.virtualclassrooms.model.News;
import com.virtualclassrooms.services.NewsServicesImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/topnews")
public class TopNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<News> topnews=new NewsServicesImpl().getNews();

		request.setAttribute("topnews",topnews);
		HttpSession session = request.getSession();
		if(session.getAttribute("user").equals("admin")) {
			RequestDispatcher rd = request.getRequestDispatcher("admin/admin_news.jsp");
			rd.forward(request, response);
		}
		RequestDispatcher rd = request.getRequestDispatcher("news.jsp");
		rd.forward(request, response);
	}
}
