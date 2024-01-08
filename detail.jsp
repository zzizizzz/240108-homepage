<%@page import="java.util.List"%>
<%@page import="dao.ReplyDao"%>
<%@page import="vo.Reply"%>
<%@page import="dto.LoginUser"%>
<%@page import="utils.StringUtils"%>
<%@page import="utils.DateUtils"%>
<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>커뮤니티::게시글 상세</title>
</head>
<body>
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="board" name="menu"/>
	</jsp:include>
	
	<div class="container">
		<div class="row mb-3">
			<div class="col-12">
				<h1>게시글 상세</h1>
				
<%
		//HttpSession  객체에 "LOGIN_USER"라는 속성명으로 저장된 인증된 사용자 정보 조회
		LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");
	/*
		요청 URL
			localhost/comm/board/detail.jsp?no=1000&page=3
			localhost/comm/board/detail.jsp?no=1000&page=3&error=deny
		요청 파라미터
			no=xxx&page=xxx&error=xxx
	*/
	
	// 요철 파라미터 조회
	int no = Integer.valueOf(request.getParameter("no"));
	int currentPage = Integer.valueOf(request.getParameter("page"));
	String error = request.getParameter("error");
	
	// COMM_BOARDS 테이블에 대한 CRUD 기능을 제공하는 BoardDao객체 생성
	BoardDao boardDao = new BoardDao();
	
	// BoardDao 객체의 getBoardByNo(int no)를  실행해서 게시글 상세정보 조회하기
	Board board = boardDao.getBoardByNo(no);
	
	// COMM_BOARD_REPLIES에 대한 CRUD 기능을 제공하는 ReplyDao 객체 생성
	ReplyDao replyDao = new ReplyDao();
	
	//ReplyDao의 getRepliesByBoardNo(int boardNo)를 실행해서 해당 게시글의 댓글을 전부 조회하기
	List<Reply> replyList = replyDao.getRepliesByBoardNo(no);
	
	
%>

<%
	if("deny".equals(error)) {
%>

	<div class="alert alert-danger">
		다른 사용자가 작성한 게시글을 삭제 /수정할수 없습니다.
	</div>

<%
	}
%>
				
				<table class= "table">
					<tbody>
						<colgroup>
						<col width ="15%">
						<col width ="35%">
						<col width ="15%">
						<col width ="35%">
						</colgroup>
						<tr>
							<th>번호</th>
							<td><%=board.getNo() %></td>
							<th>댓글갯수</th>
							<td><%=board.getReplyCnt() %></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><%=board.getTitle() %></td>
							<th>작성자</th>
							<td><%=board.getUser().getName() %></td>
						</tr>
						<tr>
							<th>등록일</th>
							<td><%=DateUtils.toText(board.getCreatedDate()) %></td>
							<th>수정일</th>
							<td><%=DateUtils.toText(board.getUpdatedDate()) %></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><%=StringUtils.withBr(board.getContent()) %>
						</tr>
						
					</tbody>
				
				</table>
				
					<div class="d-flext justify-content-between">
<%
	if(loginUser == null || loginUser.getNo() !=board.getUser().getNo()) { 
%>
					<div>
						<a  class="btn btn-warning disabled">수정</a>
						<a  class="btn btn-danger disabled">삭제</a>
					</div>
					
<%
	}
%>
<%
	if(loginUser != null && loginUser.getNo() == board.getUser().getNo()) { 
%>
					<div class="d-flext justify-content-between">
						<a href="modifyform.jsp?no=<%=no %>&page=<%=currentPage %>" class="btn btn-warning">수정</a>
						<a href="delete.jsp?no=<%=no %>&page=<%=currentPage %>" class="btn btn-danger">삭제</a>
					</div>
					
<%
	}
%>
					<a href="list.jsp?page=<%=currentPage %>" class="btn btn-primary float-end">목록</a>
				</div>
			</div>
		</div>		
		<div class="row">
			<div class="col-12">
				<form class="border bg-light p-3 mb-3" 
				method="post" 
				action="insertReply.jsp">
				<input type="hidden" name="boardNo" value="<%=no %>">
				<input type="hidden" name="page" value="<%=currentPage %>">
					<div class="row mb-3">
						<div class="col-sm-11">
						 	<textarea rows="2" class="form-control" name="content"></textarea>
						</div>
						<div class="col-sm-1">
						
							<button type="submit" 
							class="btn btn-outline-primary"
							<%=loginUser == null ? "disabled" : "" %>>등록</button>
						</div>
						
					</div>
				</form>
<%
	if(replyList.isEmpty()) {
%>
				<div class="card mb-3">
					<div class="card-body">댓글이 없습니다</div>
				</div>
				
<%
	}else {
			for(Reply reply : replyList) {

%>
				<div class="card mb-3">
				<div class="card-header py-1">
					<span><%=reply.getUser().getName() %></span>
					<small><%=DateUtils.toText(reply.getCreatedDate()) %></small>
					
					<a href="" class="btn btn-danger btn-sm float-end"><i class="bi-trash"></i></a>
				</div>
				<div class="card-body ph-1">
					<p class="card-text"><%=StringUtils.withBr(reply.getContent()) %></p>
					</div>
					</div>
<%

	}
}
%>
					
				</div>
			</div>
		</div>
</body>

</html>