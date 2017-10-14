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
import com.mvc.service.MemberService;


@WebServlet("/review")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ReviewController() {
       
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("loginId");
		String trucknum = request.getParameter("trucknum");
		String comp_name = request.getParameter("comp_name");
		System.out.println(id+trucknum+comp_name);
		
		MemberService service = new MemberService(request, response);
		ArrayList<ReviewDTO> list = service.reviewlist(id,trucknum,comp_name);
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("detail.jsp");
		dis.forward(request, response);
	}

}
