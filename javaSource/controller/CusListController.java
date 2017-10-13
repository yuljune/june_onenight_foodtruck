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


@WebServlet("/cuslist")
public class CusListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CusListController() {
      
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id  = request.getParameter("cusinfo");
		System.out.println(id);
		
		MemberService service = new MemberService(request, response);
		ArrayList<MemberDTO> list = service.cuslist(id);
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("cuslist.jsp");
		dis.forward(request, response);
	}

}
