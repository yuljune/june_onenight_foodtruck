package com.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.TruckDAO;
import com.mvc.dto.TruckDTO;


@WebServlet("/keyword")
public class KeywordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public KeywordController() {
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");
		System.out.println(keyword);
		
		TruckDAO dao = new TruckDAO();
		ArrayList<TruckDTO>list = dao.keyword(keyword);
		
		request.setAttribute("list",list);
		
		RequestDispatcher dis = request.getRequestDispatcher("keyword.jsp");
		dis.forward(request,response);
	}

}
