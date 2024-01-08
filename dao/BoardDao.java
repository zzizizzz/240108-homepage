package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.IbatisUtil;
import vo.Board;

public class BoardDao {
	private SqlMapClient ibatis = IbatisUtil.getSqlMapClient();
	/**
	 * 신규 게시글 정보가 포함된 Board객체를 전달받아서 게시글정보를 테이블에 저장시킨다. 
	 * @param board 신규 게시글 정보가 포함된 Board 객체
	 * @throws SQLException
	 */
	public void insertBoard(Board board) throws SQLException{
		ibatis.insert("boards.insertBoard", board);
		
	}
	
	/**
	 * 게시글의 전체 행 갯수를 반환한다.
	 * @return 전체 행의 갯수
	 * @throws SQLException
	 */
	public int getTotalRows() throws SQLException{
		return (Integer) ibatis.queryForObject("boards.getTotalRows");
	}
	/**
	 *  게시글 목록을 반환한다.
	 * @param param 게시글 목록 조회조건을 포함하는 Map객체다.
	 * @return 게시글 목록
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<Board> getBoards(Map<String, Object> param) throws SQLException{
		return(List<Board>) ibatis.queryForList("boards.getBoards", param);
	}
	
	/**
	 *  지정된 게시글 번호에 해당하는 게시글 상세 정보를 조회해서 반환한다.
	 * @param no 조회할 게시글 번호
	 * @return 게시글 정보를 포함하는Board객체
	 * @throws SQLException
	 */
	public Board getBoardByNo(int no) throws SQLException{
		return (Board) ibatis.queryForObject("boards.getBoardByNo", no);
	}
	
	/**
	 * 변경된 내용이 포함된 정보를 전달받아서 테이블에 반영시킨다.
	 * @param board 변경된 내용이 포함된 내용이 포함된 Board객체
	 * @throws SQLException
	 */
	public void updateBoard(Board board) throws SQLException{
		ibatis.update("boards.updateBoard", board);
	}
}



















