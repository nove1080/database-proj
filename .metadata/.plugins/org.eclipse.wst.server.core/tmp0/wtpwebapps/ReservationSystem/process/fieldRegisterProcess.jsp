<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="utils.JSFunction" %>
<%@ page import="dao.FieldDAO" %>
<%@ page import="dto.FieldDTO" %>
<%
String fname = request.getParameter("newFname");
String location = request.getParameter("newLocation");

FieldDTO dto = new FieldDTO();
dto.setFname(fname);
dto.setLocation(location);

FieldDAO dao = new FieldDAO(application);

if(dao.insertField(dto) != 1) {
	String msg = "풋살장 추가 실패";
	JSFunction.alertBack(msg, out);
} 
else {
	String msg = "풋살장 등록 완료";
	String url = "../page/admin.jsp";
	JSFunction.alertLocation(msg, url, out);	
}
%>
