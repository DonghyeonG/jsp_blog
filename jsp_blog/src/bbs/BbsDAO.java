package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sun.org.apache.bcel.internal.generic.DALOAD;

public class BbsDAO {
	public boolean checkRefno(int bbsno){
		boolean flag=false;
		Connection con=utility.DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append(" select count(refno) from bbs");
		sql.append(" where refno = ? ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				if(rs.getInt(1)>0)
					flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			utility.DBClose.close(rs, pstmt, con);
		}
		
		return flag;
	}
	public int total(String col, String word){
		int total = 0;
		Connection con = utility.DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) ");
		sql.append(" from bbs ");
		if(word.trim().length()>0)
		sql.append(" where "+col+" like '%'||?||'%' ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(1, word);
			rs=pstmt.executeQuery();
			if(rs.next())
				total=rs.getInt(1);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			utility.DBClose.close(rs, pstmt, con);
		}
		
		
		return total;
	}
	
	public void upAnsnum(Map map){
		Connection con=utility.DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		int grpno=(Integer)map.get("grpno");
		int ansnum=(Integer)map.get("ansnum");
		sql.append("update bbs set ansnum=ansnum+1 where grpno=? and ansnum>?");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean createReply(BbsDTO dto){
		boolean flag=false;
		Connection con=utility.DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		try {
			pstmt=con.prepareStatement(sql.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		sql.append(" INSERT INTO bbs(bbsno, wname, title, ");
		sql.append(" content, passwd, wdate, grpno,   ");
		sql.append(" indent, ansnum,refno,filename,filesize)  ");
		sql.append(" VALUES( " );
		sql.append(" (SELECT NVL(MAX(bbsno), 0)+1 FROM bbs), ");
		sql.append(" ?, ?, ?, ?, sysdate, ");
		sql.append(" ?, ?, ?, ?, ?,? ) ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getGrpno());//★부모의grpno
			pstmt.setInt(6, dto.getIndent()+1);//★부모의indent+1
			pstmt.setInt(7, dto.getAnsnum()+1);//★부모의ansnum+1
			pstmt.setInt(8, dto.getBbsno());//★부모의 글번호 등록
			pstmt.setString(9, dto.getFilename());
			pstmt.setInt(10, dto.getFilesize());
					
			if(pstmt.executeUpdate()>0)
				flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}utility.DBClose.close(pstmt, con);
		
		return flag;
	}
	
	public boolean delete(int bbsno){
		boolean flag=false;
		Connection con=utility.DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append("delete from bbs where bbsno=?");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			if(pstmt.executeUpdate()>0)
				flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean update(BbsDTO dto){	
		boolean flag=false;
		Connection con=utility.DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append(" update bbs set wname=?,title=?,content=?, ");
		if(dto.getFilesize()>0 ||dto.getFilename()=="")
			sql.append(" filename=?,filesize=? ");
		sql.append(" where bbsno=? ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			int i=0;
			pstmt.setString(++i, dto.getWname());
			pstmt.setString(++i, dto.getTitle());
			pstmt.setString(++i, dto.getContent());
			if(dto.getFilesize()>0||dto.getFilename()==""){
				pstmt.setString(++i, dto.getFilename());
				pstmt.setInt(++i, dto.getFilesize());				
			}
			pstmt.setInt(++i, dto.getBbsno());
			
			if(pstmt.executeUpdate()>0)
				flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} utility.DBClose.close(pstmt, con);
		
		return flag;
	}
	
	public boolean passCheck(Map map) {
		boolean flag = false;
		Connection con = utility.DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int bbsno = (Integer) map.get("bbsno");
		String passwd = (String) map.get("passwd");

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT COUNT(bbsno) as cnt  ");
		sql.append(" FROM bbs  ");
		sql.append(" WHERE bbsno=? AND passwd=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			pstmt.setString(2, passwd);

			rs = pstmt.executeQuery();  //글번호와 비밀번호가 일치하는  투플이 1개이상 나오면 패스워드가 일치.
			rs.next();
			int cnt = rs.getInt("cnt");

			if (cnt > 0)
				flag = true; // 올바른 패스워드

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			utility.DBClose.close(rs, pstmt, con);
		}

		return flag;
	}
	 
	public BbsDTO read(int bbsno){
		BbsDTO dto=null;
		Connection con=utility.DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append("select bbsno,wname,title,content,viewcnt,wdate,filename,filesize from bbs where bbsno=?");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dto=new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setFilename(rs.getString("Filename"));
				dto.setFilesize(rs.getInt("Filesize"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} utility.DBClose.close(rs, pstmt, con);
		
		return dto;
	}

	public void upViewcnt(int bbsno){
		Connection con=utility.DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append("update bbs set viewcnt=viewcnt+1 where bbsno=?");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} utility.DBClose.close(pstmt, con);
		
	}
	
	public List<BbsDTO> list(Map map){
		List<BbsDTO> list=new ArrayList<BbsDTO>();
		BbsDTO dto=null;
		Connection con=utility.DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		String col=(String)map.get("col");
		String word=(String)map.get("word");
		Integer sno=(Integer)map.get("sno");
		Integer eno=(Integer)map.get("eno");
		
		sql.append(" select bbsno,wname, title,content, viewcnt, wdate, indent, filename, r ");
		sql.append(" from(");
		sql.append("	select bbsno,wname, title, content,viewcnt, wdate, indent, filename,rownum r	");//--r이라는 이름을 뽑아내려고
		sql.append("	from(  ");//--rownum을 쓸려고 중첩쿼리 사용
		sql.append("		SELECT bbsno, wname, title, content, viewcnt, wdate,  indent, filename ");
		sql.append("		FROM bbs");
		if(word.trim().length()>0)  //trim() 빈문자열제거.length() 길이반환.
			sql.append(" WHERE "+col+" LIKE   '%'|| ? ||'%'"); 
		sql.append(" order by grpno DESC, ansnum ASC");	
		sql.append("	)");
		sql.append(")where r>=? and r<=?");
		try {
			pstmt=con.prepareStatement(sql.toString());
			int i=0;
			if(word.trim().length()>0)
				pstmt.setString(++i, word);
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				dto=new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setIndent(rs.getInt("indent"));
				dto.setFilename(rs.getString("filename"));
				dto.setContent(rs.getString("content"));
								
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			utility.DBClose.close(rs, pstmt, con);
		}
		
		return list;
	}
	
	public boolean create(BbsDTO dto){
		boolean flag=false;
		Connection con=utility.DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append(" INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate,grpno, filename,filesize)" );  
		sql.append(" VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs)," ); 
		sql.append(" ?, ?, ?, ?, sysdate,(SELECT NVL(MAX(grpno), 0) + 1 as bbsno FROM bbs),?,?)" );
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getFilename());
			pstmt.setInt(6, dto.getFilesize());
			if(pstmt.executeUpdate()>0)
				flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}utility.DBClose.close(pstmt, con);
		return flag;
	}

	public BbsDTO readReply(int bbsno){
		BbsDTO dto=null;
		Connection con=utility.DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append("select bbsno,title,grpno,indent,ansnum from bbs where bbsno=?");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dto=new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setTitle(rs.getString("title"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			utility.DBClose.close(rs, pstmt, con);
		}
		return dto;
	}
}