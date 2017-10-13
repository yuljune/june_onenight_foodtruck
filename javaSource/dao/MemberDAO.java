package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.MemberDTO;
import com.mvc.dto.ReviewDTO;
import com.mvc.dto.TruckDTO;


public class MemberDAO {

	DataSource ds = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int join(String id, String pw, String nick, String email, 
			String phone, String user) {
		
		int success = 0;
		String sql = "";
		if (user.equals("ceo")){
			sql = "INSERT INTO members VALUES(?,?,?,?,?,'ceo')";
			
		}else{
			sql = "INSERT INTO members VALUES(?,?,?,?,?,'cus')";
		}
		if(check2(nick)==false){
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, nick);
			pstmt.setString(4, email);
			pstmt.setString(5, phone);
			
			success = pstmt.executeUpdate();
			
		} catch (Exception e) {
		
			e.printStackTrace();
		
		}finally{
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		}
		return success;
		
	}

	public ArrayList<MemberDTO> find(String email, String phone) {
		ArrayList<MemberDTO> member = new ArrayList<MemberDTO>();
	
		String sql = "SELECT user_id, user_pw FROM members WHERE email=? AND phone=?";
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, phone);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberDTO dto = new MemberDTO();
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pw(rs.getString("user_pw"));
				member.add(dto);
			}
			System.out.println(member);
			
		} catch (Exception e) {
		
			e.printStackTrace();
		
		}finally{
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return member;
	}
	public boolean login(String id, String pw, String user) {
		
		boolean success = true;
	
		String sql = "SELECT user_id FROM members WHERE user_id=? AND user_pw =? AND position=?";
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, user);
			
			rs= pstmt.executeQuery();
			
			success = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				pstmt.close();
				conn.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
		return success;
	}

	public boolean check1(String id) {
		
		boolean success = false;
	
		String sql = "SELECT user_id FROM members WHERE user_id=?";
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs= pstmt.executeQuery();
			
			success = rs.next();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				pstmt.close();
				conn.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return success;
	}

	public boolean check2(String nick) {
		
		boolean success = false;
		String sql = "SELECT nickname FROM members WHERE nickname=?";
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, nick);
			
			rs= pstmt.executeQuery();
			
			success = rs.next();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				pstmt.close();
				conn.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return success;
		
	}

	public ArrayList<MemberDTO> find(String id) {
		ArrayList<MemberDTO> member = new ArrayList<MemberDTO>();
		
		String sql = "SELECT * FROM members WHERE user_id=?";
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberDTO dto = new MemberDTO();
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pw(rs.getString("user_pw"));
				dto.setNickname(rs.getString("nickname"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				member.add(dto);
			}
			System.out.println(member);
			
			
		} catch (Exception e) {
		
			e.printStackTrace();
		
		}finally{
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return member;
	}

	public MemberDTO cusdetail(String id) {
		MemberDTO dto = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM members WHERE user_id=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new MemberDTO();
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pw(rs.getString("user_pw"));
				dto.setNickname(rs.getString("nickname"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				pstmt.close();
				conn.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}

	public int update(String id, String pass, String nickname, String email, String phone) {
		String sql = "UPDATE members SET user_pw=?, nickname=?, email=?, phone=? WHERE user_id=?";
		int success = 0;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, nickname);
			pstmt.setString(3, email);
			pstmt.setString(4, phone);
			pstmt.setString(5, id);
			
			success = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
		try {
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
		
		
		return success;
	}

	public ArrayList<ReviewDTO> reviewlist(String id, String trucknum, String comp_name) {
		ArrayList<ReviewDTO> member = new ArrayList<ReviewDTO>();
		
		String sql = "SELECT * FROM review WHERE trucknum=? order by revidx";
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, trucknum);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				ReviewDTO dto = new ReviewDTO();
				dto.setRevidx(rs.getInt("revidx"));
				dto.setContent(rs.getString("content"));
				dto.setStarpoint(rs.getDouble("starpoint"));
				dto.setTrucknum(rs.getInt("trucknum"));
				dto.setUser_id(rs.getString("user_id"));
				member.add(dto);
			}
			System.out.println(member);
			
		} catch (Exception e) {
		
			e.printStackTrace();
		
		}finally{
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			}
		return member;
	}

	public int addReview(String id, String trucknum, String content, String starpoint) {
		int success = 0;
		
		String sql = "INSERT INTO review(revidx, starpoint, content, trucknum, user_id) "
				+ "VALUES(seq_revidx.NEXTVAL,?,?,?,?) ";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, starpoint);
			pstmt.setString(2, content);
			pstmt.setString(3, trucknum);
			pstmt.setString(4, id);
			success = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			}

		return success;
	}

	public int basicReview(String id, String trucknum) {
		int success = 0;
		
		String sql = "INSERT INTO review(revidx, starpoint, content, trucknum, user_id) "
				+ "VALUES(seq_revidx.NEXTVAL,'0','바른말을 사용합시다',?,?)";
		if(!truckOverlap(trucknum)){
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, trucknum);
			pstmt.setString(2, id);
			success = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			}
		
		}else{
			success=2;
		}
		return success;
	}

	private boolean truckOverlap(String trucknum) {
		boolean success = false;
		String sql = "SELECT trucknum FROM review WHERE trucknum=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, trucknum);
			rs = pstmt.executeQuery();
			success = rs.next();
			
			
		} catch (SQLException e) {e.printStackTrace();}finally{
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			}
		
		
		return success;
	}

	public ArrayList<MemberDTO> admin() {
		ArrayList<MemberDTO> member = new ArrayList<MemberDTO>();
		
		String sql = "SELECT * FROM members";
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
		
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberDTO dto = new MemberDTO();
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pw(rs.getString("user_pw"));
				dto.setNickname(rs.getString("nickname"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setPosition(rs.getString("position"));
				member.add(dto);
			}
			System.out.println(member);
			
			
			
		} catch (Exception e) {
		
			e.printStackTrace();
		
		}finally{
			try {
				
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			}
		return member;
	}

	public int delete(String id) {
		String sql = "DELETE FROM members WHERE user_id=?";
		int success = 0;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			success = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			try {
				
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			}
		return success;
	}
}
	

	

