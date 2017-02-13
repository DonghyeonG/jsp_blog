package test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import memo.MemoDAO;
import memo.MemoDTO;

public class MemoTest {
	public static void main(String[] args){
		MemoDAO dao=new MemoDAO();
		list(dao);
		//create(dao);
		//read(dao);
		//update(dao);
		//delete(dao);
		//total(dao);
	}

	private static void total(MemoDAO dao) {
		int total=dao.total("title", "");
		p("total: "+total);
	}

	private static void delete(MemoDAO dao) {
		if(dao.delete(205))
			p("삭제 완료");
		else
			p("삭제 실패");		
	}

	private static void update(MemoDAO dao) {
		int memono=10;
		MemoDTO dto=dao.read(memono);
		p("변경 전");
		p("=======================");
		p(dto);
		p("");
		dto.setTitle("변경된 제목1");
		dto.setContent("변경된 내용1");
		dto.setMemono(memono);
		if(dao.update(dto)){
			p("변경 후");
			p("=======================");
			dto=dao.read(memono);
			p(dto);
		}else
			p("변경 실패");
		
	}

	private static void read(MemoDAO dao) {
		MemoDTO dto=dao.read(10);
		p(dto);
		
	}

	private static void create(MemoDAO dao) {
		MemoDTO dto=new MemoDTO();		
		dto.setTitle("제목이에요");
		dto.setContent("내용이에요 !");
		if(dao.create(dto))
			p("생성 완료");
		else
			p("생성 실패");		
	}

	private static void list(MemoDAO dao) {
		String col ="title";
		String word ="일";
		Map map=new HashMap();
		map.put("col",col);
		map.put("word", word);
		map.put("sno",1);
		map.put("eno",5);
		List<MemoDTO> list=dao.list(map);
		for(int i=0;i<list.size();i++){
			p(list.get(i));
			p("========================");
		}
	}

	private static void p(MemoDTO dto) {
		p("번호: "+dto.getMemono());
		p("제목: "+dto.getTitle());
		p("내용: "+dto.getContent());
		p("등록날짜: "+dto.getWdate());
		p("조회수: "+dto.getViewcnt());
		
	}

	private static void p(String string) {
		System.out.println(string);
	
	}
}
