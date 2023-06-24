package dao;

import javax.servlet.ServletContext;

import common.JDBConnect;
import dto.MemberDTO;

public class MemberDAO extends JDBConnect{
	
	public MemberDAO(ServletContext application) {
		super(application);
	}
	
	// 회원 등록
	public int createMember(MemberDTO dto) {
		int created = 0;
		
		String mid = dto.getMid();
		String passwd = dto.getPasswd();
		String mname = dto.getMname();
		String phone = dto.getPhone();
		
		try {
			String query = "INSERT INTO MEMBER "
						 + " (mid, passwd, mname, phone) "
					     + " VALUES (?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, mid);
			pstmt.setString(2, passwd);
			pstmt.setString(3, mname);
			pstmt.setString(4, phone);
			
			created = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("회원가입 중 예외 발생");
			e.printStackTrace();
		}
		
		return created;
	}
	
	public MemberDTO getMember(String mid, String passwd) {
		MemberDTO dto = new MemberDTO();
		
		try {
			String query = "SELECT * FROM member "
					     + " WHERE mid=? AND passwd=? ";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mid);
			pstmt.setString(2, passwd);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setMid(rs.getString("mid"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setMname(rs.getString("mname"));
				dto.setPhone(rs.getString("phone"));
			}
			
		} catch (Exception e) {
			System.out.println("회원 정보를 가져오는 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
}
