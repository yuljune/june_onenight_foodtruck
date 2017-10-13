package com.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

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

@WebServlet("/admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdminController() {
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberService service = new MemberService(request, response);
		ArrayList<MemberDTO> list = service.adminlist();
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("admin.jsp");
		dis.forward(request, response);
		
	
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberService service = new MemberService(request, response);
		ArrayList<MemberDTO> list = service.adminlist();
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("admin.jsp");
		dis.forward(request, response);
		
	
	}

}
