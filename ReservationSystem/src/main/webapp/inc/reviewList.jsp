<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="dto.ReviewDTO"%>
<%@ page import="dao.ReviewDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
// 리뷰 조회를 위한 데이터 준비
String searchWord = request.getParameter("searchWord");
String searchField = request.getParameter("searchField");

Map<String, Object> map = new HashMap<String, Object>();
if (searchWord != null && searchField != null && !searchField.trim().equals("")) {
	map.put("searchWord", searchWord);
	map.put("searchField", searchField);	
}
// 리뷰 조회
ReviewDAO dao = new ReviewDAO(application);
List<ReviewDTO> list = dao.getReviewList(map);

dao.close();
%>
	<div id="wrap">
		<table align="center" width="70%">
			<tr>
				<td>
				<form action="" method="get">
					<select name="searchWord">
						<option value="fname">풋살장 이름</option>
						<option value="mid">작성자</option>
					</select>
					<input type="text" name="searchField" placeholder="내용을 입력해주세요."/>
					<input type="submit" value="전송"/>
				</form>
				</td>
			</tr>
		</table>
		<!-- 리뷰 조회 -->
		<table align="center" width="70%">
			<tr>
				<th>풋살장</th>
				<th>작성자</th>
				<th>제목</th>
				<th>내용</th>
				<th>게시일</th>
			</tr>
			<c:forEach items="<%= list %>" var="review">
			    <c:set var="fname" value="${review.getFname()}"/>
			    <c:set var="mid" value="${review.getMid()}"/>								
			    <c:set var="title" value="${review.getTitle()}"/>
			    <c:set var="content" value="${review.getContent()}"/>
			    <c:set var="postdate" value="${review.getPostdate()}"/>
			    <c:set var="num" value="${review.getNum()}"/>
			    <tr>
			    	<td>${ fname }</td>
			    	<td>${ mid }</td>
			    	<td>${ title }</td>
			    	<td>${ content }</td>
			    	<td>${ postdate }</td>
			    </tr>
			</c:forEach>				
		</table>
	</div>