<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.sql.Date"%>
<%@ page import="utils.BoardPage" %>
<%@ page import="dto.ReservationDTO" %>
<%@ page import="dao.ReservationDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../process/isLoggedIn.jsp" %>
<%
ReservationDAO dao = new ReservationDAO(application);

String userMid = session.getAttribute("userMid").toString();
String userMname = session.getAttribute("userMname").toString();

// 현재 페이지
int currentPage = 1;
String tempPageNum = request.getParameter("page");
if(tempPageNum != null && !tempPageNum.trim().equals("")) 
	currentPage = Integer.parseInt(tempPageNum);

// 페이지, 블록 정보
Map<String, Object> countMap = new HashMap<String, Object>();
countMap.put("mid", userMid);
	
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockSize = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPost = dao.getCount(countMap);
int totalPage = (int)Math.ceil(totalPost / (double)pageSize);

// 페이지 별 가져올 예약 개수
int startPost = (currentPage - 1) * pageSize + 1;
int endPost = currentPage * pageSize;

// 메서드 호출을 위한 매개변수 준비
Map<String, Object> rangeMap = new HashMap<String, Object>();
rangeMap.put("mid", userMid);
rangeMap.put("startPost", Integer.valueOf(startPost));
rangeMap.put("endPost", Integer.valueOf(endPost));

// 예약 정보 불러오기(페이징)
List<ReservationDTO> reservationList = dao.getReservationListPage(rangeMap);

dao.close();
%>
<div id="wrap">
		<form action="../process/reservationDeleteProcess.jsp" method="POST">
		<table align="center">
			<tr>
				<th>번호</th>
				<th>풋살장</th>
				<th>예약자</th>
				<th>일자</th>
				<th>시작시간</th>
				<th>종료시간</th>
				<th>선택</th>
			</tr>
			<c:choose>
				<c:when test="<%= reservationList.isEmpty() %>" >
					<tr>
						<td colspan="7">예약 내역이 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise >
					<c:set var="virtualNum" value="<%= totalPost - (currentPage - 1) * 10 %>" />
					<c:forEach items="<%= reservationList %>" var="reservation">
						<c:set var="num" value="${ reservation.getNum() }"/>
						<c:set var="fname" value="${ reservation.getFname() }"/>
						<c:set var="mname" value="${ reservation.getMname() }"/>
						<c:set var="date" value="${ reservation.getReservationDate() }"/>
						<c:set var="startTime" value="${ reservation.getStartTime() }"/>
						<c:set var="endTime" value="${ reservation.getEndTime() }"/>
						
						<tr>
							<td>${ virtualNum = virtualNum - 1 }</td>
							<td>${ fname }</td>
							<td>${ mname }</td>
							<td>${ date }</td>
							<td>${ startTime }</td>
							<td>${ endTime }</td>
							<td><input type="checkbox" name="deleted" value=${ num } /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<!-- 페이지 이동 블록 -->
		<table align="center">
			<tr>
				<td>
				<div class="paging">
				<%= BoardPage.pagingStr(totalPost, currentPage, blockSize, pageSize, "history.jsp") %>
				</div>
				</td>
				<td width="15%"><button type="submit">삭제하기</button></td>
			</tr>
		</table>
		</form>
	</div>