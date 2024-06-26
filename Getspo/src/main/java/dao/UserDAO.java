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
	
	//자동로그인 유저정보 확인
	public UserVO selectUserById(String id) {
		return sqlSession.selectOne("u.select_user", id);
	}
	
	//아아디 찾기
	public UserVO findUserId(UserVO vo) {
		return sqlSession.selectOne("u.forgot_id", vo);
	}
	
	//비밀번호 찾기
	public UserVO findUser(UserVO vo) {
		return sqlSession.selectOne("u.forgot_pwd", vo);
	}
	
	
}
