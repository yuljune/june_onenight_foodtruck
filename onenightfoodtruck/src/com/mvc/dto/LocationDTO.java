package com.mvc.dto;

public class LocationDTO {
	private int trucknum;
	private double wido;
	private double gyoungdo;
	private String address;
	public int getTrucknum() {
		return trucknum;
	}
	public void setTrucknum(int trucknum) {
		this.trucknum = trucknum;
	}
	public double getWido() {
		return wido;
	}
	public void setWido(double wido) {
		this.wido = wido;
	}
	public double getGyoungdo() {
		return gyoungdo;
	}
	public void setGyoungdo(double gyoungdo) {
		this.gyoungdo = gyoungdo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
