package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	
	
	private Connection conn ;

	private ResultSet rs ;
	
	public BbsDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC", "root", "1234");
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		

	}
	public String getDate() {
		String SQL = "SELECT NOW()"; // ���� �ð� 
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				
				return rs.getString(1);
				
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return ""; 
	}
	public int getNext() {
		String SQL = "SELECT max(bbsID) FROM bbs"; // ���� �ð� 
		try {
			PreparedStatement  pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				
				return rs.getInt(1) +1 ;
				
			}
			return 1;//ù��° �Խù� 
			
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return -1; // db ���� �߻� 
	}
	
	public int write( String bbsTitle , String userID , String bbsContent , String bbsFile ) {
		
		String SQL = "insert into bbs values(?,?,?,?,?,? , ?)"; // ���� �ð� 
		try {
			
			PreparedStatement  pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setString(2, bbsTitle );
			pstmt.setString(3, userID );
			pstmt.setString(4, getDate() );
			pstmt.setString(5, bbsContent );
			pstmt.setInt(6, 1 );
			pstmt.setString(7, bbsFile );
			

			return pstmt.executeUpdate();
			
			

		}catch (Exception e) {
			// TODO: handle exception
		}
		return -1; // db ���� �߻�
		
		
	}
	
	public ArrayList<Bbs> getlist( int pageNumber){
		
		String SQL = "SELECT * from bbs where bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10"; // ���� �ð� 
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement  pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt( 1 ,getNext() - ( pageNumber - 1 ) * 10 );
			
			rs = pstmt.executeQuery();
		
			while( rs.next() ) {
				Bbs bbs = new Bbs();
				
				bbs.setBbsID( rs.getInt(1));
				bbs.setBbsTitle( rs.getString(2));
				bbs.setUserID( rs.getString(3));
				bbs.setBbsDate( rs.getString(4));
				bbs.setBbsContent( rs.getString(5));
				bbs.setBbsAvailable( rs.getInt(6));
				bbs.setBbsFile( rs.getString(7));
				
				list.add(bbs);

			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return list; // db ���� �߻� 
	}
		
	
	
	public boolean nextPage( int pageNumber ) {
		
		String SQL = "SELECT * from bbs where bbsID < ? AND bbsAvailable = 1 "; // ���� �ð� 
		try {
			PreparedStatement  pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt( 1 ,getNext() - ( pageNumber - 1 ) * 10 );
			
			rs = pstmt.executeQuery();
		
			if( rs.next() ) {
						return true;
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return false; // db ���� �߻� 
		
		
	}
	
	public Bbs getBbs( int bbsID ) {
		
		String SQL = "SELECT * from bbs where bbsID = ? "; // ���� �ð� 
		try {
			PreparedStatement  pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt( 1 , bbsID );
			
			rs = pstmt.executeQuery();
		
			if( rs.next() ) {
				
				Bbs bbs = new Bbs();
				
				bbs.setBbsID( rs.getInt(1));
				bbs.setBbsTitle( rs.getString(2));
				bbs.setUserID( rs.getString(3));
				bbs.setBbsDate( rs.getString(4));
				bbs.setBbsContent( rs.getString(5));
				bbs.setBbsAvailable( rs.getInt(6));
				bbs.setBbsFile( rs.getString(7));
					
				return bbs;
				
				
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return null; // db ���� �߻� 
		
		
	}
	
	
	public int update( int bbsID , String bbsTitle , String bbsContent ) {
		
		String SQL = "UPDATE bbs set bbsTitle = ? , bbsContent = ? where bbsID =?";
		try {
			
			PreparedStatement  pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, bbsTitle );
			pstmt.setString(2, bbsContent );

			pstmt.setInt(3, bbsID );

			return pstmt.executeUpdate();
			

		}catch (Exception e) {
			// TODO: handle exception
		}
		return -1; // db ���� �߻�

	}
	
	public int delete( int bbsID ) {
	
		String SQL = "UPDATE bbs set bbsAvailable = 0 where bbsID =?";
		try {
			
			PreparedStatement  pstmt = conn.prepareStatement(SQL);



			pstmt.setInt(1, bbsID );

			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return -1; // db ���� �߻�

	}
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
