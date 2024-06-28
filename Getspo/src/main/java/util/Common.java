package util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Common {
	//객체 관리를 편하게 하기위한 클래스
	//게시판 별로 한 페이지에 보여질 게시글 수가 상이할 수 있으므로
	//관리를 편리하게 할 수 있도록 내부클래스(class안의 class)를 활용
	public static class Board{
		
		public static final String VIEW_PATH = "/WEB-INF/views/main/";
		
		//한 페이지당 보여줄 게시글 수
		public final static int BLOCKLIST = 4;
		
		//한 화면에 보여지는 페이지 메뉴의 수
		// <- 1 2 3 ->
		public final static int BLOCKPAGE = 3;
	}
	
	//메인
	public static class Main{
	      
	      public static final String VIEW_PATH = "/WEB-INF/views/";
	      
	   }
	
	//로그인
	public static class Sign{
	      
	      public static final String VIEW_PATH = "/WEB-INF/views/signin/";
	      
	   }
	
	//마이페이지
	public static class Mypage {
		
		public static final String VIEW_PATH = "/WEB-INF/views/mypage/";
		
	}
	
	//행사
	public static class Event{
		  public static final String VIEW_PATH = "/WEB-INF/views/event/";
	}
	
	
	//호스트센터
	public static class Host {

	      public static final String VIEW_PATH = "/WEB-INF/views/host/";

	}
	
	 public static class SecurePwd{
	         
	         //비밀번호 암호화 메서드
	         public static String encodePwd(String pwd) {
	            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	            String encodePwd = encoder.encode(pwd);//비밀번호 암호화
	            return encodePwd;
	         }
	         
	          // 비밀번호 비교 메서드
	          public static boolean isPwdMatch(String rawPwd, String encodedPwd) {
	              BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	              return encoder.matches(rawPwd, encodedPwd);
	          }
	         
	   }

	
	/*
	 * //QnA 페이징 관련 public static class Comment{ public static final String
	 * VIEW_PATH = "/WEB-INF/views/comment/"; public final static int BLOCKLIST = 3;
	 * public final static int BLOCKPAGE = 3; }
	 */
}
