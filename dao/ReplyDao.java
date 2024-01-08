package dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.IbatisUtil;
import vo.Reply;

public class ReplyDao {
	
	private SqlMapClient ibatis = IbatisUtil.getSqlMapClient();
	
	public void inseryReply(Reply reply) throws SQLException{
		ibatis.insert("board-replies.insertReply", reply);
		
	}
	@SuppressWarnings("unchecked")
	public List<Reply> getRepliesByBoardNo(int boardNo) throws SQLException{
		return (List<Reply>) ibatis.queryForList("board-replies.getRepliesByBoardNo", boardNo);
	}

}
