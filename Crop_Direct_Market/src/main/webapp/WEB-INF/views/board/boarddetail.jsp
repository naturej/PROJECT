<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
			<table border="1">
				<tr><td>제목:${boardDto.subject}</td></tr>
				<tr><td>글쓴이: ${boardDto.user_id}</td></tr>
				<tr><td>작성일:${boardDto.writedate}</td></tr>
				<tr><td>내용:${boardDto.content}</td></tr>
				<tr><td>파일:${boardDto.filename}</td></tr>
			</table>
			
				<a href="boardlist.five">목록</a>
				<a href="boardedit.five?idx=${boardDto.idx}">수정</a>
				<a href="boarddelete.five?idx=${boardDto.idx}">삭제</a>
				<a href="reply.five?idx=${boardDto.idx}">댓글쓰기</a>
			<br>
			<hr>
				<table>
				<c:forEach items="${list}" var="n">
				<tr>
					<td class="re_idx">${n.re_idx}</td>
					<td class="re_content">${n.re_content}</td>
					<td class="re_writedate">${n.re_writedate}</td>
					<td class="USER_ID">${n.USER_ID}</td>
				</tr>
				</c:forEach>
				</table>
</body>
</html>