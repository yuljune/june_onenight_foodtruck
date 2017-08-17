package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.mvc.dao.TruckDAO;


@WebServlet("/truckupdate")
public class TruckUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public TruckUpdateController() {
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("user_id");
		String name = request.getParameter("comp_name");
		String time = request.getParameter("comp_time");
		String phone = request.getParameter("comp_phone");
		String card = request.getParameter("card");
		String condition = request.getParameter("condition");
		String address1 = request.getParameter("category1");
		String address2= request.getParameter("category2");
		String content= request.getParameter("content");
		String address = address1+address2;
		
		String page = "";
		String msg = "";
		TruckDAO dao = new TruckDAO();
		if(dao.update(id,name,time,phone,card,condition,address,content) > 0){
			page = "trucklist?truckinfo="+id;
			msg = "수정에 성공 했습니다.";
		}else{
			page = "truckmodify?user_id="+id;
			msg = "수정에 실패 했습니다.";
		}
		request.setAttribute("result", msg);
		RequestDispatcher dis = request.getRequestDispatcher(page);
		dis.forward(request, response);
	}

}
