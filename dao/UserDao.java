package dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.IbatisUtil;
import vo.User;

public class UserDao {
	// ibatis 핵심객체를 획득해서 멤버변수에 저장한다.
	private SqlMapClient ibatis = IbatisUtil.getSqlMapClient();
	
	/**
	 * 신규 사용자정보가 포함된 User객체를 전달받아서 데이터베이스에 저장시킨다.
	 * @param user
	 */
	public void insertUser(User user) throws SQLException {
		ibatis.insert("users.insertUser", user);
		
	}
	
	/**
	 * 지정된 사용자 아이디에 해당하는 사용자 정보를 조회해서 반환한다.
	 * @param id 조회할 사용자 아이디
	 * @return 사용자 정보가 포함된 User객체, 일치하는 사용자가 없으면 null이 반환된다.
	 * @throws SQLException
	 */
	public User getUserById(String id) throws SQLException {
		User user = (User) ibatis.queryForObject("users.getUserById", id);
		return user;
	}
	
	/**
	 * 지정된 이메일에 해당하는 사용자 정보를 조회해서 반환한다.
	 * @param email 조회할 이메일
	 * @return 사용자 정보가 포함된 User객체, 일치하는 사용자가 없으면 null이 반환된다.
	 * @throws SQLException
	 */
	public User getUserByEmail(String email) throws SQLException {
		User user= (User) ibatis.queryForObject("users.getUserByEmail", email);
		return user;

	}
}


