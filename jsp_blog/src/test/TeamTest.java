package test;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import team.TeamDAO;
import team.TeamDTO;

public class TeamTest {
	public static void main(String[] args){
		TeamDAO dao=new TeamDAO();
		//list(dao);
		//create(dao);
		//read(dao);
//		update(dao);
		//delete(dao);
		//total(dao);
	}
	private static void total(TeamDAO dao) {
		String col="phone";
		String word="";
		int total=dao.total(col, word);
		p("total: "+total);
		
	}

	private static void delete(TeamDAO dao) {
		if(dao.delete(17))
			p("삭제 완료");
		else
			p("삭제 실패");	
	}

	private static void update(TeamDAO dao) {
		int no=17;
		TeamDTO dto=new TeamDTO();
		p("<변경 전>");
		dto=dao.read(no);
		p(dto);
		dto.setPhone("010-2222-2222");
		dto.setZipcode("12546");
		dto.setAddress1("1212");
		dto.setAddress2("4545");
		dto.setSkillstr("Java, JS");
		dto.setHobby("게임");
		if(dao.update(dto)){	
			p("<변경 후>");
			dto=dao.read(no);
			p(dto);
		}else
			p("변경 실패");
		
		
	}

	private static void read(TeamDAO dao) {
		int no=10;
		TeamDTO dto=dao.read(no);
		p(dto);
		p("==============================");
	}

	private static void create(TeamDAO dao) {
		TeamDTO dto=new TeamDTO();
		dto.setName("콘");
		dto.setGender("남자");
		dto.setPhone("010-5665-7894");
		dto.setZipcode("15634");
		dto.setAddress1("서울시");
		dto.setAddress2("종로구");
		dto.setSkillstr("java,JSP,MVC");
		dto.setHobby("게임");
		dto.setFilename("친구.jpg");
		if(dao.create(dto))
			p("생성 완료");
		else
			p("성성 실패");
	}

	private static void list(TeamDAO dao) {
		Map map=new HashMap<>();
		String col="name";
		String word="길";
		int sno=1;
		int eno=5;
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<TeamDTO> list=dao.list(map);
		Iterator<TeamDTO> iter=list.iterator();
		while(iter.hasNext()){
			p(iter.next());
			p("==============================");
		}
		
//		for(int i=0;i<list.size();i++){
//			p(list.get(i));
//		}	
	}

	private static void p(TeamDTO dto) {
		p("----------목록-------------");
		p("번호: "+dto.getNo());
		p("이름: "+dto.getName());
		p("전화번호: "+dto.getPhone());
		p("기술: "+dto.getSkillstr());
		p("파일: "+dto.getFilename());
		p("----------전체-------------");
		p("성별: "+dto.getGender());
		p("우편번호: "+dto.getZipcode());
		p("주소1: "+dto.getAddress1());
		p("주소2: "+dto.getAddress2());
		p("취미: "+dto.getHobby());
	}
	private static void p(String string) {
		System.out.println(string);		
	}
}
