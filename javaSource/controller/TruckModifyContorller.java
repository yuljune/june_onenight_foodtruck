package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.TruckDAO;
import com.mvc.dto.TruckDTO;


@WebServlet("/truckmodify")
public class TruckModifyContorller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public TruckModifyContorller() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TruckDAO dao = new TruckDAO();
		String id = request.getParameter("user_id");
		System.out.println(id+"ㅇㅋ");
		TruckDTO info = dao.truckdetail(id);
		request.setAttribute("truck", info);
		RequestDispatcher dis = request.getRequestDispatcher("truckmodify.jsp");
		dis.forward(request, response);
		
	}


	
	

}
