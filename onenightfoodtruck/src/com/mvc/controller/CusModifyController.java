package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.MemberDAO;
import com.mvc.dto.MemberDTO;


@WebServlet("/cusmodify")
public class CusModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CusModifyController() {
        
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	MemberDAO dao = new MemberDAO();
		String id = request.getParameter("user_id");
		MemberDTO info = dao.cusdetail(id);
		request.setAttribute("member", info);
		RequestDispatcher dis = request.getRequestDispatcher("cusmodify.jsp");
		dis.forward(request, response);
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String id = request.getParameter("user_id");
		MemberDTO info = dao.cusdetail(id);
		request.setAttribute("member", info);
		RequestDispatcher dis = request.getRequestDispatcher("cusmodify.jsp");
		dis.forward(request, response);
	}


}
