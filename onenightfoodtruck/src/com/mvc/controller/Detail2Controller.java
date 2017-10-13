package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dto.MemberDTO;
import com.mvc.dto.TruckDTO;
import com.mvc.service.MemberService;
import com.mvc.service.TruckService;

@WebServlet("/detail2")
public class Detail2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
		proccess(request,response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		proccess(request,response);
		
	}

	private void proccess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
	
		String id = request.getParameter("trucknum");
		String page = "";
		
		TruckService service = new TruckService(request, response);
		TruckDTO dto = service.detail2(id);
		
		if(dto != null){
			page="detail2.jsp";
		}
		request.setAttribute("list", dto);
		RequestDispatcher dis = request.getRequestDispatcher(page);
		dis.forward(request, response);
	}

}

