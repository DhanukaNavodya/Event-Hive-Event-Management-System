package com.eventHive.models;

import java.util.ArrayList;

public class inquiryModel {
	
	private int inquiryId;
	private int userId;
	private String inquiryTitle;
	private String inquiryBody;
	
	public inquiryModel(int inquiryId, int userId, String inquiryTitle, String inquiryBody) {
		super();
		this.inquiryId = inquiryId;
		this.userId = userId;
		this.inquiryTitle = inquiryTitle;
		this.inquiryBody = inquiryBody;
	}

	public int getInquiryId() {
		return inquiryId;
	}

	public void setInquiryId(int inquiryId) {
		this.inquiryId = inquiryId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getInquiryBody() {
		return inquiryBody;
	}

	public void setInquiryBody(String inquiryBody) {
		this.inquiryBody = inquiryBody;
	}

	

}
