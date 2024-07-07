package com.eventHive.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.eventHive.models.inquiryModel;
import com.eventHive.models.ticketModel;
import com.eventHive.utils.dbConnection;

public class inquiryDao {
	
	private static Connection connection = null;
	private static PreparedStatement preparedStatement = null;
	private static ResultSet rs = null;
	static boolean isSuccess = false;
	static boolean isExist = false;
	
	public static int getNextID() {
		int id = 0;
		try {
			connection = dbConnection.getConnection();
			
			String query = "SELECT inquiryId FROM inquiries ORDER BY inquiryId DESC LIMIT 1";		
			preparedStatement = connection.prepareStatement(query);
	        rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				id = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return id+1;
	}	
	
	public static boolean createInquiry(int inquiryId, int userId, String inquiryTitle, String inquiryBody) {
		
	    try {
	    	connection = dbConnection.getConnection();
	    	
	    	String query = "INSERT INTO inquiries (inquiryId, userId, inquiryTitle, inquiryBody) VALUES (?, ?, ?, ?)";
	    	preparedStatement = connection.prepareStatement(query);
	    	
            preparedStatement.setInt(1, inquiryId);
            preparedStatement.setInt(2, userId);
            preparedStatement.setString(3, inquiryTitle);
            preparedStatement.setString(4, inquiryBody); 
 
	        int rowsInserted = preparedStatement.executeUpdate();

	        if (rowsInserted > 0) {
	            isSuccess = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (preparedStatement != null) {
	                preparedStatement.close();
	            }
	            if (connection != null) {
	            	connection.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return isSuccess;
	}
	
	public static boolean updateInquiry(int inquiryId, String inquiryTitle, String inquiryBody) {
		try {
			connection = dbConnection.getConnection();
			String query = "update inquiries set inquiryTitle = ? and inquiryBody = ? where inquiryId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, inquiryTitle);
			preparedStatement.setString(2, inquiryBody);
			preparedStatement.setInt(3, inquiryId);
			
			int updatedRows = preparedStatement.executeUpdate();  
	        isSuccess = updatedRows > 0;
	        
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static boolean deleteInquiry(int inquiryId) {
		try {
			connection = dbConnection.getConnection();
			String query = "delete from inquiries where inquiryId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, inquiryId);
			
			int updatedRows = preparedStatement.executeUpdate();  
	        isSuccess = updatedRows > 0;
	        
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static ArrayList<inquiryModel> getAllInquiryDetails(String userId) {
		
		ArrayList<inquiryModel> inquiries = new ArrayList<>();
	    
	    try {
	        connection = dbConnection.getConnection();
	        String query = "select * from inquiries where userId="+userId;
	        preparedStatement = connection.prepareStatement(query);
	        rs = preparedStatement.executeQuery();
	        
	        while (rs.next()) {
	        	int inquiryId = rs.getInt(1);
	        	int userID = rs.getInt(2);
	        	String inquiryTitle = rs.getString(3);
	        	String inquiryBody = rs.getString(4);

	        	inquiryModel newinquiry = new inquiryModel(inquiryId, userID, inquiryTitle, inquiryBody);
	            
	        	inquiries.add(newinquiry);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
		return inquiries;
			   
	}

}
