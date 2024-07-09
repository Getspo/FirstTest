package dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.OrderVO;
import vo.PayVO;

public class OrderDAO {
	@Autowired
	SqlSession sqlSession;

	public OrderDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 유저행사신청
	public int orderevent(OrderVO user) {
		return sqlSession.insert("o.user_order", user);
	}

	// 결제
	public int savePay(PayVO pay) {
		return sqlSession.insert("o.user_pay", pay);
	}

	// 결제정보 업데이트
	// 결제 정보 업데이트
	public int updatePayOrderIdx(String impUid, int orderIdx) {
		return sqlSession.update("o.updatePayOrderIdx", new UpdatePayOrderIdxParams(impUid, orderIdx));
	}

	// 업데이트 파라미터 클래스
	public static class UpdatePayOrderIdxParams {
		private String impUid;
		private int orderIdx;

		public UpdatePayOrderIdxParams(String impUid, int orderIdx) {
			this.impUid = impUid;
			this.orderIdx = orderIdx;
		}

		public String getImpUid() {
			return impUid;
		}

		public int getOrderIdx() {
			return orderIdx;
		}
	}

}
