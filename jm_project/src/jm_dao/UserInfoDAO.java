package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
   // => 아이디, 패스워드, 이름, 연락처, 우편번호, 기본주소, 상세주소, 회원구분, 이메일
   public int insertUserInfo(UserInfoDTO userInfo) {
      Connection con=null;
      PreparedStatement pstmt=null;
      int rows=0;
      try {
            con=getConnection();
            //SQL문 한번 확인 해야함!!
            String sql="insert into user_Info values( (select(nvl(max(to_number(user_no)),0)+1)from user_info),?,?,?,?,?,?,?,?,'2','N', (SELECT (NVL(MAX(User_No), 0) + 1) FROM USER_INFO),"
            		+ "sysdate, (SELECT (NVL(MAX(User_No), 0) + 1) FROM USER_INFO), sysdate)";
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
            System.out.println("[에러]insertUserInfo() 메소드의 SQL 오류 = "+e.getMessage());
         } finally {
            close(con, pstmt);
         }
         return rows;
      }
   
   
   // 로그인 할 때 필요함! / 비밀번호 찾을때 필요함!
   //회원 아이디를 전달받아 MEMBER 테이블에 저장된 해당 아이디의 회원정보를 
   //검색하여 반환하는 메소드 - 단일행 검색
   public UserInfoDTO selectIdUserinfo(String userId) {
      Connection con=null;
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      UserInfoDTO userInfo=null;
      try {
         con=getConnection();
         
         String sql =   "SELECT USER_NO    " 
         		      + "     , USER_ID    " 
         		      + "     , PASSWORD   " 
         		      + "     , USER_NM    " 
         		      + "     , CONT_ADDR  " 
         		      + "     , EMAIL_ADDR "
         		      + "     , POST_CD    " 
         		      + "     , BAS_ADDR   "
         		      + "     , DETL_ADDR  " 
         		      + "     , USER_DV    " 
         		      + "     , WITHD_YN   "
         		      + "     , FRST_RGSR_USRNO   "
         		      + "     , TO_CHAR(FRST_RGST_DTTM, 'YYYY.MM.DD') FRST_RGST_DTTM "
         		      + "  FROM USER_INFO   " 
         		      + " WHERE USER_ID = ? ";
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, userId);
         
         rs=pstmt.executeQuery();
            
            if(rs.next()) {
            	
              userInfo = new UserInfoDTO();
              
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
              userInfo.setFrstRgstDttm(rs.getString("frst_rgst_dttm"));
              userInfo.setFrstRgsrUsrno(rs.getString("frst_rgsr_usrno"));

         }
      } catch (SQLException e) {
         System.out.println("[에러]selectIdUserInfo() 메소드의 SQL 오류 = "+e.getMessage());
      } finally {
         close(con, pstmt, rs);
      }
      return userInfo;
   }
   
   
      // 아이디 찾을 때 필요함
      // 회원 아이디를 전달받아 MEMBER 테이블에 저장된 해당 아이디의 회원정보를 
      //검색하여 반환하는 메소드 - 단일행 검색
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
            
            String sql="select user_no, user_id, user_nm, cont_addr, post_cd, bas_addr, detl_addr, to_char(frst_rgst_dttm,"
                  + "'yyyy-mm-dd') frst_rgst_dttm, email_addr from user_info where user_no=? ";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, userNo);
            
            rs=pstmt.executeQuery();
            
            if(rs.next()) {
              userInfo=new UserInfoDTO();
              userInfo.setUserNo(rs.getString("user_no"));
              userInfo.setUserId(rs.getString("user_id"));
              userInfo.setUserNm(rs.getString("user_nm"));
              userInfo.setContAddr(rs.getString("cont_addr"));
              userInfo.setPostCd(rs.getString("post_cd"));
              userInfo.setBasAddr(rs.getString("bas_addr"));
              userInfo.setDetlAddr(rs.getString("detl_addr"));
              userInfo.setUserDv(rs.getString("user_dv"));
              userInfo.setEmailAddr(rs.getString("email_addr"));
               
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
            
            String sql="update user_info set user_nm=?, password=?, cont_addr=?, email_addr=?, post_cd=?,"
                  + "bas_addr=?, detl_addr=? where user_id=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, userInfo.getUserNm());
            pstmt.setString(2, userInfo.getPassword());
            pstmt.setString(3, userInfo.getContAddr());
            pstmt.setString(4, userInfo.getEmailAddr());
            pstmt.setString(5, userInfo.getPostCd());
            pstmt.setString(6, userInfo.getBasAddr());
            pstmt.setString(7, userInfo.getDetlAddr());
            pstmt.setString(8, userInfo.getUserId());
            
            
            rows=pstmt.executeUpdate();
         } catch (SQLException e) {
            System.out.println("[에러]updateUserInfo() 메소드의 SQL 오류 = "+e.getMessage());
         } finally {
            close(con, pstmt);
         }
         return rows;
      }
      
      
      
      //임시비밀번호 발급 시 필요한 DAO
      //비밀번호찾기를 눌렀을때 회원에게 전달된 임시 비밀번호 생성
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
      //임시 비밀번호 생성 후 저장처리를 위한 메소드 
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
            System.out.println("[에러]updatePwdUserInfo() 메소드의 SQL 오류 = "+e.getMessage());
         } finally {
            close(con, pstmt);
         }
         return rows;
      }
      
  	public int deleteUserInfo(String userId) {
  		Connection con = null;
  		PreparedStatement pstmt = null;
  		int rows = 0;
  		try {
  			con = getConnection();

  			String sql = "delete from user_info where user_id=?";
  			pstmt = con.prepareStatement(sql);
  			pstmt.setString(1, userId);

  			rows = pstmt.executeUpdate();
  		} catch (SQLException e) {
  			System.out.println("[에러]deleteMember() 메소드의 SQL 오류 = " + e.getMessage());
  		} finally {
  			close(con, pstmt);
  		}
  		return rows;
  	}
  	
  	// 관리자 > 회원관리 > 회원 목록 쿼리
  	public List<UserInfoDTO> getAdminUserList() {
  		
  		Connection con			= null;
  		PreparedStatement pstmt = null;
  		ResultSet rs			= null;
  		
  		List<UserInfoDTO> adminUserList = new ArrayList<UserInfoDTO>();
  		
  		try {
  			
  			con = getConnection();
  			
  			String sql =   "SELECT USER_NO												" 
  					     + "     , USER_ID												" 
  					     + "     , USER_NM												" 
  					     + "     , EMAIL_ADDR											" 
  					     + "     , USER_DV												" 
  					     + "     , WITHD_YN												" 
  					     + "     , TO_CHAR(FRST_RGST_DTTM, 'YYYY.MM.DD') FRST_RGST_DTTM	"
  					     + "  FROM USER_INFO											" 
  					     + " WHERE USER_DV	= '2'										" 
  					     + "   AND WITHD_YN	= 'N'										" 
  					     + " ORDER BY USER_NO DESC										";   					    
  			
  			pstmt	= con.prepareStatement(sql);			
  			rs		= pstmt.executeQuery();
  			
  			while (rs.next()) {
  				
  				UserInfoDTO userInfoDTO = new UserInfoDTO();
  				
  				userInfoDTO.setUserNo(rs.getString("user_no"));
  				userInfoDTO.setUserId(rs.getString("user_id"));
  				userInfoDTO.setUserNm(rs.getString("user_nm"));
  				userInfoDTO.setEmailAddr(rs.getString("email_addr"));
  				userInfoDTO.setUserDv(rs.getString("user_dv"));
  				userInfoDTO.setWithdYn(rs.getString("withd_yn"));
  				userInfoDTO.setFrstRgstDttm(rs.getString("frst_rgst_dttm"));
  				  				
  				adminUserList.add(userInfoDTO);
  				
  			}
  				
  		} catch (SQLException e) {
  			
  			System.out.println(e.getMessage());
  			
		} finally {
			
			close(con, pstmt, rs);			
  			
  		}
  		
		return adminUserList;
  		
  	}
  	
  	// 관리자 > 회원관리 > 회원 상세 쿼리
  	public UserInfoDTO getAdminUserInfo(String userNo) {
        
  		Connection con				= null;
        PreparedStatement pstmt		= null;
        ResultSet rs				= null;
        
        UserInfoDTO userInfoDTO 	= null;
        
        try {
        	
           con = getConnection();
           
           String sql=   "SELECT USER_NO												" 
           		       + "     , USER_ID												" 
           		       + "     , USER_NM    											" 
           		       + "     , CONT_ADDR  											" 
           		       + "     , EMAIL_ADDR 											"
           		       + "     , POST_CD    											" 
           		       + "     , BAS_ADDR   											" 
           		       + "     , DETL_ADDR  											" 
           		       + "     , TO_CHAR(FRST_RGST_DTTM, 'YYYY.MM.DD') FRST_RGST_DTTM	"
           		       + "  FROM USER_INFO  											"
           		       + " WHERE USER_NO = ?											";
           
           pstmt = con.prepareStatement(sql);
           
           pstmt.setString(1, userNo);
           
           rs = pstmt.executeQuery();
              
              if(rs.next()) {
            	  
                userInfoDTO = new UserInfoDTO();
                
                userInfoDTO.setUserNo(rs.getString("user_no"));
                userInfoDTO.setUserId(rs.getString("user_id"));                
                userInfoDTO.setUserNm(rs.getString("user_nm"));
                userInfoDTO.setContAddr(rs.getString("cont_addr"));
                userInfoDTO.setEmailAddr(rs.getString("email_addr"));
                userInfoDTO.setPostCd(rs.getString("post_cd"));
                userInfoDTO.setBasAddr(rs.getString("bas_addr"));
                userInfoDTO.setDetlAddr(rs.getString("detl_addr"));                
                userInfoDTO.setFrstRgstDttm(rs.getString("frst_rgst_dttm"));
                
              }
              
        } catch (SQLException e) {
           
        	System.out.println(e.getMessage());
        	
        } finally {
        	
           close(con, pstmt, rs);
           
        }
        
        return userInfoDTO;
        
    }
  	
  	// 관리자 > 회원관리 > 회원 삭제 쿼리
  	public int deleteAdminUserInfo(String userNo) {
  		
		Connection con			= null;
		PreparedStatement pstmt = null;
		int rows				= 0;
		
		try {
			
			con=getConnection();
			
			String sql =   "UPDATE USER_INFO 					" 
					     + "   SET WITHD_YN			= 'Y'     	" 
					     + "     , LAST_PROC_DTTM	= SYSDATE 	"	 
					     + " WHERE USER_NO 			= ? 		";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userNo);
			
			rows=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			System.out.println(e.getMessage());
			
		} finally {
			
			close(con, pstmt);
			
		}
		
		return rows;
	}
   
   
}
