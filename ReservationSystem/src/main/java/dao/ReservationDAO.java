package dao;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import common.JDBConnect;
import dto.ReservationDTO;

public class ReservationDAO extends JDBConnect{
	public ReservationDAO(ServletContext application) {
		super(application);
	}
	
	// 예약 숫자 세기 - 날짜로 범위 지정 가능
	public int getCount(Map<String, Object> map) {
		/**
		 * Map<String, Date>의 key와 value 지정
		 * mid - user의 id
		 * startDate - 시작 날짜
		 * endDate - 종료 날짜
		 */
		int count = 0;
		String query = " SELECT COUNT(*) FROM reservation ";
		
		// mid가 system이 아닌 경우 예약자 명에 따른 예약 조회
		if(map.get("mid") != null && !map.get("mid").toString().equals("system")) {
			query += " WHERE mid = '" + map.get("mid") + "' ";
			
			if(map.get("startDate") != null && map.get("endDate") != null) 
				query += " AND reservation_date BETWEEN " + map.get("startDate") + " AND " + map.get("endDate") + " "; 
		} 
		else if(map.get("startDate") != null && map.get("endDate") != null) {
			query += " WHERE reservation_date BETWEEN " + map.get("startDate") + " AND " + map.get("endDate") + " "; 
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			count = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("예약 숫자 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return count;
	}
	
	// 더미 데이터 추가
	public void addDummyData(int cnt) {
		try {
			String query = " INSERT INTO RESERVATION "
						 + " (fid, mid, reservation_date, start_time, end_time) "
						 + " VALUES(?, ?, ?, ?, ?)";
			
			for(int i = 0; i <= cnt; i++) {
				String dateString = "2023-07-" + ((i%31)+1);
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date utilDate = format.parse(dateString);
				java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "1");
				pstmt.setString(2, "club02");
				pstmt.setDate(3, sqlDate);
				if(i%11 < 10) {
					pstmt.setString(4, "1" + i%11 + ":00");
					if(i%11 == 9)
						pstmt.setString(5, ((i%11)+1) + ":00");
					else 
						pstmt.setString(5, "1" + ((i%11)+1) + ":00");
				} else {
					pstmt.setString(4, i%11 + ":00");
					pstmt.setString(5, ((i%11)+1) + ":00");	
				}
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("더미 데이터 추가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	// 예약 정보 만들기
	public int createReservation(ReservationDTO dto) {
		int created = 0;
		
		try {
			String query = " INSERT INTO reservation "
						 + " (fid, mid, reservation_date, start_time, end_time) "
						 + " VALUES(?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getFid());
			pstmt.setString(2, dto.getMid());
			pstmt.setDate(3, dto.getReservationDate());
			pstmt.setString(4, dto.getStartTime());
			pstmt.setString(5, dto.getEndTime());
			
			created = pstmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("예약 정보 저장 중 예외 발생");
			e.printStackTrace();
		}
		
		return created;
	}
	
	// 최신 예약부터 List에 저장하여 반환 - getReservationListPage() 와 합쳐도 될 것 같다.
	public List<ReservationDTO> getReservationList(String mid) {
		List<ReservationDTO> reservationList = new LinkedList();
		
		try {
			// 가장 가까운 날짜 + 빠른 시간 순서
			String query  = " SELECT * FROM "
						  + "		(SELECT tb.num, tb.mname, tb.fname, tb.reservation_date, tb.start_time, tb.end_time, ROWNUM RNUM FROM " 
						  + " 				(SELECT * FROM member M, field F, reservation R "
						  + " 				 WHERE M.mid = ? AND M.mid=R.mid AND R.fid=F.fid " 
						  + " 				 ORDER BY RESERVATION_DATE ASC, START_TIME ASC) tb ) "
						  + " ORDER BY RNUM ASC ";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReservationDTO dto = new ReservationDTO();
				
				//dto.setFid(rs.getString("fid"));
				//dto.setMid(rs.getString("mid"));
				dto.setNum(rs.getString("num"));
				dto.setFname(rs.getString("fname"));
				dto.setMname(rs.getString("mname"));
				dto.setReservationDate(rs.getDate("reservation_date"));
				dto.setStartTime(rs.getString("start_time"));
				dto.setEndTime(rs.getString("end_time"));
				
				reservationList.add(dto);
			}
		} catch (Exception e) {
			System.out.println("예약 리스트 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return reservationList;
	}
	
	// record의 범위를 지정하여 List를 만들어 반환
	public List<ReservationDTO> getReservationListPage(Map<String, Object> map) {
		List<ReservationDTO> list = new LinkedList();
		
		try {
			// 가장 가까운 날짜 + 빠른 시간 순서
			String query  = " SELECT * FROM "
						  + "		(SELECT tb.num, tb.mname, tb.fname, tb.reservation_date, tb.start_time, tb.end_time, ROWNUM RNUM FROM " 
						  + " 				(SELECT * FROM member M, field F, reservation R ";
			
			// 관리자가 메서드를 호출하면 모든 예약자에 대해 리스트를 뽑는다.
			if(map.get("mid").toString().equals("system")) {
				   query += "				 WHERE M.mid=R.mid AND R.fid=F.fid ";
				   query += " 				 ORDER BY RESERVATION_DATE ASC, START_TIME ASC) tb ) ";
				   
				   if(map.get("startPost") != null && map.get("endPost") != null) {
						query += " WHERE rNum BETWEEN " + map.get("startPost") + " AND " + map.get("endPost") + " ";
				   }
				   query += " ORDER BY RNUM ASC ";
					pstmt = con.prepareStatement(query);
			} 
			else {
				   query += " 				 WHERE M.mid = ? AND M.mid=R.mid AND R.fid=F.fid ";
				   query += " 				 ORDER BY RESERVATION_DATE ASC, START_TIME ASC) tb ) ";
				   
				   if(map.get("startPost") != null && map.get("endPost") != null) {
					   query += " WHERE rNum BETWEEN " + map.get("startPost") + " AND " + map.get("endPost") + " ";
				   }
				   query += " ORDER BY RNUM ASC ";
					pstmt = con.prepareStatement(query);
					pstmt.setString(1, map.get("mid").toString());
			}

			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReservationDTO dto = new ReservationDTO();
				dto.setNum(rs.getString("num"));
				dto.setMname(rs.getString("mname"));
				dto.setFname(rs.getString("fname"));
				dto.setReservationDate(rs.getDate("reservation_date"));
				dto.setStartTime(rs.getString("start_time"));
				dto.setEndTime(rs.getString("end_time"));

				list.add(dto);
			}
		} catch(Exception e) {
			System.out.println("예약 리스트 조회(페이징) 중 예외 발생");
			e.printStackTrace();
		}
		return list;
	}
	
	// 예약 삭제
	public int deleteReservation(ReservationDTO dto) {
		int deleted = 0;
		String query = "DELETE FROM reservation "
				     + " WHERE num = ? ";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.valueOf(dto.getNum()));
			
			deleted = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("예약 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return deleted;
	}
}