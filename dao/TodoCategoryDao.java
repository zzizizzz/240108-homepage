package dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.IbatisUtil;
import vo.TodoCategory;

public class TodoCategoryDao {

	private SqlMapClient ibatis = IbatisUtil.getSqlMapClient();

	@SuppressWarnings("unchecked")
	public List<TodoCategory> getAllCategories() throws SQLException {
		return (List<TodoCategory>) ibatis.queryForList("todo-categories.getAllCategories");
	}
}
