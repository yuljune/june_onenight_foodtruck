package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.TruckDAO;


@WebServlet("/addTruck")
public class AddTruckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		doProccess(request, response);
	}

	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		doProccess(request, response);
	}

	private void doProccess(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		String user_id = request.getParameter("user_id");
		String comp_name = request.getParameter("comp_name");
		String comp_time = request.getParameter("comp_time");
		String comp_phone = request.getParameter("comp_phone");
		String card = request.getParameter("card");
		String address1 = request.getParameter("category1");
		String address2= request.getParameter("category2");
		String content = request.getParameter("content");
		String address = address1+address2;
		System.out.println(address);
		
		String page = "";
		String msg = "";
		
		TruckDAO dao = new TruckDAO();
		
		if(dao.addTruck(comp_name, comp_time, comp_phone, card, user_id,address,content) == 1){
			page = "ceolist?ceoinfo="+user_id;
			msg = "트럭등록에 성공 하였습니다. 트럭페이지에서 확정버튼을 눌러주세요";
			
		}else{
			page = "ceolist?ceoinfo="+user_id;
			msg = "트록등록에 실패 하였습니다.";
		}
		
		request.setAttribute("result", msg);
		RequestDispatcher dis = request.getRequestDispatcher(page);
		dis.forward(request, response);
		
	}

}
