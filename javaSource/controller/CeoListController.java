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


@WebServlet("/ceolist")
public class CeoListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CeoListController() {
        
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id  = request.getParameter("ceoinfo");
		System.out.println(id);
		
		MemberService service = new MemberService(request, response);
		ArrayList<MemberDTO> list = service.ceolist(id);
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("ceolist.jsp");
		dis.forward(request, response);
	}

}
