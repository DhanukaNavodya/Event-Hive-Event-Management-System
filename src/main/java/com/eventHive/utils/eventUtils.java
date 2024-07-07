package com.eventHive.utils;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.http.Part;

public class eventUtils {
	
	public static boolean saveImageToFolder(Part part, String fileName) throws IOException {
		
		boolean isSuccess = false;
        String path = "E:/Projects/Java Web Applications/EventHive_Project/src/main/webapp/assets/eventBanners/" + fileName;
        File file = new File(path);
        
        try {
            part.write(path);
            isSuccess = true;
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return isSuccess;
    }
	
	

}
