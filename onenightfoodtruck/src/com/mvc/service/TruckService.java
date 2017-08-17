package com.mvc.service;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.mvc.dao.TruckDAO;
import com.mvc.dto.TruckDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class TruckService {
	HttpServletRequest request = null;
	HttpServletResponse response = null;

	public TruckService(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	public ArrayList<TruckDTO> trucklist(String id) {
		TruckDAO dao = new TruckDAO();
		return dao.trucklist(id);
	}

	public TruckDTO detail(String trucknum) {
		
		TruckDAO dao = new TruckDAO();

		return dao. detail(trucknum);
	}

	public void write(HttpServletRequest request2)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//용량제한 10MB
		int maxSize = 1024*1024*10;
		
		//웹서버 메인 주소 알아내기
		String root = request.getSession().getServletContext().getRealPath("/");
		//저장 경로 설정
		System.out.println(root);
		String savePath = root+"upload";
		//폴더가 없을 경우
		File dir = new File(savePath);
		if(!dir.isDirectory()){
			System.out.println("폴더 없음, 생성 시작");
			dir.mkdir();
		}
		//파일 이름 변경 준비		
		String oldFileName = "";//원래 파일 이름
		String newFileName="";//변경할 파일 이름
		
		long currTime = System.currentTimeMillis();
		SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		//request -> multipartRequest
		//request객체, 저장경로, 파일사이즈, 인코딩타입, 파일명 변경 정책
		MultipartRequest multi = new MultipartRequest(request, savePath, 
				maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		//실제 파일명 뽑아 내기
		oldFileName = multi.getFilesystemName("uploadFile");
		System.out.println(oldFileName);
		
		//변경할 파일명(20170511112058)
		newFileName = simDf.format(new Date(currTime))
				+"."+oldFileName.substring(oldFileName.lastIndexOf(".")+1);
		System.out.println(newFileName);
		
		//파일객체 생성
		//업로드 파일 객체
		File oldFile = new File(savePath+"/"+oldFileName);
		//저장될 파일 객체
		File newFile = new File(savePath+"/"+newFileName);
		
		//파일명 변경
		oldFile.renameTo(newFile);
		
		TruckDAO dao = new TruckDAO();
		int idx = 0;
		String page="addPhoto.jsp";
		
		String id = multi.getParameter("userId");
		System.out.println(multi.getParameter("userId"));
		
		idx=dao.idx(id);
		
		TruckDAO dao2= new TruckDAO();
		if(dao2.upload(oldFileName,newFileName, idx)==1){
			page="./trucklist?truckinfo="+id;
		}

		String msg="등록에 실패 했습니다.";
		
		if(page.equals("./trucklist?truckinfo="+id)){//success			
			msg="등록에 성공 했습니다.";
		}
		request.setAttribute("result", msg);
		RequestDispatcher dis = request.getRequestDispatcher(page);
		dis.forward(request, response);	
	}

	public TruckDTO detail2(String trucknum) {
		TruckDAO dao = new TruckDAO();

		return dao. detail2(trucknum);
	}

	public ArrayList<TruckDTO> trucklist() {
		TruckDAO dao = new TruckDAO();
		return dao.admintrucklist();
	}	
	}


