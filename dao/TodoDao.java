package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.IbatisUtil;
import vo.Todo;

public class TodoDao {

	private SqlMapClient ibatis = IbatisUtil.getSqlMapClient();
	
	public void insertTodo (Todo todo) throws SQLException{
		ibatis.insert("todos.insertTodo", todo);
}
	
	public int getTotalRows() throws SQLException{
		return (Integer) ibatis.queryForObject("todos.getTotalRows");
		
	}
	@SuppressWarnings("unchecked")
	public List<Todo> getTodos(Map<String, Object> param) throws SQLException{
		return(List<Todo>) ibatis.queryForList("todos.getTodos", param);
	}
}
