package com.mvc.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mvc.dao.MemberDAO;
import com.mvc.dao.TruckDAO;
import com.mvc.dto.LocationDTO;
import com.mvc.dto.MemberDTO;
import com.mvc.dto.ReviewDTO;
import com.mvc.dto.TruckDTO;

public class MemberService {
	
	HttpServletRequest request = null;
	HttpServletResponse response = null;

	public MemberService(HttpServletRequest request, HttpServletResponse response) {

		this.request = request;
		this.response = response;
		
	}

	public void join() throws ServletException, IOException{

		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		String nick = request.getParameter("userNick");
		String email = request.getParameter("email");
		String phone = request.getParameter("phoneNum");
		String user = request.getParameter("user");
		
		System.out.println(id+"/"+pw+"/"+nick+"/"+email+"/"+user);
		
		MemberDAO dao = new MemberDAO();
		
		String msg="";
		String page="";
		
		if(dao.join(id,pw, nick, email, phone, user)==1){
			msg="등록에 성공 했습니다.";
			page="home.jsp";
		}else{
			msg="등록에 실패 하였습니다.";
			page="join.jsp";
		}
		
		request.setAttribute("result", msg);
		RequestDispatcher dis = request.getRequestDispatcher(page);
		dis.forward(request, response);
		
	}

	public ArrayList<MemberDTO> find(String email, String phone) {
		MemberDAO dao = new MemberDAO();
		return dao.find(email,phone);
	}
		
	public void login() throws ServletException, IOException{

		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		String user = request.getParameter("user");
		
		MemberDAO dao = new MemberDAO();
		
		if(dao.login(id,pw,user)){
			request.getSession().setAttribute("loginId", id);
			request.getSession().setAttribute("position", user);
			response.sendRedirect("index.jsp");
		}else{
			request.setAttribute("result", "로그인에 실패 했습니다.");
			RequestDispatcher dis = request.getRequestDispatcher("loginPage.jsp");
			dis.forward(request, response);
		}
	}

	public void check1() throws ServletException, IOException{
		
		String id = request.getParameter("id");
		String msg = "";
		MemberDAO dao = new MemberDAO();
	
		if(dao.check1(id)){
			msg="사용할 수 없습니다.";
		}
		else{
			msg="사용 가능합니다.";
		}
		
		HashMap map = new HashMap();
		map.put("result", msg);
		Gson json = new Gson();
		String result = json.toJson(map);
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		out.println(result);
		
	}

	public void check2() throws ServletException, IOException{
		
		String nick = request.getParameter("nick");
		
		MemberDAO dao = new MemberDAO();
		String msg = "";
		if(dao.check2(nick)){
			msg="사용할 수 없습니다.";
		}else{
			msg="사용 가능합니다.";
		}
		
		HashMap map = new HashMap();
		map.put("result", msg);
		Gson json = new Gson();
		String result = json.toJson(map);
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		out.println(result);
		
	}
		
	public void logout() throws ServletException, IOException{
		
		request.getSession().removeAttribute("loginId");
		response.sendRedirect("home.jsp");
		
	}

	public ArrayList<MemberDTO> ceolist(String id) {
		MemberDAO dao = new MemberDAO();
		return dao.find(id);
		
	}

	public ArrayList<MemberDTO> cuslist(String id) {
		MemberDAO dao = new MemberDAO();
		return dao.find(id);
	}

	public void list() throws ServletException, IOException{
		
		TruckDAO dao = new TruckDAO();
		ArrayList<TruckDTO>list = dao.list();
		
		request.setAttribute("list",list);
		
		RequestDispatcher dis = request.getRequestDispatcher("list.jsp");
		dis.forward(request,response);
	}

	public ArrayList<ReviewDTO> reviewlist(String id, String trucknum, String comp_name) {
		MemberDAO dao = new MemberDAO();
		return dao.reviewlist(id,trucknum,comp_name);
	}

	public ArrayList<LocationDTO> showlocation(String trucknum) {
		TruckDAO dao = new TruckDAO();
		return dao.showlocation(trucknum);
	}

	public ArrayList<MemberDTO> adminlist() {
		MemberDAO dao = new MemberDAO();
		return dao.admin();
	}

	public ArrayList<TruckDTO> trucklist() {
		TruckDAO dao = new TruckDAO();
		return dao.admintrucklist();
	}	
}	


