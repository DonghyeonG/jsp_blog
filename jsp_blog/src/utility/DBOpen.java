package utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBOpen {
	public static Connection open() {
		try {
			Class.forName(Constant.driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Connection con = null;
		try {
			con = DriverManager.getConnection(Constant.url,Constant.id,Constant.pass);		
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return con;
	}

}
