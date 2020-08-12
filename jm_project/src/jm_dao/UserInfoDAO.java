package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


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
	
	// 회원정보 전달받아  UserInfo 테이블에 삽입하고 삽입행의 갯수를 반환하는 메소드 
	// => 아이디, 패스워드, 이름, 연락처, 우편번호, 기본주소, 상세주소, 회원구분 
	public int insertUserInfo(UserInfoDTO userInfo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
	         con=getConnection();
	         
	         String sql="insert into userInfo(user_id, password, user_nm, cont_addr, post_cd, bas_addr, "
	         		+ "detl_addr, user_dv) values(?,?,?,?,?,?,?,?)";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, userInfo.getUserId());
	         pstmt.setString(2, userInfo.getPassword());
	         pstmt.setString(3, userInfo.getUserNm());
	         pstmt.setString(4, userInfo.getContAddr());
	         pstmt.setString(5, userInfo.getPostCd());
	         pstmt.setString(6, userInfo.getBasAddr());
	         pstmt.setString(7, userInfo.getDetlAddr());
	         pstmt.setString(8, userInfo.getUserDv());
	         
	         rows=pstmt.executeUpdate();
	      } catch (SQLException e) {
	         System.out.println("[에러]insertUserInfo() 메소드의 SQL 오류 = "+e.getMessage());
	      } finally {
	         close(con, pstmt);
	      }
	      return rows;
	   }
	
	
	// 로그인 할 때 필요함!
	//회원 아이디를 전달받아 MEMBER 테이블에 저장된 해당 아이디의 회원정보를 
	//검색하여 반환하는 메소드 - 단일행 검색
	public UserInfoDTO selectIdIdUserinfo(String userId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		UserInfoDTO userInfo=null;
		try {
			con=getConnection();
			
			String sql="select * from User_Info where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs=pstmt.executeQuery();
	         
	         if(rs.next()) {
	        	userInfo=new UserInfoDTO();
	        	userInfo.setUserNo(rs.getString("userNo"));
	        	userInfo.setUserNm(rs.getString("userNm"));
	        	userInfo.setContAddr(rs.getString("contAddr"));
	        	userInfo.setPostCd(rs.getString("postCd"));
	        	userInfo.setBasAddr(rs.getString("basAddr"));
	        	userInfo.setDetlAddr(rs.getString("detlAddr"));
	        	userInfo.setUserDv(rs.getString("firstRgstDttm"));
	        	
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectIdUserInfo() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return userInfo;
	}
	
	
	
	
	
	//회원번호를 전달받아 user_info 테이블에 저장된 해당 아이디의 회원 정보를 검색하여 반환하는 메소드
	 public UserInfoDTO selectUserInfo(String userNo) {
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      UserInfoDTO userInfo=null;
	      try {
	         con=getConnection();
	         
	         String sql="select user_no, user_id, user_nm, cont_addr, post_cd, bas_addr, detl_addr, to_char(first_rgst_dttm,"
	         		+ "'yyyy-mm-dd') from user_info where user_no=? ";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, userNo);
	         
	         rs=pstmt.executeQuery();
	         
	         if(rs.next()) {
	        	userInfo=new UserInfoDTO();
	        	userInfo.setUserNo(rs.getString("userNo"));
	        	userInfo.setUserId(rs.getString("userId"));
	        	userInfo.setUserNm(rs.getString("userNm"));
	        	userInfo.setContAddr(rs.getString("contAddr"));
	        	userInfo.setPostCd(rs.getString("postCd"));
	        	userInfo.setBasAddr(rs.getString("basAddr"));
	        	userInfo.setDetlAddr(rs.getString("detlAddr"));
	        	userInfo.setUserDv(rs.getString("firstRgstDttm"));
	            
	         }
	      } catch (SQLException e) {
	         System.out.println("[에러]selectUserInfo() 메소드의 SQL 오류 = "+e.getMessage());
	      } finally {
	         close(con, pstmt, rs);
	      }
	      return userInfo;
	   }

	 	

	   //회원정보를 전달받아 MEMBER 테이블에 저장된 회원정보를 변경하고 변경행의 갯수를 반환하는 메소드
	   public int updateUserInfo(UserInfoDTO userInfo) {
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      int rows=0;
	      try {
	         con=getConnection();
	         
	         String sql="update user_info set user_nm=?, cont_addr=?, post_cd=?"
	         		+ "bas_addr=?, detl_addr=?, last_procr_usrno=?, last_proc_dttm=sysdate where user_no=?";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, userInfo.getUserNm());
	         pstmt.setString(2, userInfo.getContAddr());
	         pstmt.setString(3, userInfo.getPostCd());
	         pstmt.setString(4, userInfo.getBasAddr());
	         pstmt.setString(5, userInfo.getDetlAddr());
	         pstmt.setString(6, userInfo.getLastProcrUsrno());
	         pstmt.setString(7, userInfo.getLastProcDttm());
	         
	         rows=pstmt.executeUpdate();
	      } catch (SQLException e) {
	         System.out.println("[에러]updateUserInfo() 메소드의 SQL 오류 = "+e.getMessage());
	      } finally {
	         close(con, pstmt);
	      }
	      return rows;
	   }
	   
	
	 
	 
/*	private String userNo;
	private String userId;
	private String password;
	private String userNm;
	private String contAddr;
	private String postCd;
	private String basAddr;
	private String detlAddr;
	private String userDv;
	private String duplJoinYn;
	private String withdYn;
	private String firstRgsrUsrno;
	private String firstRgstDttm;
	private String lastProcrUsrno;
	private String lastProcDttm;
	
	*/
	
	
	
}
