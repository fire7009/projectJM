package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jm_dto.NoticeInfoDTO;

public class NoticeInfoDAO extends JdbcDAO {
	private static NoticeInfoDAO _dao;
	
	public NoticeInfoDAO() {
	}
	
	static {
		_dao=new NoticeInfoDAO();
	}
	
	public static NoticeInfoDAO getDAO() {
		return _dao;
	}
	
	
	// 공지사항 작성
	public int insertNotice(NoticeInfoDTO notice) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into notice_info values(?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, notice.getPostNo());
			pstmt.setString(2, notice.getTitle());
			pstmt.setString(3, notice.getContent());
			pstmt.setInt(4, notice.getViewCnt());
			pstmt.setString(5, notice.getFrstRgsrUsrno());
			pstmt.setString(6, notice.getFrstRgstDttm());
			pstmt.setString(7, notice.getLastProcrUsrno());
			pstmt.setString(8, notice.getLastProcDttm());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertNotice() 메소드의 SQL 오류 = "+e.getMessage());
		}finally {
			close(con,pstmt);
		}
		return rows;
	}
	
	
	public NoticeInfoDTO selectNotice(String post) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		NoticeInfoDTO notice=null;
		try {
			con=getConnection();
					
			String sql="select * from notice_info where post_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, post);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				notice=new NoticeInfoDTO();
				notice.setPostNo(rs.getString("post_no"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setViewCnt(rs.getInt("view_cnt"));
				notice.setFrstRgsrUsrno(rs.getString("frst_rgsr_usrno"));
				notice.setFrstRgstDttm(rs.getString("frst_rgst_dttm"));
				notice.setLastProcrUsrno(rs.getString("last_procr_usrno"));
				notice.setLastProcDttm(rs.getString("last_proc_dttm"));
			}
		} catch (SQLException e) {
			// TODO: handle exception
		} finally {
			close(con,pstmt,rs);
		}
		return notice;
	}
		
	/*
	public int updateNotice(String notice,String no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update notice_info set content=? where post_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, notice);
			pstmt.setString(2, no);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateNotice() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	*/
	
	
	// 공지사항 수정
	public int updateNotice(NoticeInfoDTO noticeInfo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update notice_info set title=?, content=? where post_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, noticeInfo.getTitle());
			pstmt.setString(2, noticeInfo.getContent());
			pstmt.setString(3, noticeInfo.getPostNo());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateNotice() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
		
		
	 //----------------------------------------------------------------------------------------------------------------------
	public int selectNoticeCount(String search, String keyword) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int count=0;
			try {
				con=getConnection();
				
				//메소드의 매개변수의 저장값에 따라 다른 SQL 명령을 저장
				//하여 실행되도록 설정 - 동적 SQL
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
	
	
		//게시글의 시작 행번호와 종료 행번호를 전달받아 BOARD 테이블에 저장된 
		//게시글에서 시작과 종료 범위에 포함된 게시글만 검색하여 반환하는 메소드
		public List<NoticeInfoDTO> selectNoticeBoard(int startRow, int endRow, String search, String keyword) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<NoticeInfoDTO> noticeBoardList=new ArrayList<NoticeInfoDTO>();
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
					NoticeInfoDTO noticeBoard=new NoticeInfoDTO();
					noticeBoard.setPostNo(rs.getString("post_no"));
					noticeBoard.setTitle(rs.getString("title"));
					noticeBoard.setContent(rs.getString("content"));
					noticeBoard.setViewCnt(rs.getInt("view_cnt"));
					noticeBoard.setNoticeDate(rs.getString("notice_date")); // 작성날짜
					noticeBoard.setNoticeStatus(rs.getInt("notice_status"));  // 상태
					if (noticeBoard.getNoticeStatus()==2) {
						noticeBoardList.add(noticeBoard);
					}
					//-- 0 : 삭제 1 : 임시저장  2 : 글올리기 
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectBoard() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return noticeBoardList;
		}
		
		
	
		//게시글 번호를 전달받아 BOARD 테이블에 저장된 게시글을 검색하여 반환하는 메소드
		public NoticeInfoDTO selectNumBoard(int num) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			NoticeInfoDTO noticeBoard=null;
			try {
				con=getConnection();
				
				String sql="select * from notice where notice_no=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					noticeBoard=new NoticeInfoDTO();
					noticeBoard.setPostNo(rs.getString("post_no"));
					noticeBoard.setTitle(rs.getString("title"));
					noticeBoard.setContent(rs.getString("content"));
					noticeBoard.setViewCnt(rs.getInt("view_cnt"));
					noticeBoard.setNoticeDate(rs.getString("notice_date")); // 작성날짜
					noticeBoard.setNoticeStatus(rs.getInt("notice_status"));  // 상태
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectNumBoard() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return noticeBoard;
		}
	
	
		
		
		//게시글번호를 전달받아 BOARD 테이블에 저장된 해당 게시글의 조회수를
		//1 증가되도록 변경하고 변경행의 갯수를 반환하는 메소드
		public int updateReadCount(int num) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="update notice_info set view_cnt=view_cnt+1 where post_no=?";
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

		
}
