package address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class AddressDAO {
	public int total(String col, String word){
		int total = 0;
		Connection con = utility.DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) ");
		sql.append(" from address ");
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
	
	public boolean create(AddressDTO dto) {
		Connection con = utility.DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		boolean flag = false;
		int cnt = 0;

		sql.append(" INSERT INTO address (no, name, phone, zipcode, address1, address2, wdate)");
		sql.append(" VALUES ((SELECT nvl(max(no),0)+1 FROM address), ?,?,?,?,?,sysdate )");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress1());
			pstmt.setString(5, dto.getAddress2());

			if (pstmt.executeUpdate() > 0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

	public boolean update(AddressDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append("update address set phone=?,zipcode=?,address1=?,address2=? where no=?");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getPhone());
			pstmt.setString(2, dto.getZipcode());
			pstmt.setString(3, dto.getAddress1());
			pstmt.setString(4, dto.getAddress2());
			pstmt.setInt(5, dto.getNo());
			if (pstmt.executeUpdate() > 0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}

	public boolean delete(int no) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append("delete from address where no=?");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			if (pstmt.executeUpdate() > 0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}

	public AddressDTO read(int no) {
		AddressDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append("select no,name,phone,zipcode,address1,address2,wdate from address where no=?");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new AddressDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setWdate(rs.getString("wdate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return dto;
	}

	public List<AddressDTO> list(Map map) {
		List<AddressDTO> list = new ArrayList<AddressDTO>();
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		String col=(String)map.get("col");
		String word=(String)map.get("word");
		int sno=(Integer)map.get("sno");
		int eno=(Integer)map.get("eno");
		

		sql.append(" select no,name,TO_CHAR(wdate,'yyyy-mm-dd') wdate, r ");
		sql.append(" from( ");
		sql.append(" 	select no,name,wdate, rownum r ");
		sql.append(" 	from( ");
		sql.append(" 		select no,name,wdate ");
		sql.append(" 		from address ");
		if(word.trim().length()>0)
			sql.append(" 		where "+col+" like '%'||?||'%' ");
		sql.append(" 		order by no desc ");
		sql.append(" 	) ");
		sql.append(" )where r>=? and r<=? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			int i=0;
			if(word.trim().length()>0)
				pstmt.setString(++i, word);
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				AddressDTO dto = new AddressDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setWdate(rs.getString("wdate"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return list;
	}

}
