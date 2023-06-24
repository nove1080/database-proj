<%@ page import="dto.MemberDTO" %>
<%@ page import="dao.MemberDAO" %>
<%@ page import="utils.JSFunction" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String mid = request.getParameter("userMid");
String passwd = request.getParameter("userPasswd");

MemberDAO dao = new MemberDAO(application);
MemberDTO dto = dao.getMember(mid, passwd);

dao.close();

// 로그인 성공 처리
if(mid.equals(dto.getMid()) && passwd.equals(dto.getPasswd())) {
	session.setAttribute("userMid", mid);
	session.setAttribute("userMname", dto.getMname());
	session.setAttribute("userPhone", dto.getPhone());
	
	String url = "../page/index.jsp";
	if(mid.equals("system")) {
		url = "../page/admin.jsp";
	}
	response.sendRedirect(url);

} 
// 로그인 실패 처리
else {
	String msg = "로그인에 실패하였습니다.";
	JSFunction.alertBack(msg, out);
}
%>