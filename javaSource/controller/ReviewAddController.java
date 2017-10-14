package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.MemberDAO;



@WebServlet("/addreview")
public class ReviewAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public ReviewAddController() {
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("loginId");
		String trucknum = request.getParameter("trucknum");
		String content = request.getParameter("content");
		String starpoint = request.getParameter("starpoint");
		System.out.println(trucknum+id+content+starpoint);
		
		String msg = "";
		
		MemberDAO dao = new MemberDAO();
		
		if(dao.addReview(id, trucknum, content, starpoint) == 1){
			msg = "등록에 성공 하였습니다.";
		}else{
			msg = "등록에 실패 하였습니다.";
		}
		request.setAttribute("result", msg);
		RequestDispatcher dis = request.getRequestDispatcher("detail?trucknum="+trucknum);
		dis.forward(request, response);
	}

}
