package dao;

import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletContext;
import common.JDBConnect;
import dto.HistoryDTO;

public class HistoryDAO extends JDBConnect {
	public HistoryDAO(ServletContext application) {
		super(application);
	}
	
	// 사용자의 아이디로 예약된 내역 조회
	public List<HistoryDTO> getHistoryList(String fid) {
		List<HistoryDTO> historyList = new LinkedList<HistoryDTO>();
		
		try {
			
		} catch(Exception e) {
			System.out.println("예약 내역 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return historyList;
	}
}
