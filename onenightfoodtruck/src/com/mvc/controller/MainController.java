package com.mvc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.service.MemberService;

@WebServlet({ "/join", "/login", "/logout","/check1","/check2","/list" })
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		proccess(request,response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		proccess(request,response);
		
	}

	private void proccess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String subAddr = uri.substring(context.length());
			
		MemberService service = new MemberService(request,response);
			
		if(subAddr.equals("/join")){
			service.join();
		}
		
		if(subAddr.equals("/login")){
			service.login();
		}
		
		if(subAddr.equals("/check1")){
			service.check1();
		}
		
		if(subAddr.equals("/check2")){
			service.check2();
		}
		
		if(subAddr.equals("/logout")){
			service.logout();
		}
		if(subAddr.equals("/list")){
			service.list();
		}
			
	}

}
