<%@ page import="dto.MemberDTO"%>
<%@ page import="dao.MemberDAO"%>
<%@ page import="utils.JSFunction" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
MemberDTO dto = new MemberDTO();
MemberDAO dao = new MemberDAO(application);

String mid = request.getParameter("userMid");
String passwd = request.getParameter("userPasswd");
String mname = request.getParameter("userMname");
String phone = request.getParameter("userPhone");

dto.setMid(mid);
dto.setPasswd(passwd);
dto.setMname(mname);
dto.setPhone(phone);

int created = dao.createMember(dto);
if(created == 1) {
	String msg = "회원가입에 성공하였습니다.";
	String url = "../page/loginForm.jsp";
	JSFunction.alertLocation(msg, url, out);
} else {
	String msg = "회원가입에 실패하였습니다.";
	JSFunction.alertBack(msg, out);
}
dao.close();
%>