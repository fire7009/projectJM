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
	
	// ȸ������ ���޹޾�  UserInfo ���̺� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ� 
	// => ���̵�, �н�����, �̸�, ����ó, �����ȣ, �⺻�ּ�, ���ּ�, ȸ������, �̸���
	public int insertUserInfo(UserInfoDTO userInfo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
	         con=getConnection();
	         //SQL�� �ѹ� Ȯ�� �ؾ���!!
	         String sql="insert into user_Info values( (SELECT (NVL(MAX(User_No), 0) + 1) FROM USER_INFO),?,?,?,?,?,?,?,?,'2','N','N',"
	         		+ "(SELECT (NVL(MAX(User_No), 0) + 1) FROM USER_INFO),sysdate,(SELECT (NVL(MAX(User_No), 0) + 1) FROM USER_INFO),sysdate)";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, userInfo.getUserId());
	         pstmt.setString(2, userInfo.getPassword());
	         pstmt.setString(3, userInfo.getUserNm());
	         pstmt.setString(4, userInfo.getContAddr());
	         pstmt.setString(5, userInfo.getEmailAddr());
	         pstmt.setString(6, userInfo.getPostCd());
	         pstmt.setString(7, userInfo.getBasAddr());
	         pstmt.setString(8, userInfo.getDetlAddr());
	         
	         rows=pstmt.executeUpdate();
	      } catch (SQLException e) {
	         System.out.println("[����]insertUserInfo() �޼ҵ��� SQL ���� = "+e.getMessage());
	      } finally {
	         close(con, pstmt);
	      }
	      return rows;
	   }
	
	
	// �α��� �� �� �ʿ���!
	//ȸ�� ���̵� ���޹޾� MEMBER ���̺� ����� �ش� ���̵��� ȸ�������� 
	//�˻��Ͽ� ��ȯ�ϴ� �޼ҵ� - ������ �˻�
	public UserInfoDTO selectIdUserinfo(String userId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		UserInfoDTO userInfo=null;
		try {
			con=getConnection();
			
			String sql="select * from User_Info where USER_ID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs=pstmt.executeQuery();
	         
	         if(rs.next()) {
	        	userInfo=new UserInfoDTO();
				userInfo.setUserNo(rs.getString("user_no"));
	        	userInfo.setUserId(rs.getString("user_id"));
	        	userInfo.setPassword(rs.getString("password"));
	        	userInfo.setUserNm(rs.getString("user_nm"));
	        	userInfo.setContAddr(rs.getString("cont_addr"));
	        	userInfo.setEmailAddr(rs.getString("email_addr"));
	        	userInfo.setPostCd(rs.getString("post_cd"));
	        	userInfo.setBasAddr(rs.getString("bas_addr"));
	        	userInfo.setDetlAddr(rs.getString("detl_addr"));
	        	userInfo.setUserDv(rs.getString("user_dv"));
	        	userInfo.setWithdYn(rs.getString("withd_yn"));
	        	userInfo.setFrstRgsrUsrno(rs.getString("frst_rgsr_usrno"));
	        	userInfo.setUserDv(rs.getString("frst_rgst_dttm"));
	        	userInfo.setLastProcrUsrno(rs.getString("last_procr_usrno"));
	        	userInfo.setLastProcDttm(rs.getString("last_proc_dttm"));

			}
		} catch (SQLException e) {
			System.out.println("[����]selectIdUserInfo() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return userInfo;
	}
	
	
	
	
	
	//ȸ����ȣ�� ���޹޾� user_info ���̺� ����� �ش� ���̵��� ȸ�� ������ �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
	 public UserInfoDTO selectUserInfo(String userNo) {
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      UserInfoDTO userInfo=null;
	      try {
	         con=getConnection();
	         
	         String sql="select user_no, user_id, user_nm, cont_addr, post_cd, bas_addr, detl_addr, to_char(first_rgst_dttm,"
	         		+ "'yyyy-mm-dd'), email_addr from user_info where user_no=? ";
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
	        	userInfo.setEmailAddr(rs.getString("emailAddr"));
	            
	         }
	      } catch (SQLException e) {
	         System.out.println("[����]selectUserInfo() �޼ҵ��� SQL ���� = "+e.getMessage());
	      } finally {
	         close(con, pstmt, rs);
	      }
	      return userInfo;
	   }

	 	

	   //ȸ�������� ���޹޾� MEMBER ���̺� ����� ȸ�������� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
	   public int updateUserInfo(UserInfoDTO userInfo) {
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      int rows=0;
	      try {
	         con=getConnection();
	         
	         String sql="update user_info set user_nm=?, cont_addr=?, post_cd=?"
	         		+ "bas_addr=?, detl_addr=?, last_procr_usrno=?, last_proc_dttm=sysdate where user_no=? , email_addr=?";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, userInfo.getUserNm());
	         pstmt.setString(2, userInfo.getContAddr());
	         pstmt.setString(3, userInfo.getPostCd());
	         pstmt.setString(4, userInfo.getBasAddr());
	         pstmt.setString(5, userInfo.getDetlAddr());
	         pstmt.setString(6, userInfo.getLastProcrUsrno());
	         pstmt.setString(7, userInfo.getLastProcDttm());
	         pstmt.setString(8, userInfo.getEmailAddr());
	         
	         rows=pstmt.executeUpdate();
	      } catch (SQLException e) {
	         System.out.println("[����]updateUserInfo() �޼ҵ��� SQL ���� = "+e.getMessage());
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
