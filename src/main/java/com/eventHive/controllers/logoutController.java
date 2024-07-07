package com.eventHive.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class logoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {			
			HttpSession session = request.getSession(false);
			if(session!=null) {
				session.removeAttribute("userSessionEmail");
			    session.removeAttribute("userSessionId");
			    session.removeAttribute("userSessionRole");
			}
		  	
			request.setAttribute("isSuccess", true);
			request.setAttribute("message", "Logged Out");
			RequestDispatcher dis = request.getRequestDispatcher("notification.jsp");
		    dis.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
