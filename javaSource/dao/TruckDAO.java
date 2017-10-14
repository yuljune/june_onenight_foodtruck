package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.LocationDTO;
import com.mvc.dto.TruckDTO;

public class TruckDAO {

	DataSource ds = null;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs =null;
	
	public TruckDAO(){		
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int addTruck(String comp_name, String comp_time, String comp_phone, String card, String user_id, String address, String content) {
		
		int success = 0;
		
		String sql = "INSERT INTO truckInfo(truckNum, comp_name, comp_time, comp_phone, card, reg_date, condition,bHit, user_id, address,content) "
				+ "VALUES(seq_truckNum.NEXTVAL,?,?,?,?,SYSDATE,'off',0,?,?,?)";
		
		if(!truckOverlap(user_id)){
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, comp_name);
			ps.setString(2, comp_time);
			ps.setString(3, comp_phone);
			ps.setString(4, card);
			ps.setString(5, user_id);
			ps.setString(6, address);
			ps.setString(7, content);
			success = ps.executeUpdate();
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				
				ps.close();
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
	
	private boolean truckOverlap(String user_id) {
		boolean success = false;
		String sql = "SELECT user_id FROM truckInfo WHERE user_id=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_id);
			rs = ps.executeQuery();
			success = rs.next();
			
		} catch (SQLException e) {e.printStackTrace();}
		finally{
			try {
				rs.close();
				ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			}
		
		
		return success;
	}


	public ArrayList<TruckDTO> trucklist(String id) {
		ArrayList<TruckDTO> member = new ArrayList<TruckDTO>();
		
		String sql = "SELECT * FROM truckinfo WHERE user_id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			while(rs.next()){
				TruckDTO dto = new TruckDTO();
				dto.setTrucknum(rs.getInt("trucknum"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setComp_name(rs.getString("comp_name"));
				dto.setComp_time(rs.getString("comp_time"));
				dto.setComp_phone(rs.getString("comp_phone"));
				dto.setCondition(rs.getString("condition"));
				dto.setCard(rs.getString("card"));
				dto.setContent(rs.getString("content"));
				dto.setCondition(rs.getString("condition"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setAddress(rs.getString("address"));
				dto.setbHit(rs.getInt("bhit"));
				member.add(dto);
			}
			System.out.println(member);
		} catch (Exception e) {
		
			e.printStackTrace();
		
		}finally{
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			}
		return member;
	}

	public TruckDTO truckdetail(String id) {
		TruckDTO dto = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM truckinfo WHERE user_id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()){
				dto = new TruckDTO();
				dto.setUser_id(rs.getString("user_id"));
				dto.setComp_name(rs.getString("comp_name"));
				dto.setComp_time(rs.getString("comp_time"));
				dto.setComp_phone(rs.getString("comp_phone"));
				dto.setContent(rs.getString("content"));
				dto.setCard(rs.getString("card"));
				dto.setCondition(rs.getString("condition"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setAddress(rs.getString("address"));
				dto.setbHit(rs.getInt("bhit"));
				
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}

	public int update(String id, String name, String time, String phone, String card, String condition, String address, String content) {
		String sql = "UPDATE truckinfo SET comp_name=?, comp_time=?, comp_phone=?, card=?, condition=?, address=?, content=? WHERE user_id=?";
		int success = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, time);
			ps.setString(3, phone);
			ps.setString(4, card);
			ps.setString(5, condition);
			ps.setString(6, address);
			ps.setString(7, content);
			ps.setString(8, id);
			
			success = ps.executeUpdate();
			System.out.println(success);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return success;
	}

	public ArrayList<TruckDTO> list() {
		ArrayList<TruckDTO> members = new ArrayList<TruckDTO>();
		
		String sql="SELECT d.TRUCKNUM, d.COMP_NAME, d.COMP_TIME, d.CONDITION, d.card, d.BHIT, AVG(e.STARPOINT) AS STARPOINT,d.address "
			    +"FROM truckinfo d, review e WHERE e.trucknum = d.trucknum "
                +"GROUP BY d.TRUCKNUM, d.COMP_NAME, d.COMP_TIME, d.BHIT, d.CONDITION, d.address, d.card "
                +"ORDER BY AVG(e.starpoint) DESC, d.bHit DESC";

		try {
			System.out.println("ps실행");
			ps = conn.prepareStatement(sql);
			System.out.println("쿼리실행");
			rs = ps.executeQuery();
					
			while(rs.next()){
				TruckDTO dto = new TruckDTO();
				dto.setTrucknum(rs.getInt("trucknum"));
				dto.setComp_name(rs.getString("comp_name"));
				dto.setCondition(rs.getString("condition"));
				dto.setComp_time(rs.getString("comp_time"));
				dto.setStarpoint(rs.getInt("starpoint"));
				dto.setAddress(rs.getString("address"));
				dto.setbHit(rs.getInt("bhit"));
				dto.setCard(rs.getString("card"));
				members.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				ps.close();
				System.out.println("con삭제");
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return members;
	}

	public ArrayList<TruckDTO> keyword(String keyword) {
		ArrayList<TruckDTO> members = new ArrayList<TruckDTO>();
		String sql="SELECT d.TRUCKNUM, d.COMP_NAME, d.COMP_TIME, d.CONDITION, d.BHIT, AVG(e.STARPOINT) AS STARPOINT,d.address, d.card "
			    +"FROM truckinfo d, review e WHERE e.trucknum = d.trucknum and comp_name like ? or address like ? "
                +"GROUP BY d.TRUCKNUM, d.COMP_NAME, d.COMP_TIME, d.BHIT, d.CONDITION, d.address, d.card "
                +"ORDER BY AVG(e.starpoint) DESC, d.bHit DESC";
		try {
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+keyword+"%");
			ps.setString(2, "%"+keyword+"%");
			rs = ps.executeQuery();
			
			while(rs.next()){
				TruckDTO dto = new TruckDTO();
				dto.setTrucknum(rs.getInt("trucknum"));
				dto.setComp_name(rs.getString("comp_name"));
				dto.setComp_time(rs.getString("comp_time"));
				dto.setCondition(rs.getString("condition"));
				dto.setAddress(rs.getString("address"));
				dto.setStarpoint(rs.getInt("starpoint"));
				dto.setCard(rs.getString("card"));
				dto.setbHit(rs.getInt("bhit"));
				members.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return members;
	}

	public TruckDTO detail(String trucknum) {
		TruckDTO dto = new TruckDTO();
		String sql = "SELECT d.TRUCKNUM, d.COMP_NAME, d.COMP_TIME,d.comp_phone, d.content, d.reg_date, d.CONDITION, d.BHIT, AVG(e.STARPOINT) AS STARPOINT,d.address, d.card "
			    +"FROM truckinfo d, review e WHERE e.trucknum = d.trucknum and d.trucknum=? "
                +"GROUP BY d.TRUCKNUM, d.COMP_NAME, d.COMP_TIME, d.BHIT, d.CONDITION, d.address, d.card, d.comp_phone, d.content, d.reg_date "
                +"ORDER BY AVG(e.starpoint) DESC, d.bHit DESC";
		if(upHit(trucknum)==1){
			try {
			
				ps = conn.prepareStatement(sql);
				ps.setInt(1,  Integer.parseInt(trucknum));
				
				rs = ps.executeQuery();
				
				if(rs.next()){
					
					dto.setTrucknum(rs.getInt("trucknum"));
					dto.setComp_name(rs.getString("comp_name"));
					dto.setComp_time(rs.getString("comp_time"));
					dto.setComp_phone(rs.getString("comp_phone"));
					dto.setCard(rs.getString("card"));
					dto.setContent(rs.getString("content"));
					dto.setCondition(rs.getString("condition"));
					dto.setReg_date(rs.getString("reg_date"));
					dto.setAddress(rs.getString("address"));
					dto.setStarpoint(rs.getInt("starpoint"));
					dto.setbHit(rs.getInt("bhit"));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				try {
					rs.close();
					ps.close();
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return dto;
	}
private int upHit(String trucknum) {
		
		String sql= "UPDATE truckinfo SET BHit=bHit+1 WHERE trucknum=?";
		
		int success = 0;
		
		try {
			
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1,  Integer.parseInt(trucknum));
			
		    success = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return success;
		
	}

public int addlocation(double lat, double lng, String trucknum) {
	int success = 0;
	
	String sql = "INSERT INTO location(truckNum, wido, gyoungdo) "
			+ "VALUES(?,?,?)";
	
	if(!locationOverlap(trucknum)){
	try {
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, trucknum);
		ps.setDouble(2, lat);
		ps.setDouble(3, lng);
		success = ps.executeUpdate();
	
		ps.close();
		conn.close();
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally{
		try {
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	}else{
		success=2;
	}
	return success;

}
private boolean locationOverlap(String trucknum) {
	boolean success = false;
	String sql = "SELECT trucknum FROM location WHERE trucknum=?";
	
	try {
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, trucknum);
		rs = ps.executeQuery();
		success = rs.next();
		
		
	} catch (SQLException e) {e.printStackTrace();}
	finally{
		try {
			rs.close();
			ps.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	return success;
}


public ArrayList<LocationDTO> showlocation(String trucknum) {
	ArrayList<LocationDTO> member = new ArrayList<LocationDTO>();
	
	String sql = "SELECT * FROM location WHERE trucknum=?";
	try {
		
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, trucknum);
		
		rs = ps.executeQuery();
		while(rs.next()){
			LocationDTO dto = new LocationDTO();
			dto.setTrucknum(rs.getInt("trucknum"));
			dto.setWido(rs.getDouble("wido"));
			dto.setGyoungdo(rs.getDouble("gyoungdo"));
			member.add(dto);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally{
		try {
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	return member;
}

public ArrayList<TruckDTO> mylocation(String loc) {
	ArrayList<TruckDTO> members = new ArrayList<TruckDTO>();
	String sql="SELECT d.TRUCKNUM, d.COMP_NAME, d.COMP_TIME, d.CONDITION, d.BHIT, AVG(e.STARPOINT) AS STARPOINT,d.address, d.card "
		    +"FROM truckinfo d, review e WHERE e.trucknum = d.trucknum and address like ? "
            +"GROUP BY d.TRUCKNUM, d.COMP_NAME, d.COMP_TIME, d.BHIT, d.CONDITION, d.address, d.card "
            +"ORDER BY AVG(e.starpoint) DESC, d.bHit DESC";
	try {
	
		ps = conn.prepareStatement(sql);
		ps.setString(1, "%"+loc+"%");
		rs = ps.executeQuery();
		
		while(rs.next()){
			TruckDTO dto = new TruckDTO();
			dto.setTrucknum(rs.getInt("trucknum"));
			dto.setComp_name(rs.getString("comp_name"));
			dto.setComp_time(rs.getString("comp_time"));
			dto.setCondition(rs.getString("condition"));
			dto.setAddress(rs.getString("address"));
			dto.setbHit(rs.getInt("bhit"));
			dto.setStarpoint(rs.getInt("starpoint"));
			dto.setCard(rs.getString("card"));
			members.add(dto);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally{
		try {
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	return members;
}

public ArrayList<TruckDTO> select(String category1, String category2) {
	ArrayList<TruckDTO> members = new ArrayList<TruckDTO>();
	String sql="SELECT d.TRUCKNUM, d.COMP_NAME, d.COMP_TIME, d.CONDITION, d.BHIT, AVG(e.STARPOINT) AS STARPOINT,d.address, d.card "
		    +"FROM truckinfo d, review e WHERE e.trucknum = d.trucknum and address like ? and address like ? "
            +"GROUP BY d.TRUCKNUM, d.COMP_NAME, d.COMP_TIME, d.BHIT, d.CONDITION, d.address, d.card "
            +"ORDER BY AVG(e.starpoint) DESC, d.bHit DESC";
	try {
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, "%"+category1+"%");
		ps.setString(2, "%"+category2+"%");
		rs = ps.executeQuery();
		
		while(rs.next()){
			TruckDTO dto = new TruckDTO();
			dto.setTrucknum(rs.getInt("trucknum"));
			dto.setComp_name(rs.getString("comp_name"));
			dto.setComp_time(rs.getString("comp_time"));
			dto.setCondition(rs.getString("condition"));
			dto.setAddress(rs.getString("address"));
			dto.setStarpoint(rs.getInt("starpoint"));
			dto.setbHit(rs.getInt("bhit"));
			dto.setCard(rs.getString("card"));
			members.add(dto);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally{
		try {
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	return members;
}

public int delete(String trucknum) {
	String sql = "DELETE FROM location WHERE trucknum=?";
	int success = 0;
	
	try {
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, trucknum);
		success = ps.executeUpdate();
	} catch (SQLException e) {
		
		e.printStackTrace();
	}finally{
		try {
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	return success;
}

public int deletereview(int revidx, String id, int trucknum) {
	String sql = "DELETE FROM review WHERE user_id=? and revidx=?";
	int success = 0;
	
	try {
	
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setInt(2, revidx);
		success = ps.executeUpdate();
	} catch (SQLException e) {
		
		e.printStackTrace();
	}finally{
		try {
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	return success;
}

public int idx(String id) {
	int idx =0;
	
	String sql = "SELECT trucknum FROM truckinfo WHERE user_id=?";
	
		try {
		
			ps = conn.prepareStatement(sql);
			ps.setString(1,id);
			
			rs = ps.executeQuery();
			
			if(rs.next()){
				idx=(rs.getInt("trucknum"));
				System.out.println(rs.getInt("trucknum")+"트럭넘버");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	return idx;
}

public int upload(String oldFileName, String newFileName, int idx) {
	int success=0;
	String sql= "INSERT INTO photo(fileIdx,oldfile,newfile,trucknum) "
			+ "VALUES(seq_photo.NEXTVAL,?,?,?)";
	
	try {
		
		ps = conn.prepareStatement(sql);
		
		ps.setString(1, oldFileName);
		ps.setString(2, newFileName);
		ps.setInt(3, idx);
		
		success =ps.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally{
		try {
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	return success;
}

public TruckDTO detail2(String trucknum) {
	TruckDTO dto = new TruckDTO();
	String sql = "SELECT e.trucknum, d.content, e.newfile, e.fileidx "
                   +"FROM truckinfo d, photo e WHERE e.trucknum = d.trucknum and e.trucknum=?";
	
		try {
		
			ps = conn.prepareStatement(sql);
			ps.setInt(1,Integer.parseInt(trucknum));
			
			rs = ps.executeQuery();
			
			if(rs.next()){
				
				dto.setTrucknum(rs.getInt("trucknum"));
				dto.setContent(rs.getString("content"));
				dto.setNewfile(rs.getString("newfile"));
				dto.setFileidx(rs.getInt("fileidx"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	return dto;
}

public ArrayList<TruckDTO> admintrucklist() {
	ArrayList<TruckDTO> member = new ArrayList<TruckDTO>();
	
	String sql = "SELECT * FROM truckinfo ";
	try {
		
		
		ps = conn.prepareStatement(sql);
		
		
		rs = ps.executeQuery();
		while(rs.next()){
			TruckDTO dto = new TruckDTO();
			dto.setTrucknum(rs.getInt("trucknum"));
			dto.setUser_id(rs.getString("user_id"));
			dto.setComp_name(rs.getString("comp_name"));
			dto.setComp_time(rs.getString("comp_time"));
			dto.setComp_phone(rs.getString("comp_phone"));
			dto.setCondition(rs.getString("condition"));
			dto.setCard(rs.getString("card"));
			dto.setContent(rs.getString("content"));
			dto.setCondition(rs.getString("condition"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setAddress(rs.getString("address"));
			dto.setbHit(rs.getInt("bhit"));
			member.add(dto);
		}
		System.out.println(member);
	} catch (Exception e) {
		e.printStackTrace();
	}finally{
		try {
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	return member;
}

public int truckdelete(String id) {
	String sql = "DELETE FROM truckinfo WHERE user_id=?";
	int success = 0;
	
	try {
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		success = ps.executeUpdate();
	} catch (SQLException e) {
		
		e.printStackTrace();
	}finally{
		try {
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	return success;
	}

}
