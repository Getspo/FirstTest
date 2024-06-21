package dao;

import org.apache.ibatis.session.SqlSession;

import vo.UserVO;

public class UserDAO {
	
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
		String res = sqlSession.selectOne("u.select_email", id);
		return res;
	}
	
}
