package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.AuthInfoVO;
import vo.UserVO;

public class UserDAO {
	@Autowired
	SqlSession sqlSession;
	
	public UserDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//유저 회원가입
	public int userInsert(UserVO vo) {
		int res = sqlSession.insert("u.insert_user", vo);
		return res;
	}
	
	//아이디 중복확인
	public String selectId(String id) {
		String res = sqlSession.selectOne("u.select_id", id);
		return res;
	}
	
	//유저 로그인
	public UserVO userlogin(UserVO vo) {
		return sqlSession.selectOne("u.user_login", vo);
	}
	
}
