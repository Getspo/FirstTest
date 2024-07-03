package dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.web.multipart.MultipartFile;

import service.Base64Util;
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

        String saveFileName = System.currentTimeMillis() + extension;

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
    
 // Base64 이미지를 파일로 저장하는 메서드
    public String saveBase64Image(String base64Image, String fileRoot) throws IOException {
        // base64 문자열에서 데이터 부분만 추출
        String[] parts = base64Image.split(",");
        String mimeType = parts[0].split(":")[1].split(";")[0];
        String imageString = parts[1];
        

        // MIME 타입으로부터 파일 확장자 추출
        String extension = mimeType.split("/")[1];

        // 파일명 생성 (현재 시간 기반)
        String saveFileName = System.currentTimeMillis() + "." + extension;
        File file = new File(fileRoot + saveFileName);

        // base64 문자열을 디코딩하여 파일에 쓰기
        byte[] imageBytes = Base64Util.decode(imageString);
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(file);
            fos.write(imageBytes);
        } finally {
            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return "/summernoteImg/" + saveFileName;
    }

    // HTML 콘텐츠에서 base64 이미지를 파일로 저장하고 경로를 업데이트하는 메서드
    public String processHtmlContent(String htmlContent, String fileRoot) throws IOException {
        // base64 이미지 패턴 찾기
        String base64Pattern = "data:image/[^;]+;base64[^\"']*";
        Pattern pattern = Pattern.compile(base64Pattern);
        Matcher matcher = pattern.matcher(htmlContent);

        // HTML 콘텐츠 업데이트
        StringBuffer updatedContent = new StringBuffer();
        while (matcher.find()) {
            String base64Image = matcher.group();
            String imageUrl = saveBase64Image(base64Image, fileRoot);
            matcher.appendReplacement(updatedContent, imageUrl);
        }
        matcher.appendTail(updatedContent);

        return updatedContent.toString();
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











