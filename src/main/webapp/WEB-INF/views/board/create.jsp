<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 페이지</title>
<link rel="stylesheet" href="/resource/css/style.css">
</head>
<body style="text-align: center; align-items: center" >
	<h1>게시글 작성</h1>
	<c:if test="${param.cause eq 'error' }">
		<p>게시글의 양식이 맞지 않습니다. 다시 작성해주세요</p>
	</c:if>
	<form action="/board/create-task">
		<c:if test="${!sessionScope.logon }">
			<input type="text" name="writer" placeholder="닉네임"/> | <input type="text" name="boardPass" placeholder="비밀번호"/>
		</c:if>
		<div>
			<input type="text" name="title" placeholder="제목을 입력 해 주세요."/>
		</div>
		<div>
			<textarea name="content" placeholder="내용을 입력 해 주세요." rows="20" cols="100"></textarea>
		</div>
		<button type="submit">게시하기</button>
	</form>
</body>
</html>