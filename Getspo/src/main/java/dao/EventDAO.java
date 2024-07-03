package dao;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.web.multipart.MultipartFile;

import vo.EventVO;

public class EventDAO {
	
	SqlSession sqlSession;
	
	public EventDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//행사생성하기
	public int eventInsert(EventVO vo) {
		return sqlSession.insert("e.event_insert",vo);
	}
	
	// SummerNote 이미지 파일 저장하기
    public Map<String, Object> SummerNoteImageFile(MultipartFile file) {
        Map<String, Object> resultMap = new HashMap();
        String fileRoot = "C:\\summernoteImg\\";
        String originalFileName = file.getOriginalFilename();
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));

        String saveFileName = UUID.randomUUID() + extension;

        File targetFile = new File(fileRoot + saveFileName);

        try {
            InputStream fileStream = file.getInputStream();
            FileUtils.copyInputStreamToFile(fileStream, targetFile);
            resultMap.put("url", "/summernoteImg/" + saveFileName);
            resultMap.put("responseCode", "success");
        } catch (IOException e) {
            FileUtils.deleteQuietly(targetFile);
            resultMap.put("responseCode", "error");
            e.printStackTrace();
        }
        return resultMap;
    }
    
    //사용자별 이벤트 조회
    public List<EventVO> selectEventByUser(int user_idx){
    	return sqlSession.selectList("e.userevents", user_idx);
    }
	
	//전체 이벤트 조회
    public List<EventVO> allevents(){
    	return sqlSession.selectList("e.allevents");
    }
    
    //전체 이벤트 게시글 수 가져오기
    public int eventcount() {
    	return sqlSession.selectOne("e.event_count");
    }
    
    // 이벤드 디테일 정보 idx별로 가져오기
    public EventVO eventByIdx(int event_idx){
    	return sqlSession.selectOne("e.getevent_idx", event_idx);
    }
    
    //이벤트에 신청된 티켓 수 조회
    public int applieCount(int event_idx) {
    	return sqlSession.selectOne("e.apply_event", event_idx);
    }
	
}











