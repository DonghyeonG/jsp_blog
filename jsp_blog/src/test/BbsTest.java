package test;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import bbs.BbsDAO;
import bbs.BbsDTO;

public class BbsTest {

	public static void main(String[] args) {
		BbsDAO dao=new BbsDAO();
		//create(dao);
		//list(dao);
		//read(dao);
		update(dao);
		//delete(dao);
		//reply(dao);
		//total(dao);
		//checkRefno(dao);
		//createReply(dao);
	}

	private static void createReply(BbsDAO dao) {
		BbsDTO dto=new BbsDTO();
		dto.setWname("홍길동");
		dto.setTitle("게시판 제목");
		dto.setContent("내용내용");
		dto.setPasswd("1234");
		dto.setGrpno(70);
		dto.setIndent(0);
		dto.setAnsnum(0);
		dto.setBbsno(0);
		dto.setFilename("tt.txt");
		dto.setFilesize(123);
		if(dao.create(dto))
			p("생성 완료");
		else
			p("생성 실패");
		
	}
	private static void checkRefno(BbsDAO dao) {
		int bbsno=46;
		if(dao.checkRefno(bbsno))
			p("삭제할 수 없습니다.");
		else
			p("삭제할 수 있습니다.");
				
		
	}

	private static void total(BbsDAO dao) {
		String col="wname";
		String word="왕";
		int total=dao.total(col, word);
		p("total: "+total);
		
	}

	private static void reply(BbsDAO dao) {
		BbsDTO dto=dao.readReply(5);
		p(dto);
		
	}

	private static void delete(BbsDAO dao) {
		int bbsno=8;
		BbsDTO dto=dao.read(bbsno);
		p(dto);
		if(dao.delete(bbsno))
			p("삭제 완료");
		else
			p("삭제 실패");
	}

	private static void update(BbsDAO dao) {
		int bbsno=77;
		BbsDTO dto=dao.read(bbsno);
		p(dto);
		p("================================");
		dto.setWname("테스터1");
		dto.setTitle("제목");
		dto.setContent("내용");
		dto.setBbsno(bbsno);
		dto.setFilename("test123.txt");
		dto.setFilesize(100);
		if(dao.update(dto)){
			p("수정 완료");
			dto=dao.read(bbsno);
			p(dto);
		}else
			p("수정 실패");
		
		
	}

	private static void read(BbsDAO dao) {
		BbsDTO dto=dao.read(5);
		p(dto);
		
		
	}

	private static void list(BbsDAO dao) {
		Map map=new HashMap<>();
		String col="wname";
		String word="";
		int sno=1;
		int eno=10;
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		List<BbsDTO> list=dao.list(map);
		Iterator<BbsDTO> iter=list.iterator();
		while(iter.hasNext()){
			p(iter.next());
			p("");
			p("===============================");
		}
		
	}

	private static void p(BbsDTO dto) {
		p("번호: "+dto.getBbsno());
		p("제목: "+dto.getWname());
		p("제목: "+dto.getTitle());
		p("조회수: "+dto.getViewcnt());
		p("등록일: "+dto.getWdate());
		p("--------------------------");
		p("내용: "+dto.getContent());
		p("비밀번호: "+dto.getPasswd());
		p("부모글번호: "+dto.getGrpno());
		p("답변길이: "+dto.getIndent());
		p("답변순서: "+dto.getAnsnum());
		p("파일: "+dto.getFilename());
		p("파일: "+dto.getFilesize());

//		 grpno   NUMBER(7)     DEFAULT 0, -- 부모글 번호 
//		  indent  NUMBER(2)     DEFAULT 0, -- 답변여부,답변의 깊이
//		  ansnum  NUMBER(5)     DEFAULT 0, -- 답변 순서 
	}

	private static void create(BbsDAO dao) {
		BbsDTO dto=new BbsDTO();
		dto.setWname("홍길동");
		dto.setTitle("게시판 제목");
		dto.setContent("내용내용");
		dto.setPasswd("1234");
		dto.setFilename("");
		if(dao.create(dto))
			p("생성 완료");
		else
			p("생성 실패");
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

}
