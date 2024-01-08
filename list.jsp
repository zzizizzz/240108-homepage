<%@page import="utils.DateUtils"%>
<%@page import="vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dto.Pagination"%>
<%@page import="dao.BoardDao"%>
<%@page import="utils.NumberUtils"%>
<%@page import="dto.LoginUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>커뮤니티::게시글 목록</title>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="board" name="menu"/>
</jsp:include>

<div class="container">
	<div class="row">
		<div class="col=12">
			<h1>게시글 목록</h1>
			
<%
	//HttpSession에 LOGIN_USER 속성명으로 저장된 로그인된 사용자 정보 조회하기
	LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");

	/*
		요청 URL
			localhost/comm/board/list.jsp
			localhost/comm/board/list.jsp?page =xx
		요청 파라미터
			page=xx
			* 요청파라미터 page는 있을 수도 있고, 없을수도 있다.
	*/
	// 1. 요청 파라미터값을 조회한다.
	int currentPage = NumberUtils.toInt(request.getParameter("page"),1);
	
	// 2. COMM_BOARDS 테이블에 대한 CRUD 기능이 구현된 BoardDao객체를 생성한다.
	BoardDao boardDao = new BoardDao();
	
	// 3.전체 게시글 갯수를 조회한다.
	int totalRows = boardDao.getTotalRows();
	
	// 4 페이징 처리를 지원하는 pagination 객체를 생성한다.
	Pagination pagination = new Pagination(currentPage, totalRows);
	
	// 5. 현재 페이지번호에 해당하는 게시글 목록 조회하기
	Map<String, Object> param = new HashMap<>();
	param.put("begin", pagination.getBegin());
	param.put("end", pagination.getEnd());
	
	List<Board> boardList = boardDao.getBoards(param);
	
	
%>
			
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="45%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>댓글갯수</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
<%
	if(boardList.isEmpty()) {
%>
					<tr>
						<td colspan="5" class="text-center">게시글이 없습니다.</td>
					</tr>
<% 

	}else {
		for(Board board : boardList) {
%>
					<tr>
						<td><%=board.getNo() %></td>
						<td><a href="detail.jsp?no=<%=board.getNo() %>&page=<%=currentPage %>"><%=board.getTitle() %></a></td>
						<td><%=board.getUser().getName() %></td>
						<td><%=board.getReplyCnt() %></td>
						<td><%=DateUtils.toText(board.getCreatedDate()) %></td>
					</tr>
<%
		}
	}
%>
					
				</tbody>
			</table>
			
<%
 	/*
 		페이지 내비게이션 생성하기
 			1.시작페이지번호와 끝페이지번호를 조회해서 해당 범위만큼 표시한다.
 			2. 현재 요청한 페이지가 첫페이지인지, 마지막 페이지인지에 따라서 
 			   이전/다음 링크를 활성화/비활성화한다.
 	*/
 	int beginPage = pagination.getBeginPage();
	int endPage = pagination.getEndPage();
	
	boolean isFirst = pagination.isFirst();
	boolean isLast = pagination.isLast();
%>
			
			<nav>
				<ul class="pagination justify-content-center">
<%
	if(isFirst) {
%>
					<li class="page-item disabled">					
						<a class="page-link" href="">이전</a>
					</li>

<%
	}else{
%>
			<li class="page-item">					
				<a class="page-link" href="list.jsp?page=<%=currentPage -1 %>">이전</a>
			</li>
					
<%
	}
%>
					
<%
	for(int num = beginPage; num <= endPage; num++){
%>
					
			<li class="page-item <%=currentPage == num ? "active" : ""%>">
				<a class="page-link" href="list.jsp?page=<%=num %>"><%=num %></a>
			</li>
<%
	}
%>

<%
	if(isLast) {
%>
					<li class="page-item disabled">
						<a class="page-link" href="">다음</a>
					</li>
<%
	}else {
%>
						<li class="page-item">
						<a class="page-link" href="list.jsp?page=<%=currentPage + 1%>">다음</a>
					</li>
<%
	}
%>
				</ul>
			</nav>
			<div class="text-end">
<%

	if(loginUser !=null) {
%>			
	<a class="btn btn-outline-primary" href="form.jsp">새 글</a>
		
<%
	}else {
%>
	<a class="btn btn-outline-primary disabled" aria-disabled="true" >새 글</a>


<%
	}
%>
			</div>
		</div>
	</div>
</div>
</body>
</html>