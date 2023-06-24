<%@ page import="utils.JSFunction"%>
<%@ page import="dto.ReservationDTO" %>
<%@ page import="dao.ReservationDAO" %>
<%@ page import="java.util.StringTokenizer" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String mid = session.getAttribute("userMid").toString();
String fid = request.getParameter("fid");
String dateStr = request.getParameter("date");	// 전달받은 형식 : 2023-05-12
String startTime = request.getParameter("startTime");
String endTime = request.getParameter("endTime");


SimpleDateFormat sourceFormat = new SimpleDateFormat("yyyy-MM-dd");
Date tmp = sourceFormat.parse(dateStr);

ReservationDAO dao = new ReservationDAO(application);
ReservationDTO dto = new ReservationDTO();

// 예약 정보 생성
dto.setFid(fid);
dto.setMid(mid);
dto.setReservationDate(new java.sql.Date(tmp.getTime()));
dto.setStartTime(startTime);
dto.setEndTime(endTime);

// 예약 저장
int created = dao.createReservation(dto);
dao.close();
if(created == 1) {
	String msg = dto.getReservationDate() + "일 "
			   + dto.getStartTime() + " ~ " + dto.getEndTime()
			   + " 예약을 완료하였습니다. ";
	
	String url = "../page/index.jsp";
	
	JSFunction.alertLocation(msg, url, out);
} 
else {
	JSFunction.alertBack("예약 정보를 저장하는데 실패하였습니다.", out);
}
%>