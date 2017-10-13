package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.MemberDAO;


@WebServlet("/cusupdate")
public class CusUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public CusUpdateController() {
       
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("user_id");
		String pass = request.getParameter("user_pw");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		String page = "";
		String msg = "";
		MemberDAO dao = new MemberDAO();
		if(dao.update(id,pass,nickname,email,phone) == 1){
			page = "cuslist?cusinfo="+id;
			msg = "수정에 성공 했습니다.";
		}else{
			page = "cusmodify?user_id="+id;
			msg = "수정에 실패 했습니다.";
		}
		request.setAttribute("result", msg);
		RequestDispatcher dis = request.getRequestDispatcher(page);
		dis.forward(request, response);
	
	}

}
