package com.eventHive.utils;

public class userUtils {
	
	public static boolean validateUser(String loginPassword, String storedPassword) {
		
		boolean isSuccess = false;
		
		try {
			if (loginPassword.equals(storedPassword)) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess; 
	}

}
