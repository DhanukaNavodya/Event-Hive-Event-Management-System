package com.eventHive.daos;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.eventHive.models.ticketModel;
import com.eventHive.utils.dbConnection;

public class ticketDao {
	
	private static Connection connection = null;
	private static PreparedStatement preparedStatement = null;
	private static ResultSet rs = null;
	static boolean isSuccess = false;
	static boolean isExist = false;
	
	//get the next available ticket id
	public static int getNextID() {
		int id = 0;
		try {
			connection = dbConnection.getConnection();
			
			String query = "SELECT ticketId FROM tickets ORDER BY ticketId DESC LIMIT 1";		
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
	
	public static boolean createTickets(int ticketId, int userId, int eventId, int noOfTickets,  BigDecimal totalAmount, String paymentType) {
		
	    try {
	    	connection = dbConnection.getConnection();
	    	
	    	String query = "INSERT INTO tickets (ticketId, userId, eventId, noOfTickets, totalAmount, paymentType) VALUES (?, ?, ?, ?, ?, ?)";
	    	preparedStatement = connection.prepareStatement(query);
	    	
            preparedStatement.setInt(1, ticketId);
            preparedStatement.setInt(2, userId);
            preparedStatement.setInt(3, eventId);
            preparedStatement.setInt(4, noOfTickets); 
            preparedStatement.setBigDecimal(5, totalAmount);
            preparedStatement.setString(6, paymentType);
 
	        int rowsInserted = preparedStatement.executeUpdate();

	        if (rowsInserted > 0) {
	            isSuccess = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // Close resources in reverse order of their creation
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
	
	public static int getTicketCountForEvent(String userId, String eventId) {
		
		int ticketCount = 0;;
	    
	    try {
	        connection = dbConnection.getConnection();
	        String query = "select sum(noOfTickets) from tickets where userId="+userId+"and eventId="+eventId;
	        preparedStatement = connection.prepareStatement(query);
	        rs = preparedStatement.executeQuery();
	        
	        while (rs.next()) {
	        	ticketCount = rs.getInt(1);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
		return ticketCount;
			   
	}
	
	public static ArrayList<ticketModel> getAllTicketDetails(String userId) {
		
		ArrayList<ticketModel> tickets = new ArrayList<>();
	    
	    try {
	        connection = dbConnection.getConnection();
	        String query = "select * from tickets where userId="+userId;
	        preparedStatement = connection.prepareStatement(query);
	        rs = preparedStatement.executeQuery();
	        
	        while (rs.next()) {
	        	int ticketId = rs.getInt(1);
	        	int userID = rs.getInt(2);
	        	int eventID = rs.getInt(3);
	        	float packagePrice = rs.getFloat(4);
	        	int noOfTickets = rs.getInt(5);

	            //ticketModel newTicket = new ticketModel(ticketId, userID, eventID, packagePrice, noOfTickets);
	            
	            //.add(newTicket);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
		return tickets;
			   
	}
	
	public static boolean deleteTicket(int ticketId) {
		try {
			connection = dbConnection.getConnection();
			String query = "delete from tickets where ticketId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, ticketId);
			
			int updatedRows = preparedStatement.executeUpdate();  
	        isSuccess = updatedRows > 0;
	        
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static boolean updateTicketCount(int ticketId, int noOfTickets) {
		try {
			connection = dbConnection.getConnection();
			String query = "update tickets set noOfTickets = ? where ticketId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, noOfTickets);
			preparedStatement.setInt(2, ticketId);
			
			int updatedRows = preparedStatement.executeUpdate();  
	        isSuccess = updatedRows > 0;
	        
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	

}
