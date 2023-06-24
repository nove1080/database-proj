package dao;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.JDBConnect;
import dto.FieldDTO;

public class FieldDAO extends JDBConnect{
	public FieldDAO(ServletContext application) {
		super(application);
	}
	
	// 풋살장 조회
	public FieldDTO getField(String fid) {
		FieldDTO dto = new FieldDTO();
		try {
			String query = "SELECT * FROM field"
						 + " WHERE fid=?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, fid);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setFid(rs.getString("fid"));
				dto.setFname(rs.getString("fname"));
				dto.setLocation(rs.getString("location"));
			}
			
		} catch(Exception e) {
			System.out.println("풋살장 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public List<FieldDTO> getAllFieldList() {
		List<FieldDTO> fieldList = new LinkedList();
		
		try {
			String query = " SELECT * FROM field ORDER BY FNAME";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				FieldDTO dto = new FieldDTO();
				
				dto.setFid(rs.getString("fid"));
				dto.setFname(rs.getString("fname"));
				dto.setLocation(rs.getString("location"));
				
				fieldList.add(dto);
			}
						 
		} catch (Exception e) {
			System.out.println("getAllFieldList() 예외 발생");
			e.printStackTrace();
		}
		
		return fieldList;
	}
	
	// 풋살장 추가
	public int insertField(FieldDTO dto) {
		int inserted = 0;
		try {
			String query = "INSERT INTO field "
						 + " (fid, fname, location) "
						 + " VALUES (field_id_seq.NEXTVAL, ?, ?) ";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getFname());
			pstmt.setString(2, dto.getLocation());
			
			inserted = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("풋살장 추가 중 예외 발생");
			e.printStackTrace();
		}
		
		return inserted;
	}
}
