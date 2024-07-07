package com.eventHive.daos;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.eventHive.models.eventModel;
import com.eventHive.utils.dbConnection;

public class eventDao {
	
	private static Connection connection = null;
	private static PreparedStatement preparedStatement = null;
	private static ResultSet rs = null;
	private static Statement statement = null;
	private static ResultSet resultSet = null;
	private static String sql = null;
	private static int updatedRowCount;
	static boolean isSuccess = false;
	 
	public static int getNextID() {
		int id = 0;
		try {
			connection = dbConnection.getConnection();
			
			String query = "SELECT eventID FROM events ORDER BY eventID DESC LIMIT 1";		
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
	
	public static boolean createEvent(int eventID, String eventName, String eventOrganization, String eventLocation, String eventDistrict, String eventCategory, String eventStartTime, String eventEndTime, String eventStartDate, String eventEndDate, String eventType, String eventPayments, BigDecimal vipPackagePrice, BigDecimal premiumPackagePrice, BigDecimal standardPackagePrice, String eventRefundAvailable, String eventVisibility, String maxParticipants, String eventDescription,  String eventImage, int userID) {

	    try {
	    	connection = dbConnection.getConnection();
	    	
	    	String query = "INSERT INTO events (eventID, eventName, eventOrganization, eventLocation, eventDistrict, eventCategory, eventStartTime, eventEndTime, eventStartDate, eventEndDate, eventType, eventPayments, vipPackagePrice, premiumPackagePrice, standardPackagePrice, eventRefundAvailable, eventVisibility, maxParticipants, eventDescription, eventImage, userID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	    	preparedStatement = connection.prepareStatement(query);
	    	
	    	preparedStatement.setInt(1, eventID);
            preparedStatement.setString(2, eventName);
            preparedStatement.setString(3, eventOrganization);
            preparedStatement.setString(4, eventLocation);
            preparedStatement.setString(5, eventDistrict);
            preparedStatement.setString(6, eventCategory);
            preparedStatement.setString(7, eventStartTime);
            preparedStatement.setString(8, eventEndTime);
            preparedStatement.setString(9, eventStartDate);
            preparedStatement.setString(10, eventEndDate);
            preparedStatement.setString(11, eventType);
            preparedStatement.setString(12, eventPayments);         
            preparedStatement.setBigDecimal(13, vipPackagePrice);
            preparedStatement.setBigDecimal(14, premiumPackagePrice);
            preparedStatement.setBigDecimal(15, standardPackagePrice);    
            preparedStatement.setString(16, eventRefundAvailable);
            preparedStatement.setString(17, eventVisibility);
            preparedStatement.setString(18, maxParticipants);
            preparedStatement.setString(19, eventDescription);
            preparedStatement.setString(20, eventImage);
            preparedStatement.setInt(21, userID);
             

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
	
	public static eventModel getEventDetails(String eventID) {
		
		eventModel newEvent = null;
	    
	    try {
	        connection = dbConnection.getConnection();
	        statement = connection.createStatement();
	        String sql = "select * from event where id=" + eventID; // Assuming 'id' is the column name.
	        resultSet = statement.executeQuery(sql);

	        while (resultSet.next()) {
	            int eventId = resultSet.getInt(1);
	            String eventName = resultSet.getString(2);
	            String eventOrganization = resultSet.getString(3);
	            String eventVenue = resultSet.getString(4);
	            String eventDistrict = resultSet.getString(5);
	            String eventCategory = resultSet.getString(6);
	            String eventStartTime = resultSet.getString(7);
	            String eventEndTime = resultSet.getString(8);
	            String eventStartDate = resultSet.getString(9);
	            String eventEndDate = resultSet.getString(10);
	            String eventType = resultSet.getString(11);
	            String eventPaymentType = resultSet.getString(12);
	            String vipPackagePrice = resultSet.getString(13);
	            String premiumPackagePrice = resultSet.getString(14);
	            String standardPackagePrice = resultSet.getString(15);
	            String eventRefundAvailable = resultSet.getString(8);
	            String eventVisibility = resultSet.getString(9);
	            String maxParticipants = resultSet.getString(10);
	            String eventDescription = resultSet.getString(11);
	            String eventImage = resultSet.getString(12);

	            newEvent = new eventModel(eventId, eventName, eventOrganization, eventVenue, eventDistrict, eventCategory, eventStartTime, eventEndTime, eventStartDate, eventEndDate, eventType, eventPaymentType, vipPackagePrice, premiumPackagePrice, standardPackagePrice, eventRefundAvailable, eventVisibility, maxParticipants, eventDescription, eventImage, eventId);

	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
		return newEvent;   
	}
	
	public static ArrayList<eventModel> getAllEvents() {
		
		ArrayList<eventModel> events = new ArrayList<>();
	    
	    try {
	        connection = dbConnection.getConnection();
	        statement = connection.createStatement();
	        String sql = "select * from events";
	        resultSet = statement.executeQuery(sql);

	        while (resultSet.next()) {
	            int eventID = resultSet.getInt("eventId");
	            String eventName = resultSet.getString("eventName");
	            String eventOrganization = resultSet.getString("eventOrganization");
	            String eventLocation = resultSet.getString("eventLocation");
	            String eventDistrict = resultSet.getString("eventDistrict");
	            String eventCategory = resultSet.getString("eventCategory");
	            String eventStartTime = resultSet.getString("eventStartTime");
	            String eventEndTime = resultSet.getString("eventEndTime");
	            String eventStartDate = resultSet.getString("eventStartDate");
	            String eventEndDate = resultSet.getString("eventEndDate");
	            String eventType = resultSet.getString("eventType");
	            String eventPayments = resultSet.getString("eventPayments");
	            String vipPackagePrice = resultSet.getString("vipPackagePrice");
	            String premiumPackagePrice = resultSet.getString("premiumPackagePrice");
	            String standardPackagePrice = resultSet.getString("standardPackagePrice");
	            String eventRefundAvailable = resultSet.getString("eventRefundAvailable");
	            String eventVisibility = resultSet.getString("eventVisibility");
	            String maxParticipants = resultSet.getString("maxParticipants");
	            String eventDescription = resultSet.getString("eventDescription");
	            String eventImage = resultSet.getString("eventImage");
	            int userID = resultSet.getInt("userId");

	            eventModel newEvent = new eventModel (eventID, eventName, eventOrganization, eventLocation, eventDistrict, eventCategory, 
	        			eventStartTime, eventEndTime, eventStartDate, eventEndDate, eventType, eventPayments, 
	        			vipPackagePrice, premiumPackagePrice, standardPackagePrice, eventRefundAvailable, eventVisibility,
	        			maxParticipants, eventDescription, eventImage, userID);

	            events.add(newEvent);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
		return events;   
	}

	public static boolean updateEventName(int eventID, String eventName) {
	    
	    try {
	        connection = dbConnection.getConnection();
	        
	        String query = "UPDATE events SET eventName = ? WHERE eventId = ?";
	        preparedStatement = connection.prepareStatement(query);
	        
	        preparedStatement.setString(1, eventName);
	        preparedStatement.setInt(2, eventID);
	        
	        int updatedRows = preparedStatement.executeUpdate();
	        isSuccess = updatedRows > 0;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	    
	}
	
	public static boolean updateEventOrganization(int eventID, String eventOrganization) {
	    
	    try {
	        connection = dbConnection.getConnection();
	        
	        String query = "UPDATE events SET eventOrganization = ? WHERE eventId = ?";
	        preparedStatement = connection.prepareStatement(query);
	        
	        preparedStatement.setString(1, eventOrganization);
	        preparedStatement.setInt(2, eventID);
	        
	        int updatedRows = preparedStatement.executeUpdate();
	        isSuccess = updatedRows > 0;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	    
	}
	
	public static boolean updateEventLocation(int eventID, String eventLocation) {
	    
	    try {
	        connection = dbConnection.getConnection();
	        
	        String query = "UPDATE events SET eventLocation = ? WHERE eventId = ?";
	        preparedStatement = connection.prepareStatement(query);
	        
	        preparedStatement.setString(1, eventLocation);
	        preparedStatement.setInt(2, eventID);
	        
	        int updatedRows = preparedStatement.executeUpdate();
	        isSuccess = updatedRows > 0;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	   
	}
	
	public static boolean updateEventDistrict(int eventID, String eventDistrict) {
	    
	    try {
	        connection = dbConnection.getConnection();
	        
	        String query = "UPDATE events SET eventDistrict = ? WHERE eventId = ?";
	        preparedStatement = connection.prepareStatement(query);
	        
	        preparedStatement.setString(1, eventDistrict);
	        preparedStatement.setInt(2, eventID);
	        
	        int updatedRows = preparedStatement.executeUpdate();
	        isSuccess = updatedRows > 0;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	    
	}
	
	public static boolean updateEventCategory(int eventID, String eventCategory) {
	    
	    try {
	        connection = dbConnection.getConnection();
	        
	        String query = "UPDATE events SET eventCategory = ? WHERE eventId = ?";
	        preparedStatement = connection.prepareStatement(query);
	        
	        preparedStatement.setString(1, eventCategory);
	        preparedStatement.setInt(2, eventID);
	        
	        int updatedRows = preparedStatement.executeUpdate();
	        isSuccess = updatedRows > 0;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	    
	}
	
	public static boolean updateEventStartTime(int eventID, String eventStartTime) {
	    
	    try {
	        connection = dbConnection.getConnection();
	        
	        String query = "UPDATE events SET eventStartTime = ? WHERE eventId = ?";
	        preparedStatement = connection.prepareStatement(query);
	        
	        preparedStatement.setString(1, eventStartTime);
	        preparedStatement.setInt(2, eventID);
	        
	        int updatedRows = preparedStatement.executeUpdate();
	        isSuccess = updatedRows > 0;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	    
	}
	
	public static boolean updateEventEndTime(int eventID, String eventEndTime) {
	    
	    try {
	        connection = dbConnection.getConnection();
	        
	        String query = "UPDATE events SET eventEndTime = ? WHERE eventId = ?";
	        preparedStatement = connection.prepareStatement(query);
	        
	        preparedStatement.setString(1, eventEndTime);
	        preparedStatement.setInt(2, eventID);
	        
	        int updatedRows = preparedStatement.executeUpdate();
	        isSuccess = updatedRows > 0;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	    
	}
	
	public static boolean updateEventStartDate(int eventID, String eventStartDate) {
	    
	    try {
	        connection = dbConnection.getConnection();
	        
	        String query = "UPDATE events SET eventStartDate = ? WHERE eventId = ?";
	        preparedStatement = connection.prepareStatement(query);
	        
	        preparedStatement.setString(1, eventStartDate);
	        preparedStatement.setInt(2, eventID);
	        
	        int updatedRows = preparedStatement.executeUpdate();
	        isSuccess = updatedRows > 0;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	    
	}
	
	public static boolean updateEventEndDate(int eventID, String eventEndDate) {
	    
	    try {
	        connection = dbConnection.getConnection();
	        
	        String query = "UPDATE events SET eventEndDate = ? WHERE eventId = ?";
	        preparedStatement = connection.prepareStatement(query);
	        
	        preparedStatement.setString(1, eventEndDate);
	        preparedStatement.setInt(2, eventID);
	        
	        int updatedRows = preparedStatement.executeUpdate();
	        isSuccess = updatedRows > 0;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	    
	}
	
	public static boolean updateEventImage(int eventID, String eventImage) {
	    
	    try {
	        connection = dbConnection.getConnection();
	        
	        String query = "UPDATE events SET eventImage = ? WHERE eventId = ?";
	        preparedStatement = connection.prepareStatement(query);
	        
	        preparedStatement.setString(1, eventImage);
	        preparedStatement.setInt(2, eventID);
	        
	        int updatedRows = preparedStatement.executeUpdate();
	        isSuccess = updatedRows > 0;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	    
	}

	public static boolean  deleteEvent(int eventID) {
		
	    try {
	        connection = dbConnection.getConnection();
	        
	        String query = "DELETE FROM events WHERE eventId = ?";
	        preparedStatement = connection.prepareStatement(query);
	        
	        preparedStatement.setInt(1, eventID);
	        
	        int updatedRows = preparedStatement.executeUpdate();  
	        isSuccess = updatedRows > 0;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		return isSuccess;
	    
	}

	

}

