<%@ page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if (session.getAttribute("userMid") == null) {
	String msg = "로그인 후 이용가능합니다.";
	String url = "../page/loginForm.jsp";
	JSFunction.alertLocation(msg, url, out);
}
%>