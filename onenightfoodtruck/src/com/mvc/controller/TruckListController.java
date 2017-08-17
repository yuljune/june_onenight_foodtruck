package com.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.mvc.dto.TruckDTO;
import com.mvc.service.TruckService;


@WebServlet("/trucklist")
public class TruckListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public TruckListController() {
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id  = request.getParameter("truckinfo");
		System.out.println(id);
		
		TruckService service = new TruckService(request, response);
		ArrayList<TruckDTO> list = service.trucklist(id);
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("trucklist.jsp");
		dis.forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id  = request.getParameter("truckinfo");
		System.out.println(id);
		
		TruckService service = new TruckService(request, response);
		ArrayList<TruckDTO> list = service.trucklist(id);
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("trucklist.jsp");
		dis.forward(request, response);
	}

}
