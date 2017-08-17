package com.mvc.dto;

public class ReviewDTO {
	private int revidx;
	private double starpoint;
	private String content;
	private int trucknum;
	private String user_id;
	
	public int getRevidx() {
		return revidx;
	}
	public void setRevidx(int revidx) {
		this.revidx = revidx;
	}
	public double getStarpoint() {
		return starpoint;
	}
	public void setStarpoint(double starpoint) {
		this.starpoint = starpoint;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getTrucknum() {
		return trucknum;
	}
	public void setTrucknum(int trucknum) {
		this.trucknum = trucknum;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
