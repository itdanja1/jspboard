package user;

import java.sql.*;

public class UserDAO {
	
	
	private Connection conn ;
	private PreparedStatement pstmt ;
	private ResultSet rs ;
	
	public UserDAO() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC", "root", "1234");
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	public int login( String userID , String userPassword ) {
		
		String SQL ="select userPassword from user where userID = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
		
			if( rs.next() ) {
				if( rs.getString(1).equals(userPassword) )
					return 1; //로그인 성공
				else {
					return 0;
				}
			}
			return -1;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return -2 ;
	}
	
	public int join( User user ) {
		
		String SQL = "insert into user values( ? , ? , ? ,? ,?)";
		
		try {
			
			pstmt =conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
	
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
