<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.ReviewDTO"%>
<%@ page import="dao.ReviewDAO"%>
<%@ page import="utils.JSFunction" %>
<%
String mid = request.getParameter("mid");
String fid = request.getParameter("fid");
String title = request.getParameter("title");
String content = request.getParameter("content");

ReviewDTO dto = new ReviewDTO();
dto.setFid(fid);
dto.setMid(mid);
dto.setTitle(title);
dto.setContent(content);

ReviewDAO dao = new ReviewDAO(application);
int inserted = dao.insertReview(dto);

if(inserted == 1) {
	String msg = "성공적으로 리뷰를 등록하였습니다!";
	String url = "../page/index.jsp";
	JSFunction.alertLocation(msg, url, out);
}
else {
	String msg = "리뷰 등록에 실패하였습니다!";
	JSFunction.alertBack(msg, out);
}

dao.close();
%>