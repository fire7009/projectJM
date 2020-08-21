package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jm_dto.NoticeDTO;


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
				
				//�޼ҵ��� �Ű������� ���尪�� ���� �ٸ� SQL ������ �����Ͽ� ����ǵ��� ���� - ���� SQL
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
	
	
		//�Խñ��� ���� ���ȣ�� ���� ���ȣ�� ���޹޾� BOARD ���̺��� ����� 
		//�Խñۿ��� ���۰� ���� ������ ���Ե� �Խñ۸� �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
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
					//-- 0 : ���� 1 : �ӽ����� 2:�ۿø��� 
				}
			} catch (SQLException e) {
				System.out.println("[����]selectBoard() �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return boardList;
		}
	
		//�Խñ� ��ȣ�� ���޹޾� BOARD ���̺��� ����� �Խñ��� �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
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
				System.out.println("[����]selectNumBoard() �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return board;
		}
	
	
		//�Խñ۹�ȣ�� ���޹޾� BOARD ���̺��� ����� �ش� �Խñ��� ��ȸ����
		//1 �����ǵ��� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
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
				System.out.println("[����]updateReadCount() �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, pstmt); 
			}
			return rows;
		}
	
	
}