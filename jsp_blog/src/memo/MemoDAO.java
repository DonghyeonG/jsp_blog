package memo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class MemoDAO {
	public int total(String col, String word){
		int total=0;
		Connection con=utility.DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append(" select count(*) from memo ");
		if(word.trim().length()>0)
			sql.append("where "+col+" like '%'||?||'%'");
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
		}finally{
			utility.DBClose.close(rs, pstmt, con);
		}
		
		return total;
	}
	public void upViewcnt(int memono){
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append("update memo set viewcnt= viewcnt+1 where memono=?");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(pstmt, con);
		}
		
	}
	public boolean delete(int memono){
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append("delete from memo where memono=?");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			int cnt=pstmt.executeUpdate();
			
			if(cnt>0)
				flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(pstmt, con);
		}
			
		return flag;
	}
	public boolean update(MemoDTO dto){
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append("update memo set title=?,content=? where memono=?");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getMemono());			
			int cnt=pstmt.executeUpdate();
			
			if(cnt>0)
				flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(pstmt, con);
		}
		
		
		
		return flag;
	}
	public MemoDTO read(int memono){
		MemoDTO dto=null;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append("select*from memo where memono=?");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dto=new MemoDTO();
				dto.setMemono(rs.getInt("memono"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getString("viewcnt"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs, pstmt, con);
		}
		
		return dto;
	}
	public boolean create(MemoDTO dto){
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append("INSERT INTO memo(memono,title,content,wdate)");
		sql.append("VALUES((select nvl(max(memono),0)+1 from memo), ?, ?, sysdate)");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			int cnt=pstmt.executeUpdate();
			
			if(cnt>0)
				flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBClose.close(pstmt, con);
		}
		return flag;
	}
	public List<MemoDTO> list(Map map){
		MemoDTO dto= null;
		List<MemoDTO> list=new ArrayList<MemoDTO>();
		Connection  con= DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		String col=(String)map.get("col");
		String word=(String)map.get("word");
		int sno=(Integer)map.get("sno");
		int eno=(Integer)map.get("eno");
		
		
		
//		sql.append("select memono,title,to_char(wdate,'yyyy_mm_dd') wdate,viewcnt,r");
		sql.append(" select memono,title,wdate,viewcnt, r ");
		sql.append(" from(");
		sql.append("	select memono,title,wdate,viewcnt,rownum r");
		sql.append("	from(");
		sql.append("		select memono,title,wdate,viewcnt");
		sql.append("		from MEMO");
		if(word.trim().length()>0)
			sql.append("		where "+col+" like '%'||?||'%'");
		sql.append("		order by memono desc");
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
				dto=new MemoDTO();
				dto.setMemono(rs.getInt("memono"));
				dto.setTitle(rs.getString("title"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getString("viewcnt"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs,pstmt,con);
		}
		
		return list;
	}
}
