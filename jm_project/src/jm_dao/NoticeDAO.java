package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jm_dto.NoticeDTO;
import jm_dto.UserInfoDTO;



public class NoticeDAO extends JdbcDAO {
	
	private static NoticeDAO _dao;
	
	private NoticeDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new NoticeDAO();
	}
	
	public static NoticeDAO getDAO() {
		return _dao;
	}




	public int selectNoticeCount(String search, String keyword) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int count=0;
			try {
				con=getConnection();
				
				//메소드의 매개변수의 저장값에 따라 다른 SQL 명령을 저장하여 실행되도록 설정 - 동적 SQL
				if(keyword.equals("")) {//검색 기능을 사용하지 않은 경우
					
						String sql="select count(*) from notice";
						pstmt=con.prepareStatement(sql);
					
				} else {//검색 기능을 사용한 경우
					String sql="select count(*) from notice where "
							+search+" like '%'||?||'%'";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, keyword);
				}
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					count=rs.getInt(1);
				}
			
			} catch (SQLException e) {
				System.out.println("[에러]selectBoardCount() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return count;
		}
	
		//게시글 저장 DAO
	public int insertNotice(NoticeDTO notice) {
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      int rows=0;
	      try {
	            con=getConnection();
	            
	            String sql="insert into notice values((select(nvl(max(notice_no),0)+1)from notice),?,?,sysdate,?,'2')";
	            pstmt=con.prepareStatement(sql);
	           
	            pstmt.setString(1, notice.getNoticeTitle());		
	            pstmt.setString(2, notice.getNoticeContents());
	            pstmt.setInt(3, notice.getNoticeReadcount());		
	            
	            rows=pstmt.executeUpdate();
	         } catch (SQLException e) {
	            System.out.println("[에러]insertNotice() 메소드의 SQL 오류 = "+e.getMessage());
	         } finally {
	            close(con, pstmt);
	         }
	         return rows;
	      }
	
	
	
	
		//게시글의 시작 행번호와 종료 행번호를 전달받아 BOARD 테이블에 저장된 
		//게시글에서 시작과 종료 범위에 포함된 게시글만 검색하여 반환하는 메소드
		//public List<BoardDTO> selectBoard(int startRow, int endRow) {
		public List<NoticeDTO> selectNoticeBoard(int startRow, int endRow, String search, String keyword) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<NoticeDTO> boardList=new ArrayList<NoticeDTO>();
			try {
				con=getConnection();
				
				if(keyword.equals("")) {
					String sql="select * from (select rownum rn,temp.* from ("
						+ "select * from notice order by notice_no desc)"
						+ " temp) where rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
				} 
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					NoticeDTO board=new NoticeDTO();
					board.setNoticeNo(rs.getInt("notice_no"));;
					board.setNoticeTitle(rs.getString("notice_title"));
					board.setNoticeContents(rs.getString("notice_contents"));
					board.setNoticeDate(rs.getString("notice_date"));
					board.setNoticeReadcount(rs.getInt("notice_readcount"));
					board.setNoticeStatus(rs.getInt("notice_status"));
					if (board.getNoticeStatus()==2) {
						boardList.add(board);
					}
					//-- 0 : 삭제 1 : 임시저장 2:글올리기 
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectBoard() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return boardList;
		}
	
		//게시글 번호를 전달받아 BOARD 테이블에 저장된 게시글을 검색하여 반환하는 메소드
		public NoticeDTO selectNumBoard(int num) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			NoticeDTO board=null;
			try {
				con=getConnection();
				
				String sql="select * from notice where notice_no=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					board=new NoticeDTO();
					board.setNoticeNo(rs.getInt("notice_no"));
					board.setNoticeTitle(rs.getString("notice_title"));
					board.setNoticeContents(rs.getString("notice_contents"));
					board.setNoticeDate(rs.getString("notice_date"));
					board.setNoticeReadcount(rs.getInt("notice_readcount"));
					board.setNoticeStatus(rs.getInt("notice_status"));
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectNumBoard() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return board;
		}
	
		//BOARD_SEQ 시퀸스 객체의 다음값을 검색하여 반환하는 메소드
		   public int selectNextNum() {
		      Connection con=null;
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      int nextNum=0;
		      try {
		         con=getConnection();
		         
		         String sql="select notice_seq.nextval from dual";
		         pstmt=con.prepareStatement(sql);
		         
		         rs=pstmt.executeQuery();
		         
		         if(rs.next()) {
		            nextNum=rs.getInt(1);
		         }
		      } catch (SQLException e) {
		         System.out.println("[에러]selectNextNum() 메소드의 SQL 오류 = "+e.getMessage());
		      } finally {
		         close(con, pstmt, rs);
		      } 
		      return nextNum;
		   }
		
		
		//게시글번호를 전달받아 BOARD 테이블에 저장된 해당 게시글의 조회수를
		//1 증가되도록 변경하고 변경행의 갯수를 반환하는 메소드
		public int updateReadCount(int num) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="update notice set notice_readcount=notice_readcount+1 where notice_no=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]updateReadCount() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt); 
			}
			return rows;
		}
	
		
		
		public NoticeDTO selectNumNotice(int number) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			NoticeDTO board=null;
			try {
				con=getConnection();
				
				String sql="select * from board where notice_no=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, number);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					board=new NoticeDTO();
					board.setNoticeNo(rs.getInt("notice_no"));
					board.setNoticeTitle(rs.getString("notice_title"));
					board.setNoticeContents(rs.getString("notice_contents"));
					board.setNoticeDate(rs.getString("notice_date"));
					board.setNoticeReadcount(rs.getInt("notice_readcount"));
					board.setNoticeStatus(rs.getInt("notice_status"));
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectNumNotice 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return board;
		}
}
