package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.TruckDAO;
import com.mvc.service.TruckService;


@WebServlet("/addPhoto")
public class PhotoController extends HttpServlet {
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
		
		String id = request.getParameter("user_id");
		System.out.println("id : "+id);
		
		TruckService service = new TruckService(request, response);
		String page;
		String msg;
		String filePath = "";
		try{
			//filePath = service.addPhoto(request);
		} catch (Exception e){
			e.printStackTrace();
		}
		if(filePath != null){
			//����
			page = "";
			msg = "add success";
		}else{
			//����
			page = "";
			msg = "add fail";
		}
		request.setAttribute("result", msg);
		RequestDispatcher dis = request.getRequestDispatcher(page);
		dis.forward(request, response);
		
		
	}

}
