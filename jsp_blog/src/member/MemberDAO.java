package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class MemberDAO {
	public boolean loginCheck(String id, String passwd){
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append(" select count(*) from member ");
		sql.append(" where id=? and passwd = ?");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs=pstmt.executeQuery();
			if(rs.next()){
				int cnt=rs.getInt(1);
				if(cnt>0)
					flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs, pstmt, con);
		}
		return flag;
	}
	public Map getInfo(String id){
		String mname=null;
		String grade=null;
		String fname=null;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		Map map=null;
		sql.append(" select mname,grade,fname from member ");
		sql.append(" where id=?");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				map=new HashMap<>();
				mname=rs.getString("mname");
				grade=rs.getString("grade");
				fname=rs.getString("fname");
				map.put("mname",mname );
				map.put("grade",grade );
				map.put("fname",fname );
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs, pstmt, con);
		}
		return map;
	}

	public boolean delete(String id){
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append(" delete from member ");
		sql.append(" where id=? ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			if(pstmt.executeUpdate()>0)
				flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}
	public String getFname(String id){
		String fname=null;
	
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append(" select fname ");
		sql.append(" from member ");
		sql.append(" where = ? ");	
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next())
				fname=rs.getString("fname");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs, pstmt, con);
		}
		return fname;
	}
	public boolean update(MemberDTO dto){
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append(" update member ");
		sql.append(" set tel= ?,email=?,address1=?,address2=?,zipcode=?,job=? ");
		sql.append(" where id =? ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTel());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getAddress1());
			pstmt.setString(4, dto.getAddress2());
			pstmt.setString(5, dto.getZipcode());
			pstmt.setString(6, dto.getJob());
			pstmt.setString(7, dto.getId());
			
			if(pstmt.executeUpdate()>0)
				flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(pstmt, con);
		}
		
		
		return flag;
		
	}
	public boolean updatePw(String id, String passwd){
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append(" update member ");
		sql.append(" set passwd= ? ");
		sql.append(" where id =? ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, passwd);
			pstmt.setString(2, id);
			if(pstmt.executeUpdate()>0)
				flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(pstmt, con);
		}
		
		
		return flag;
	}
	public boolean updateFile(String id, String fname){
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append(" update member ");
		sql.append(" set fname= ? ");
		sql.append(" where id =? ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			pstmt.setString(2, id);
			if(pstmt.executeUpdate()>0)
				flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}
	public MemberDTO read(String id){
		MemberDTO dto=null;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql =new StringBuffer();
		
		sql.append(" select id,passwd,mname,tel,email,zipcode, ");
		sql.append(" address1,address2,job,mdate,fname ");
		sql.append(" from member ");
		sql.append(" where id=? ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new MemberDTO();
				dto.setId(rs.getString("id"));	
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setJob(rs.getString("job"));
				dto.setMdate(rs.getString("mdate"));
				dto.setFname(rs.getString("fname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} DBClose.close(rs, pstmt, con);
		return dto;
	}
	public List<MemberDTO> list(Map map){
		List<MemberDTO> list=new ArrayList<MemberDTO>();
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql =new StringBuffer();
		String col=(String)map.get("col");
		String word=(String)map.get("word");
		int sno=(Integer)map.get("sno");
		int eno=(Integer)map.get("eno");
		
		sql.append(" select id,mname,tel,email,zipcode,address1,address2,fname, r  ");
		sql.append(" from(  ");
		sql.append("   select id,mname,tel,email,zipcode,address1,address2,fname,rownum r  ");
		sql.append("   from(    ");
		sql.append("          select id,mname,tel,email,zipcode,address1,address2,fname  ");
		sql.append("          from member  ");
		if(word.trim().length()>0)
			sql.append(" 		  where "+col+" like '%'||?||'%' ");
		sql.append("          order by id)  ");
		sql.append(" )where r>=? and r<=?  ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			int i=0;
			if(word.trim().length()>0)
				pstmt.setString(++i, word);
				pstmt.setInt(++i, sno);
				pstmt.setInt(++i, eno);
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				MemberDTO dto=new MemberDTO();
				//rs.getString("");
				dto.setId(rs.getString("id"));
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setFname(rs.getString("fname"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs, pstmt, con);
		}
		
		
		return list;
	}
	
	public int total(String col,String word){
		Connection con=DBOpen.open();
		int total=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append(" select count(*)  ");
		sql.append(" from member  ");
		if(word.trim().length()>0)
		sql.append(" where "+col+" like '%'||?||'%'  ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(1, word);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				total=rs.getInt(1);
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} DBClose.close(rs, pstmt, con);
				
		return total;
	}
	public boolean create(MemberDTO dto){
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append(" INSERT INTO member(id, passwd, mname, tel, email, zipcode,   ");
		sql.append(" address1,address2, job, mdate, fname, grade)  ");
		sql.append(" VALUES(?, ?, ?, ?, ?,  ");
		sql.append(" ?, ?, ?, ?, sysdate, ?, 'H') ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getJob());
			pstmt.setString(10, dto.getFname());
			if(pstmt.executeUpdate()>0)
				flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}
	public List<MemberDTO> list(){
		List<MemberDTO> list=new ArrayList<MemberDTO>();
		Connection con=utility.DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append("");
		try {
			pstmt=con.prepareStatement(sql.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	public boolean duplicateEmail(String email){
		boolean flag=false;
		Connection con=utility.DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append(" SELECT COUNT(email) ");
		sql.append(" FROM member   ");
		sql.append(" WHERE email = ?  ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			if(rs.next()){
				if(rs.getInt(1)>0)
					flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			utility.DBClose.close(rs, pstmt, con);
		}
		
		return flag;
	}
	public boolean duplicateId(String id){
		boolean flag=false;
		Connection con=utility.DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append(" SELECT COUNT(id) ");
		sql.append(" FROM member   ");
		sql.append(" WHERE id = ?  ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				if(rs.getInt(1)>0)
					flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			utility.DBClose.close(rs, pstmt, con);
		}
		
		return flag;
	}
}
