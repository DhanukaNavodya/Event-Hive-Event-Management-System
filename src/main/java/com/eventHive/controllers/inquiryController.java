package com.eventHive.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.eventHive.daos.inquiryDao;

public class inquiryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	boolean isSuccess;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("userSessionId");
		
		int inquiryId = 0;
		String inquiryIdStr = request.getParameter("inquiryId");
		if(inquiryIdStr != null && !inquiryIdStr.isEmpty()) {
			inquiryId = Integer.parseInt(inquiryIdStr);
		}
		
		String inquiryTitle = request.getParameter("inquiryTitle");
		String inquiryBody = request.getParameter("inquiryBody");
		
		if(request.getParameter("inquiry-submit-btn")!=null) {
			
			isSuccess = inquiryDao.createInquiry(inquiryDao.getNextID(), userId, inquiryTitle, inquiryBody);
			
			if(isSuccess) {
				request.setAttribute("isSuccess", true);
				request.setAttribute("message", "Inquiry Created Successfully");
				RequestDispatcher dis = request.getRequestDispatcher("notification.jsp");
				dis.forward(request, response);
			}else {
				request.setAttribute("isSuccess", false);
				request.setAttribute("message", "Can't Create Inquiry");
				RequestDispatcher dis = request.getRequestDispatcher("notification.jsp");
				dis.forward(request, response);
			}
		}else if(request.getParameter("inquiry-update-btn")!=null) {
			
			isSuccess = inquiryDao.updateInquiry(inquiryId, inquiryTitle, inquiryBody);
			
			if(isSuccess) {
				request.setAttribute("isSuccess", true);
				request.setAttribute("message", "Inquiry Updated Successfully");
				RequestDispatcher dis = request.getRequestDispatcher("notification.jsp");
				dis.forward(request, response);
			}else {
				request.setAttribute("isSuccess", false);
				request.setAttribute("message", "Can't Update Inquiry");
				RequestDispatcher dis = request.getRequestDispatcher("notification.jsp");
				dis.forward(request, response);
			}
		}else if(request.getParameter("inquiry-delete-btn")!=null) {
			
			isSuccess = inquiryDao.deleteInquiry(inquiryId);
			
			if(isSuccess) {
				request.setAttribute("isSuccess", true);
				request.setAttribute("message", "Inquiry Deletd Successfully");
				RequestDispatcher dis = request.getRequestDispatcher("notification.jsp");
				dis.forward(request, response);
			}else {
				request.setAttribute("isSuccess", false);
				request.setAttribute("message", "Can't Delete Inquiry");
				RequestDispatcher dis = request.getRequestDispatcher("notification.jsp");
				dis.forward(request, response);
			}
		}
		
	}

}
