package com.eventHive.models;

public class ticketModel {
	
	private int ticketId;
	private int userId;
	private int eventId;
	private float packagePrice;
	private int noOfTickets;
	private String paymentType;
	private float totalAmount;
	
	public ticketModel(int ticketId, int userId, int eventId, float packagePrice, int noOfTickets, String paymentType, float totalAmount) {
		this.ticketId = ticketId;
		this.userId = userId;
		this.eventId = eventId;
		this.packagePrice = packagePrice;
		this.noOfTickets = noOfTickets;
		this.paymentType = paymentType;
		this.totalAmount = totalAmount;
	}
	
	public float getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public int getTicketId() {
		return ticketId;
	}
	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public float getPackagePrice() {
		return packagePrice;
	}
	public void setPackagePrice(float packagePrice) {
		this.packagePrice = packagePrice;
	}
	public int getNoOfTickets() {
		return noOfTickets;
	}
	public void setNoOfTickets(int noOfTickets) {
		this.noOfTickets = noOfTickets;
	}
	
}
