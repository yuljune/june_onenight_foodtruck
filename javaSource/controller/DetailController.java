package com.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dto.ReviewDTO;
import com.mvc.dto.TruckDTO;
import com.mvc.service.MemberService;
import com.mvc.service.TruckService;

@WebServlet("/detail")
public class DetailController extends HttpServlet {
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
	
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("loginId");
		String trucknum = request.getParameter("trucknum");
		String comp_name = request.getParameter("comp_name");
		String page = "";
		
		TruckService service = new TruckService(request, response);
		TruckDTO dto = service.detail(trucknum);
		
		if(dto != null){
			page="detail.jsp";
		}
		request.setAttribute("list", dto);
		
		MemberService service2 = new MemberService(request, response);
		ArrayList<ReviewDTO> list = service2.reviewlist(id,trucknum,comp_name);
		request.setAttribute("list2", list);
		
		TruckDTO dto2 = service.detail2(trucknum);
		if(dto2 != null){
			page="detail.jsp";
		}
		request.setAttribute("list3", dto2);
		
		RequestDispatcher dis = request.getRequestDispatcher(page);
		dis.forward(request, response);
		
	
		
	}

}
