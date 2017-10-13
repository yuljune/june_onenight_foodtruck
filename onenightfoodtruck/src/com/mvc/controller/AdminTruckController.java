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


@WebServlet("/admintruck")
public class AdminTruckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdminTruckController() {
      
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TruckService service = new TruckService(request, response);
		ArrayList<TruckDTO> list = service.trucklist();
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("admintruck.jsp");
		dis.forward(request, response);
	}

}
