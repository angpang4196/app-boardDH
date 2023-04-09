<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웰컴페이지</title>
<link rel="stylesheet" href="/resource/css/style.css">
</head>
<body>
	<div>
		<c:choose>
			<c:when test="${sessionScope.logon }">
				<div>
					<b>${logonUser.nick }</b>
					<a href="/user/logout">로그아웃</a>
				</div>	
			</c:when>
			<c:otherwise>
				<div>
					<a href="/user/login">로그인</a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<div>
		<h1>게시판</h1>
		<div>
			<a href="/board/create">글 쓰러가기</a>
		</div>
		<div>
			<a href="/index?arr=writed">등록순</a>
			<a href="/index?arr=views">조회순</a>
			<a href="/index?arr=likes">추천순</a>
		</div>
		<div>
			<table>
				<tr>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회</th>
					<th>추천</th>
				</tr>
				
				<c:forEach items="${list }" var="one">
						<tr>
							<td width="20%" style="text-align: center"><a href="/board/detail?boardId=${one.boardId }">${one.title }</a></td>
							<td width="10%" style="text-align: center">${one.writer }</td>
							<td width="10%" style="text-align: center">${one.writed }</td>
							<td width="10%" style="text-align: center">${one.views }</td>
							<td width="10%" style="text-align: center">${one.likes }</td>
						</tr>
				</c:forEach>
			
			</table>
			<div style="text-align: center; align-items: center">
				<c:set var="currentPage" value="${empty param.page ? 1: param.page }"/>
				<c:if test="${existPrev }">
					<a href="/index?page=${start -1 }">◁</a>
				</c:if>
				<c:forEach begin="${start }" end="${last }" var="p">
					<c:choose>
						<c:when test="${p eq currentPage }">
							<b style="color:green">${p }</b>
						</c:when>
						<c:otherwise>
							<a href="/index?page=${p }">${p }</a> 
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${existNext }">
					<a href="/index?page=${last + 1 }">▷</a>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>