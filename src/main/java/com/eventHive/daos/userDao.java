package com.eventHive.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.eventHive.utils.dbConnection;
 
public class userDao {
	
	private static Connection connection = null;
	private static PreparedStatement preparedStatement = null;
	private static ResultSet rs = null;
	static boolean isSuccess = false;
	static boolean isExist = false;

	//return a user's password based on email(for login)
	public static String getUserPassword(String userEmail) {
		System.out.println("gpw");
	    String userPassword = null;
	    
	    try {
	    	connection = dbConnection.getConnection();
	        
	        String query = "SELECT userPassword FROM users WHERE userEmail = ?";
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setString(1, userEmail);
	        rs = preparedStatement.executeQuery();
	        if (rs.next()) {
	            userPassword = rs.getString("userPassword");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // Close resources in reverse order of their creation
	        try {
	            if (rs != null) {
	                rs.close();
	            }
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
	    return userPassword;
	}
	
	public static String getUserRole(String userEmail) {
		
	    String userRole = null;
	    
	    try {
	    	connection = dbConnection.getConnection();
	        
	        String query = "SELECT userRole FROM users WHERE userEmail = ?";
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setString(1, userEmail);
	        rs = preparedStatement.executeQuery();
	        if (rs.next()) {
	        	userRole = rs.getString("userRole");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // Close resources in reverse order of their creation
	        try {
	            if (rs != null) {
	                rs.close();
	            }
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
	    return userRole;
	}
	
	//get the next available user id
	public static int getNextID() {
		int id = 0;
		try {
			connection = dbConnection.getConnection();
			
			String query = "SELECT userId FROM users ORDER BY userId DESC LIMIT 1";		
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

	//check whether email already exits entered by user in registration
	public static boolean checkEmailExist(String userEmail) {
		
	    try {
	    	connection = dbConnection.getConnection();
	        
	        String query = "SELECT * FROM users WHERE userEmail = ?";
	        
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setString(1, userEmail);
	        rs = preparedStatement.executeQuery();
	        
	        if (rs.next()) {
	        	isExist = true;;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // Close resources in reverse order of their creation
	        try {
	            if (rs != null) {
	                rs.close();
	            }
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
		
		return isExist;
	}
	
	//user registration function
	public static boolean createUserRecord(int userId, String userName, String userEmail, String userPassword) {
		
	    try {
	    	connection = dbConnection.getConnection();
	    	
	        String query = "INSERT INTO users (userId, userName, userEmail, userPassword) VALUES (?, ?, ?, ?)";
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setInt(1, userId);
	        preparedStatement.setString(2, userName);
	        preparedStatement.setString(3, userEmail);
	        preparedStatement.setString(4, userPassword);

	        int rowsInserted = preparedStatement.executeUpdate();

	        isSuccess = rowsInserted > 0;
	        
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
	
	//function for admin to add users
	public static boolean addUserRecord(int userId, String userName, String userEmail, String userPassword, String userRole) {
		
	    try {
	    	connection = dbConnection.getConnection();
	    	
	        String query = "INSERT INTO users (userId, userName, userEmail, userPassword, userRole) VALUES (?, ?, ?, ?, ?)";
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setInt(1, userId);
	        preparedStatement.setString(2, userName);
	        preparedStatement.setString(3, userEmail);
	        preparedStatement.setString(4, userPassword);
	        preparedStatement.setString(5, userRole);

	        int rowsInserted = preparedStatement.executeUpdate();

	        isSuccess = rowsInserted > 0;
	        
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
	public static int getUserIdFromName(String userName) {
		
		int userId = 0;
	    
	    try {
	    	connection = dbConnection.getConnection();
	        
	        String query = "SELECT userId FROM users WHERE userName = ?";
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setString(1, userName);
	        rs = preparedStatement.executeQuery();
	        if (rs.next()) {
	        	userId = rs.getInt("userId");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // Close resources in reverse order of their creation
	        try {
	            if (rs != null) {
	                rs.close();
	            }
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
	    return userId;
	    
	}
	public static int getUserIdFromEmail(String userEmail) {
		int userId = 0;
	    
	    try {
	    	connection = dbConnection.getConnection();
	        
	        String query = "SELECT userId FROM users WHERE userEmail = ?";
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setString(1, userEmail);
	        rs = preparedStatement.executeQuery();
	        if (rs.next()) {
	        	userId = rs.getInt("userId");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // Close resources in reverse order of their creation
	        try {
	            if (rs != null) {
	                rs.close();
	            }
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
	    return userId;
	    
	}
	public static String getUserEmailFromId(int userId) {
	    System.out.println("em");
	    String userEmail = "";
	    
	    try {
	        connection = dbConnection.getConnection();
	        
	        String query = "SELECT userEmail FROM users WHERE userId = ?";
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setInt(1, userId);
	        rs = preparedStatement.executeQuery();
	        if (rs.next()) {
	            userEmail = rs.getString("userEmail"); // Assign the retrieved email to userEmail
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // Close resources in reverse order of their creation
	        try {
	            if (rs != null) {
	                rs.close();
	            }
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
	    return userEmail;
	}

	//delete user function for admin
	public static boolean deleteUser(int userID) {
		
	    try {
	        connection = dbConnection.getConnection();
	        
	        String query = "DELETE FROM users WHERE userId = ?";
	        preparedStatement = connection.prepareStatement(query);       
	        preparedStatement.setInt(1, userID);
	        
	        int updatedRows = preparedStatement.executeUpdate();  
	        isSuccess = updatedRows > 0;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	    
	}
	
	public static boolean updateUserRole(int userID, String userRole) {
		
	    try {
	        connection = dbConnection.getConnection();
	        
	        String query = "update users set userRole = ? WHERE userId = ?";
	        preparedStatement = connection.prepareStatement(query);

	        preparedStatement.setString(1, userRole); // Set the userRole first
	        preparedStatement.setInt(2, userID);     // Set the userID second

	        
	        int updatedRows = preparedStatement.executeUpdate();  
	        isSuccess = updatedRows > 0;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	    
	}
	
	public static boolean updateUserPassword(int userID, String userPassword) {
		System.out.println("pw");
	    try {
	        connection = dbConnection.getConnection();
	        
	        String query = "update users set userPassword = ? WHERE userId = ?";
	        preparedStatement = connection.prepareStatement(query);

	        preparedStatement.setString(1, userPassword); // Set the userRole first
	        preparedStatement.setInt(2, userID);     // Set the userID second

	        
	        int updatedRows = preparedStatement.executeUpdate();  
	        isSuccess = updatedRows > 0;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	    
	}

}
