package jm_dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.sun.corba.se.pept.transport.Connection;

import jm_dto.UserInfoDTO;

public class UserInfoDAO extends JdbcDAO {
	
	private static UserInfoDAO _dao;
	
	public UserInfoDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new UserInfoDAO();
	}
	
	public static UserInfoDAO getDAO() {
		return _dao;
	}
	
	public int insertUserInfo(UserInfoDTO userInfo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
	         con=getConnection();
	         
	         String sql="insert into member values(?,?,?,?,?,?,?,?,sysdate,null,1)";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, userInfo.getUserNo());
	         pstmt.setString(2, userInfo.getUserId());
	         pstmt.setString(3, userInfo.getPassword());
	         pstmt.setString(4, userInfo.getUserNm());
	         pstmt.setString(5, userInfo.getContAddr());
	         pstmt.setString(6, userInfo.getPostCd());
	         pstmt.setString(7, userInfo.getBasAddr());
	         pstmt.setString(8, userInfo.getDetlAddr());
	         
	         rows=pstmt.executeUpdate();
	      } catch (SQLException e) {
	         System.out.println("[에러]insertMember() 메소드의 SQL 오류 = "+e.getMessage());
	      } finally {
	         close(con, pstmt);
	      }
	      return rows;
	   }

	/*
	String userNo;o
	private String userId;o
	private String password;o
	private String userNm;o
	private String contAddr;o
	private String postCd;o
	private String basAddr;o
	private String detlAddr;o
	private String userDv;
	private String duplJoinYn;
	private String firstRgsrUsrno;
	private String firstRgstDttm;
	private String lastProcrUsrno;
	private String lastProcDttm;
	*/
	
	
	
}
