package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
