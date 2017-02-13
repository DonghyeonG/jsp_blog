package test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import address.AddressDAO;
import address.AddressDTO;

public class AddressTest {
	public static void main(String[] args){
		AddressDAO dao=new AddressDAO();
		list(dao);
		//create(dao);
		//read(dao);
		//update(dao);
		//delete(dao);
	}

	private static void delete(AddressDAO dao) {
		if(dao.delete(5))
			p("삭제 완료");
		else
			p("삭제 실패");
	}

	private static void update(AddressDAO dao) {
		int no=4;
		AddressDTO dto=new AddressDTO();
		p("<변경 전>");
		dto=dao.read(no);
		p(dto);	
		
		dto.setPhone("010-5656-7845");
		dto.setZipcode("12486");
		dto.setAddress1("서울시 종로구");
		dto.setAddress2("관철동 12-12");
		dto.setNo(no);
			
		if(dao.update(dto)){
			p("");
			p("<변경 후>");
			dto=dao.read(no);
			p(dto);
		}else
			p("변경실패");
	
	}

	private static void create(AddressDAO dao) {
		AddressDTO dto=new AddressDTO();
		dto.setName("무지");
		dto.setPhone("010-3232-5656");
		dto.setZipcode("55612");
		dto.setAddress1("서울시 종로구");
		dto.setAddress2("관철동");
		
		if(dao.create(dto))
			p("생성 완료");
		else
			p("생성 실패");
	}

	private static void read(AddressDAO dao) {
		AddressDTO dto=dao.read(3);
		p(dto);
		
	}

	private static void list(AddressDAO dao) {
		Map map=new HashMap();
		String col="wdate";
		String word="11";
		int sno=1;
		int eno=2;
		map.put("col",col);
		map.put("word",word);
		map.put("sno",sno);
		map.put("eno",eno);
		
		List<AddressDTO> list=dao.list(map);
		for(int i=0;i<list.size();i++){
			p(list.get(i));
			p("-------------------------");
		}
		
	}

	private static void p(AddressDTO dto) {
		p("번호: "+dto.getNo());
		p("이름: "+dto.getName());
		p("등록일: "+dto.getWdate());
		p("-------------------------");
		p("전화번호: "+dto.getPhone());
		p("우편번호: "+dto.getZipcode());
		p("주소1: "+dto.getAddress1());
		p("주소2: "+dto.getAddress2());
	}

	private static void p(String string) {
		System.out.println(string);
		
	}
}
