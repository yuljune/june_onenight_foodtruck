package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.TruckDAO;


@WebServlet("/deletereview")
public class DeleteReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DeleteReviewController() {
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("loginId");
		int revidx = Integer.parseInt(request.getParameter("revidx"));
		int trucknum = Integer.parseInt(request.getParameter("trucknum"));
		System.out.println(id+revidx);
		
		TruckDAO dao = new TruckDAO();
		
		String msg = "삭제에 실패 했습니다.";
		if(dao.deletereview(revidx,id,trucknum) ==1){
			msg = "삭제에 성공 했습니다.";
		}
		request.setAttribute("result", msg);
		RequestDispatcher dis = request.getRequestDispatcher("detail?trucknum="+trucknum);
		dis.forward(request, response);
		
	}

}
