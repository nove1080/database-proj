
<%@ page import="java.util.Iterator" %>
<%@ page import="dto.ReservationDTO" %>
<%@ page import="dao.ReservationDAO" %>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="utils.JSFunction" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ReservationDAO dao = new ReservationDAO(application);
String[] values = request.getParameterValues("deleted");

String mid = session.getAttribute("userMid").toString();
String url = "../page/history.jsp";

if(mid.equals("system")) {
	url = "../page/reservationDelete.jsp";
}
// 예약 삭제 처리
for(int i = 0; i < values.length; i++) {
	ReservationDTO dto = new ReservationDTO();
	dto.setNum(values[i]);
	dao.deleteReservation(dto);
}
dao.close();
JSFunction.alertLocation("삭제를 완료하였습니다.", url, out);
%>