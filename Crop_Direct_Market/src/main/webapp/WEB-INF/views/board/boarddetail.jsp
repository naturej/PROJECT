<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js">
	<link href="css/table-base/bootstrap.min.css" rel="stylesheet">
	<link href="css/AdminLTE.css" rel="stylesheet">
    <div id="content">
     <section id="service" class="home-section text-center">
		<div class="heading-about">
			<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
					<div class="section-heading">
					<h2>Board</h2>
					<i class="fa fa-2x fa-angle-down"></i>
					<p>농산물 정보 공유 & 공지사항</p>
					</div>
					</div>
				</div>
			</div>
			
			<table class="table">
				<tr><td colspan="2">${boardDto.subject}</td></tr>
				<tr><td>${boardDto.user_id}</td><td>${boardDto.writedate}</tr>
				<tr><td colspan="2">${boardDto.content}</td></tr>
				<tr><td colspan="2">첨부파일:${boardDto.filename}</td></tr>
			</table>
			
				<a href="boardlist.five">목록</a>
				<a href="boardedit.five?idx=${boardDto.idx}">수정</a>
				<a href="boarddelete.five?idx=${boardDto.idx}">삭제</a>
				<a href="reply.five?idx=${boardDto.idx}">댓글쓰기</a>
			<br>
			<hr>
			
			<table class="table">
                              <thead>
                              <tr>
                                  <th>Num</th>
                                  <th>Content</th>
                                  <th>Date</th>
                                  <th>Userid</th>
                              </tr>
                              </thead>
                              <tbody>
                <c:forEach items="${list}" var="n">
				<tr>
					<td>${n.re_idx}</td><td>${n.re_content}</td><td>${n.re_writedate}</td><td></td>
				</tr>
				</c:forEach>
                              </tbody>
                          </table>
				
				<form action="reply.five?" method="post" enctype="multipart/form-data">
				<input type="hidden" name="idx" value="${boardDto.idx}">
				<input type="text" id="USER_ID" name="USER_ID" />
				 <div class="input-group input-group-sm">
                 <input type="text" class="form-control" id="re_content" name="re_content">
                 <span class="input-group-btn">
                 <button class="btn btn-info btn-flat" type="submit">댓글작성</button>
                 </span>
                 </div>
				
				</form>	
				</div>
				</div>
		</section>
	</div>
</html>