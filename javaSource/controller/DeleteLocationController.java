package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.mvc.dao.TruckDAO;


@WebServlet("/deletelocation")
public class DeleteLocationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public DeleteLocationController() {
      
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String trucknum = request.getParameter("trucknum");
		String id = request.getParameter("user_id");
		System.out.println(trucknum);
		
		TruckDAO dao = new TruckDAO();
		
		String msg = "삭제에 실패 했습니다.";
		if(dao.delete(trucknum) ==1){
			msg = "삭제에 성공 했습니다.";
		}
		//response.sendRedirect("trucklist?trucknum="+trucknum);
		request.setAttribute("result", msg);
		RequestDispatcher dis = request.getRequestDispatcher("trucklist?truckinfo="+id);
		dis.forward(request, response);
	}
	
}
