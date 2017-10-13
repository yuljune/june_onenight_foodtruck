package com.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dto.LocationDTO;
import com.mvc.service.MemberService;


@WebServlet("/showlocation")
public class ShowLocationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ShowLocationController() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proccess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proccess(request,response);
	}
	private void proccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String trucknum = request.getParameter("trucknum");
		System.out.println(trucknum);
		
		MemberService service = new MemberService(request, response);
		ArrayList<LocationDTO> list = service.showlocation(trucknum);
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("location2.jsp");
		dis.forward(request, response);
		
		
	}

}
