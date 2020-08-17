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
            String sql="insert into user_Info values( (SELECT (NVL(MAX(User_No), 0) + 1) FROM USER_INFO),?,?,?,?,?,?,?,?,'2','N','N','1',sysdate,'1',sysdate)";
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
   
   
   // �α��� �� �� �ʿ���! / ��й�ȣ ã���� �ʿ���!
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
   
   
      // ���̵� ã�� �� �ʿ���
      // ȸ�� ���̵� ���޹޾� MEMBER ���̺� ����� �ش� ���̵��� ȸ�������� 
      //�˻��Ͽ� ��ȯ�ϴ� �޼ҵ� - ������ �˻�
      public UserInfoDTO selectfindIdUserinfo(String userNm) {
         Connection con=null;
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         UserInfoDTO userInfo=null;
         try {
            con=getConnection();
            
            String sql="select * from User_Info where USER_Nm=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, userNm);
            
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
      
      
      
      //�ӽú�й�ȣ �߱� �� �ʿ��� DAO
      //��й�ȣã�⸦ �������� ȸ������ ���޵� �ӽ� ��й�ȣ ����
      public static String randomPassword(int length) {
         
         int index = 0; 
         char[] charset = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
               , 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N'
               , 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b'
               , 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p'
               , 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };
         
         StringBuffer sb= new StringBuffer();
         for (int i = 0; i < length; i++) {
            index = (int)(charset.length*Math.random());
            sb.append(charset[index]);
         }

      return sb.toString();
      }
      //�ӽ� ��й�ȣ ���� �� ����ó���� ���� �޼ҵ� 
      public int updatePwdUserInfo(UserInfoDTO userInfo) {
         Connection con=null;
         PreparedStatement pstmt=null;
         int rows=0;
         try {
            con=getConnection();
            
            String sql="update user_info set Password=? where User_id=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, userInfo.getPassword());
            pstmt.setString(2, userInfo.getUserId());
            
            rows=pstmt.executeUpdate();
         } catch (SQLException e) {
            System.out.println("[����]updatePwdUserInfo() �޼ҵ��� SQL ���� = "+e.getMessage());
         } finally {
            close(con, pstmt);
         }
         return rows;
      }
      

   // ȸ�������� ���� ó���ϴ� �޼ҵ�(�̰� �³�...)
   public int updateStatusInfo(String userNo) {
      Connection con = null;
      PreparedStatement pstmt = null;
      int rows = 0;
      try {
         con = getConnection();

         String sql = "update user_info set withd_yn='Y' where user_no=?";

         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, userNo);

         rows = pstmt.executeUpdate();
      } catch (SQLException e) {
         System.out.println("[����]updateStatusInfo() �޼ҵ��� SQL ���� = " + e.getMessage());
      } finally {
         close(con, pstmt);
      }
      return rows;
   }

   /*
    * private String userNo; private String userId; private String password;
    * private String userNm; private String contAddr; private String postCd;
    * private String basAddr; private String detlAddr; private String userDv;
    * private String duplJoinYn; private String withdYn; private String
    * firstRgsrUsrno; private String firstRgstDttm; private String lastProcrUsrno;
    * private String lastProcDttm;
    * 
    */

}