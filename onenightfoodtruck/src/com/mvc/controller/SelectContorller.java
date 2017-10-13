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


@WebServlet("/select")
public class SelectContorller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public SelectContorller() {
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String category1 = request.getParameter("category1");
		String category2 = request.getParameter("category2");
		System.out.println(category1+"/"+category2);
		
		TruckDAO dao = new TruckDAO();
		ArrayList<TruckDTO>list = dao.select(category1,category2);
		
		request.setAttribute("list",list);
		
		RequestDispatcher dis = request.getRequestDispatcher("select.jsp");
		dis.forward(request,response);
	}

}
