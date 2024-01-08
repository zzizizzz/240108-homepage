<%@page import="dto.LoginUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		로그인 여부를 체크해서 로그인되지 않은 사용자가 이 페이지를 이용할 수 없게 하기
	      1. HttpSession에 저장된 로그인된 사용자 정보를 조회한다.
	      2. 로그인된 사용자 정보가 존재하지 않으면 로그인폼을 재요청하는 URL을 응답으로 보낸다.
	      	 localhost/comm/loginfor.jsp?error=deny
	      
	      	 * 상대경로 결정하기
	      	 	현재 URL = localhost/comm/board/form.jsp
	      	 	기준 URL = localhost/comm/board/
	      	 	
	      	 	목적 URL = localhost/comm/loginform.jsp
	      	 	상대 경로 = ../loginform.jsp
	*/
	LoginUser loginUser= (LoginUser) session.getAttribute("LOGIN_USER");
	if(loginUser==null) {
		response.sendRedirect("../loginform.jsp?error=deny");
	}
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>bootstrap</title>
</head>
<body>
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="board" name="menu"/>
	</jsp:include>
	
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h1>게시글 등록폼</h1>
				
				<form class="border bg-light p-3" method="post" action="insert.jsp">
					<div class="form-group mb-3">
						<label class="form-label">제목</label>
						<input type="text" class="form-control" name="title">
					</div>
					
					<div class="form-group mb-3">
						<label class="form-label">내용</label>
						<textarea rows="10" class="form-control" name="content"></textarea>
					</div>
					<div class="text-end">
					 <a class= "btn btn-secondary" href="list.jsp">취소</a>
					 <button type="submit" class="btn btn-primary">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>