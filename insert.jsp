<%@page import="dao.BoardDao"%>
<%@page import="vo.User"%>
<%@page import="dao.UserDao"%>
<%@page import="vo.Board"%>
<%@page import="dto.LoginUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");
	if(loginUser==null) {
		response.sendRedirect("../loginform.jsp?error=deny");
		return;
	}
	
	/*
		요청 URL
			localhost/comm/board/insert.jsp
		요청파라미터
			title=xxx&content=xxx
			*요청메세지의 바디부
			
	*/
	
	// 1. 요청 파라미터 값을 조회한다.
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// 2. 게시글 정보를 저장할 Board객체를 생성한다.
	Board board = new Board();
	
	//3. 생성된 Board객체에 조회된 요청파라미터값을 저장한다.
	board.setTitle(title);
	board.setContent(content);
	
	//4. 작성자 정보를 저회해서 Board객체에 저장한다.
	User user = new User();
	user.setNo(loginUser.getNo());
	
	 board.setUser(user);
	 
	 // 5.COMM_BOARDS 테이블에 대한 CRUD작업이 구현된 BoardDao객체를 생성한다.
	 BoardDao boardDao = new BoardDao();
	 
	 //6. BoardDao객체의 insertBoard(Board board) 메소드를 실행시켜서 테이블에 저장시킨다.
	 boardDao.insertBoard(board);
	 
	 //7. 게시글 목록을 요청하는 list.jsp를 재요청하게 하는 응답을 보낸다.
	 response.sendRedirect("list.jsp");
	 
%>









