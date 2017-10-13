package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mvc.dao.MemberDAO;

/**
 * Servlet implementation class BackController
 */
@WebServlet({ "/bTruck", "/bTruckModify" })
public class BackController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		doProccess(response, request);
	}

	
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		doProccess(response, request);
	}


	private void doProccess(HttpServletResponse response, 
			HttpServletRequest request) 
					throws ServletException, IOException {
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String subAddr = uri.substring(context.length());
		
		if(subAddr.equals("bTruckModify")){
			
			String id = request.getParameter("id");
			String msg = "";
			MemberDAO dao = new MemberDAO();
		
			if(dao.check1(id)){
				msg="사용할 수 없습니다. 아이디를 다시 입력하세요.";
			}
			else{
				msg="사용할 수 있습니다.";
			}
			
			HashMap map = new HashMap();
			map.put("result", msg);
			Gson json = new Gson();
			String result = json.toJson(map);
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.println(result);
			
		}
		
	}

}
