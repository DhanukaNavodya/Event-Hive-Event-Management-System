<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    if (session.getAttribute("userSessionEmail") == null || session.getAttribute("userSessionId") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>

<%@ page import="jakarta.servlet.http.HttpServlet"%>

<%@ page import="com.eventHive.utils.dbConnection"%>
<%
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null; 
	PreparedStatement preparedStatement = null;
	
	String inquiryIdStr = request.getParameter("inquiryId");	
	int inquiryId = Integer.parseInt(inquiryIdStr);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>EventHive - Update Inquiry</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/inquiry.css" />
</head>
<body>

	<%@ include file="header.jsp" %>
	<%
		
	connection = dbConnection.getConnection();
	    statement = connection.createStatement();
	    String queryForInquiries = "select * from inquiries  where inquiryId = ?";
	    preparedStatement = connection.prepareStatement(queryForInquiries);
	    preparedStatement.setInt(1, inquiryId);
	    resultSet = preparedStatement.executeQuery();
		
	    while (resultSet.next()) {	
	%>

	<div class="inquiry-container">
		<div>
			<form method="post" action="inquiryController">
				<input type="text" placeholder="Title" value="<%= resultSet.getString(3) %>" class="inquiry-title" name="inquiryTitle">
				<textarea class="inquiry" name="inquiryBody"><%= resultSet.getString(4) %></textarea>
				<input type="submit" value="Submit" class="inquiry-submit-btn" name="inquiry-update-btn">
			</form>
		</div>
	</div>
	
	<% } %>	
	
	
	<%@ include file="footer.jsp" %>

	<script src="${pageContext.request.contextPath}/scripts/header.js"></script>

</body>
</html>