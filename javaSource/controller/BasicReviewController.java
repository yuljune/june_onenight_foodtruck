package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.MemberDAO;


@WebServlet("/basicreview")
public class BasicReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public BasicReviewController() {
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("user_id");
		String trucknum = request.getParameter("trucknum");
		
		System.out.println(trucknum+id);
		
		String msg = "";
		
		MemberDAO dao = new MemberDAO();
		
		if(dao.basicReview(id, trucknum) == 1){
			msg = "등록에 성공 하였습니다.";
		}else{
			msg = "이미 등록하셨습니다.";
		}
		request.setAttribute("result", msg);
		RequestDispatcher dis = request.getRequestDispatcher("trucklist?truckinfo="+id);
		dis.forward(request, response);
	}

}
