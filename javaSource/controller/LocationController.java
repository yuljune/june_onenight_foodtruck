package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.TruckDAO;


@WebServlet("/location")
public class LocationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public LocationController() {
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lng =  Double.parseDouble(request.getParameter("lng"));
		String trucknum = request.getParameter("trucknum");
		String id = request.getParameter("user_id");
		System.out.println(lat+"/"+lng+"/"+trucknum+"/"+id);
		
		
		String msg = "";
		
		TruckDAO dao = new TruckDAO();
		
		if(dao.addlocation(lat, lng, trucknum) == 1){
			msg = "등록에 성공 하였습니다";
		}else{
			msg = "등록에 실패 하였습니다.";
		}
		
		request.setAttribute("result", msg);
		RequestDispatcher dis = request.getRequestDispatcher("trucklist?truckinfo="+id);
		dis.forward(request, response);
	}

}
