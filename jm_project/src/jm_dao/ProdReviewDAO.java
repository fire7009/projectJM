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
			//prod_grd -> �����ε� �ϴ��� ����...
			
			String sql="insert into prod_review(post_no, PROD_CD, content,frst_rgst_dttm,last_proc_dttm,readcount,"
					+ "id,writer,subject,ip,status)"
					+ " values((select nvl(max(post_no),0)+1 post_no from prod_review), '1001', ?,sysdate"
					+ ",sysdate,0,?,?,?,?,?)";
		
			pstmt=con.prepareStatement(sql);
			//pstmt.setString(1, review.getProdCd());
			pstmt.setString(1, review.getContent());
			pstmt.setString(2, review.getId());
			pstmt.setString(3, review.getWriter());
			pstmt.setString(4, review.getSubject());
			pstmt.setString(5, review.getIp());
			pstmt.setInt(6, review.getStatus());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]insertReview() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con,pstmt);
		}
		return rows;
	}
	
	
	public int udpateNumReview(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int rows = 0;
		
		try {
			con = getConnection();
			
			String sql = "update prod_review set post_no=post_no+1 where post_no = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]udpateNumReview() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return rows;
	}
	
	//�Խñ� ��ȣ�� ���޹޾� BOARD ���̺� ����� �Խñ��� �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
	public ProdReviewDTO selectNumBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProdReviewDTO review = null;
		try {
			con = getConnection();
			
			String sql = "select * from prod_review where post_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				review = new ProdReviewDTO();
				
				review.setPostNo(rs.getString("post_no"));
				review.setProdCd(rs.getString("prod_cd"));
				review.setContent(rs.getString("content"));
				review.setProdGrd(rs.getInt("prod_grd"));
				review.setFrstRgsrUsrno(rs.getString("frst_rgsr_usrno"));
				review.setFrstRgstDttm(rs.getString("frst_rgst_dttm"));
				review.setLastProcrUsrno(rs.getString("last_procr_usrno"));
				review.setLastProcDttm(rs.getString("last_proc_dttm"));
				review.setReadcount(rs.getInt("readcount"));
				review.setId(rs.getString("id"));
				review.setWriter(rs.getString("writer"));
				review.setSubject(rs.getString("subject"));
				review.setIp(rs.getString("ip"));
				review.setStatus(rs.getInt("status"));
				
			}
			
		} catch (SQLException e) {
			System.out.println("[����]selectNumBoard() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return review;
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
						+ "select * from prod_review order by post_no"
						+ ") temp) where rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
				} else {
					String sql="select * from (select rownum rn,temp.* from ("
							+ "select * from prod_review where "+search
							+" like '%'||?||'%' and status!=9 order by post_no"
							+ ") temp) where rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, keyword);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
				}
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					ProdReviewDTO review = new ProdReviewDTO();
					
					review.setPostNo(rs.getString("post_no"));
					review.setProdCd(rs.getString("prod_cd"));
					review.setContent(rs.getString("content"));
					review.setProdGrd(rs.getInt("prod_grd"));
					review.setFrstRgsrUsrno(rs.getString("frst_rgsr_usrno"));
					review.setFrstRgstDttm(rs.getString("frst_rgst_dttm"));
					review.setLastProcrUsrno(rs.getString("last_procr_usrno"));
					review.setLastProcDttm(rs.getString("last_proc_dttm"));
					review.setRef(rs.getInt("ref"));
					review.setReadcount(rs.getInt("readcount"));
					review.setReStep(rs.getInt("re_step"));
					review.setReLevel(rs.getInt("re_level"));
					review.setId(rs.getString("id"));
					review.setWriter(rs.getString("writer"));
					review.setSubject(rs.getString("subject"));
					review.setIp(rs.getString("ip"));
					review.setStatus(rs.getInt("status"));
					boardReviewList.add(review);
				}
			} catch (SQLException e) {
				System.out.println("[����]selectReviewBoard() �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return boardReviewList;
		}
	/*
	//����� ����
	public ProdReviewDTO selectReview(String review) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProdReviewDTO review =null;
		try {
			con=getConnection();
			
			String sql="select * from prod_review where post_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, review);
			
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
	*/
	
	//���� ����
	public int updateReview(ProdReviewDTO review) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update prod_review set subject=?, content=?, status=? where post_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, review.getSubject());
			pstmt.setString(2, review.getContent());
			pstmt.setInt(3, review.getStatus());
			pstmt.setString(4, review.getPostNo());
			
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
				pstmt=con.prepareStatement(sql);
			}else {//�˻��� �� ���
				String sql="select count(*) from prod_review where "+search+" like '%'||?||'%'";
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
	
	//��ȸ��
	public int updateReadCount(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update prod_review set readcount=readcount+1 where post_no=?";
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
	//�Խñ۹�ȣ�� ���޹޾� BOARD ���̺� ����� �ش� �Խñ��� ����
	//ó���ϴ� ó������ ������ ��ȯ�ϴ� �޼ҵ� 
	// => �Խñ��� ���� �÷����� ���� ����(9)�� ����
	public int deleteReview(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update prod_review set status = 9 where post_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]deleteReview() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt); 
		}
		return rows;
	}
}
