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
	
	
	// �������� �ۼ�
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
			System.out.println("[����]insertNotice() �޼ҵ��� SQL ���� = "+e.getMessage());
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
			System.out.println("[����]updateNotice() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	*/
	
	
	// �������� ����
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
			System.out.println("[����]updateNotice() �޼ҵ��� SQL ���� = "+e.getMessage());
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
				
				//�޼ҵ��� �Ű������� ���尪�� ���� �ٸ� SQL ����� ����
				//�Ͽ� ����ǵ��� ���� - ���� SQL
				if(keyword.equals("")) {//�˻� ����� ������� ���� ���
					
						String sql="select count(*) from notice";
						pstmt=con.prepareStatement(sql);
					
					
				} else {//�˻� ����� ����� ���
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
				System.out.println("[����]selectBoardCount() �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return count;
		}
	
	
		//�Խñ��� ���� ���ȣ�� ���� ���ȣ�� ���޹޾� BOARD ���̺� ����� 
		//�Խñۿ��� ���۰� ���� ������ ���Ե� �Խñ۸� �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
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
					noticeBoard.setNoticeDate(rs.getString("notice_date")); // �ۼ���¥
					noticeBoard.setNoticeStatus(rs.getInt("notice_status"));  // ����
					if (noticeBoard.getNoticeStatus()==2) {
						noticeBoardList.add(noticeBoard);
					}
					//-- 0 : ���� 1 : �ӽ�����  2 : �ۿø��� 
				}
			} catch (SQLException e) {
				System.out.println("[����]selectBoard() �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return noticeBoardList;
		}
		
		
	
		//�Խñ� ��ȣ�� ���޹޾� BOARD ���̺� ����� �Խñ��� �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
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
					noticeBoard.setNoticeDate(rs.getString("notice_date")); // �ۼ���¥
					noticeBoard.setNoticeStatus(rs.getInt("notice_status"));  // ����
				}
			} catch (SQLException e) {
				System.out.println("[����]selectNumBoard() �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return noticeBoard;
		}
	
	
		
		
		//�Խñ۹�ȣ�� ���޹޾� BOARD ���̺� ����� �ش� �Խñ��� ��ȸ����
		//1 �����ǵ��� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
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
				System.out.println("[����]updateReadCount() �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, pstmt); 
			}
			return rows;
		}

		
}
