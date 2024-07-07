package com.eventHive.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.eventHive.daos.userDao;
import com.eventHive.utils.userUtils;

public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userEmail = request.getParameter("login_email");
		String userPassword = (String)request.getParameter("login_password");
	
		boolean validLogin = userUtils.validateUser(userPassword, userDao.getUserPassword(userEmail));	
		
		if(validLogin) {
			int userId = userDao.getUserIdFromEmail(userEmail);
			String userRole = userDao.getUserRole(userEmail);
			
			HttpSession session = request.getSession(true);
			session.setAttribute("userSessionEmail", userEmail);
			session.setAttribute("userSessionId", userId);
			session.setAttribute("userSessionRole", userRole);
			
			request.setAttribute("isSuccess", true);
			request.setAttribute("message", "Logged In Successfully");
			RequestDispatcher dis = request.getRequestDispatcher("notification.jsp");
			dis.forward(request, response);
		}else {
			request.setAttribute("isSuccess", false);
			request.setAttribute("message", "Can't Login. Something Went Wrong");
			RequestDispatcher dis = request.getRequestDispatcher("notification.jsp");
			dis.forward(request, response);
		}
		
	}

}
