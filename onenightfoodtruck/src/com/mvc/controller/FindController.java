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
import com.mvc.service.MemberService;


@WebServlet("/find")
public class FindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		System.out.println(email+"/"+phone);

		MemberService service = new MemberService(request, response);
		ArrayList<MemberDTO> list = service.find(email, phone);
		request.setAttribute("result", list);
		RequestDispatcher dis = request.getRequestDispatcher("find.jsp");
		dis.forward(request, response);
	}

}
