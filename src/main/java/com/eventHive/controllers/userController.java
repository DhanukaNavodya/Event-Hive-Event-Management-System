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

public class userController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userSessionId");
		
		String curPassword = (String)request.getParameter("cur_password");
		String userPassword = (String)request.getParameter("new_password");
		
		if((request.getParameter("reset-password") != null)) {
			System.out.println("pwsw");
			String userEmail = userDao.getUserEmailFromId(userId);
			String userCurPassword = userDao.getUserPassword(userEmail);
			if(curPassword.equals(userCurPassword)) {
				System.out.println("inif");
				if(userDao.updateUserPassword(userId, userPassword)) {
					request.setAttribute("isSuccess", true);
					request.setAttribute("message", "Password Updated Successfully");
					RequestDispatcher dis = request.getRequestDispatcher("notification.jsp");
					dis.forward(request, response);
				}
			}else {
				request.setAttribute("isSuccess", false);
				request.setAttribute("message", "Can't Update The Password. Please Try Again");
				RequestDispatcher dis = request.getRequestDispatcher("notification.jsp");
				dis.forward(request, response);
			}
			
		}
		
		
	}

}
