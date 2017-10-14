package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.MemberDAO;
import com.mvc.dao.TruckDAO;


@WebServlet("/bye")
public class ByeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ByeController() {
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Process(request,response);
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request,response);
	}
	
	protected void Process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("user_id");
		System.out.println(id);
		
		MemberDAO dao = new MemberDAO();
		
		String msg = "삭제에 실패 했습니다.";
		if(dao.delete(id) ==1){
			msg = "삭제에 성공 했습니다.";
		}
		//response.sendRedirect("admin");
		request.setAttribute("list", msg);
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);
	}
}