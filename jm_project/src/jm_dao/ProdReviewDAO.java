package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jm_dto.ProdReviewDTO;

public class ProdReviewDAO extends JdbcDAO {
	private static ProdReviewDAO _dao;
	
	public ProdReviewDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new ProdReviewDAO();
	}
	public static ProdReviewDAO getDAO() {
		return _dao;
	}
	
	//���� �߰�
	public int insertReview(ProdReviewDTO review) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into prod_review values(?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, review.getPostNo());
			pstmt.setString(2, review.getProdCd());
			pstmt.setString(3, review.getContent());
			pstmt.setInt(4, review.getProdGrd());
			pstmt.setString(5, review.getFrstRgsrUsrno());
			pstmt.setString(6, review.getFrstRgstDttm());
			pstmt.setString(7, review.getLastProcrUsrno());
			pstmt.setString(8, review.getLastProcDttm());
	
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]insertReview() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con,pstmt);
		}
		return rows;
	}
	
	//���� �Խñ��� ���� ���ȣ�� ���� ���ȣ�� ���޹޾� ���̺� ����� 
	//�Խñۿ��� ���۰� ���� ������ ���Ե� �Խñ۸� �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
		public List<ProdReviewDTO> selectReviewBoard(int startRow, int endRow, String search, String keyword) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<ProdReviewDTO> boardReviewList=new ArrayList<ProdReviewDTO>();
			try {
				con=getConnection();
				
				if(keyword.equals("")) {
					String sql="select * from (select rownum rn,temp.* from ("
						+ "select * from board order by post_no"
						+ ") temp) where rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
				} else {
					String sql="select * from (select rownum rn,temp.* from ("
							+ "select * from board where "+search
							+" like '%'||?||'%' and status!=9 order by post_no"
							+ ") temp) where rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, keyword);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
				}
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					ProdReviewDTO boardReview = new ProdReviewDTO();
					
					boardReview.setPostNo(rs.getString("postNo"));
					boardReview.setProdCd(rs.getString("prodCd"));
					boardReview.setContent(rs.getString("content"));
					boardReview.setProdGrd(rs.getInt("prodGrd"));
					boardReview.setFrstRgsrUsrno(rs.getString("frstRgsrUsrno"));
					boardReview.setFrstRgstDttm(rs.getString("frstRgstDttm"));
					boardReview.setLastProcrUsrno(rs.getString("lastProcrUsrno"));
					boardReview.setLastProcDttm(rs.getString("lastProcDttm"));
					
					boardReviewList.add(boardReview);
				}
			} catch (SQLException e) {
				System.out.println("[����]selectReviewBoard() �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return boardReviewList;
		}
	
	//����� ����
	public ProdReviewDTO selectReview(String ctgr) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProdReviewDTO ctgrProd=null;
		try {
			con=getConnection();
			
			String sql="select * from prod_ctgr_info where ctgr_cd=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,ctgr);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				ctgrProd.setPostNo(rs.getString("post_no"));
				ctgrProd.setProdCd(rs.getString("prod_cd"));
				ctgrProd.setContent(rs.getString("content"));
				ctgrProd.setProdGrd(rs.getInt("prod_grd"));
				ctgrProd.setFrstRgsrUsrno(rs.getString("frst_rgsr_usrno"));
				ctgrProd.setFrstRgstDttm(rs.getString("frst_rgst_dttm"));
				ctgrProd.setLastProcrUsrno(rs.getString("last_procr_usrno"));
				ctgrProd.setLastProcDttm(rs.getString("last_proc_dttm"));
			}
			
		} catch (SQLException e) {
			System.out.println("[����]selectReview �޼ҵ��� sql ����=" +e.getMessage());
		}finally {
			close(con,pstmt,rs);
		}
		return ctgrProd;
	}
	
	//���� ����
	public int updateReview(String review,String no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update prod_review set content=? where post_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, review);
			pstmt.setString(2, no);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]updateReview() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//�Խñ� ���� �˻�
	public int selectReviewCount(String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			
			if(keyword.equals("")) {//�˻��� ���� ���� ���
				String sql="select count(*) from prod_review";
			}else {//�˻��� �� ���
				String sql="select count(*) from board where"+search+" like '%'||?||'%'";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[����]selectReviewCount �޼ҵ��� sql ����=" +e.getMessage());
		} finally {
			close(con,pstmt,rs);
		}
		
		return count;
	}
}
