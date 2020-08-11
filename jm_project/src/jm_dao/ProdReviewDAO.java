package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	
	//리뷰 추가
	public int insertReview(ProdReviewDTO review) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into prod_review values(?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, review.getPostNo());
			pstmt.setString(2, review.getProdNo());
			pstmt.setString(3, review.getContent());
			pstmt.setInt(4, review.getProdGrd());
			pstmt.setString(5, review.getFrstRgsrUsrno());
			pstmt.setString(6, review.getFrstRgstDttm());
			pstmt.setString(7, review.getLastProcrUsrno());
			pstmt.setString(8, review.getLastProcDttm());
	
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertReview() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con,pstmt);
		}
		return rows;
	}
	
	//리뷰글 선택
	public ProdReviewDTO selectCtgr(String ctgr) {
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
				ctgrProd.setProdNo(rs.getString("prod_no"));
				ctgrProd.setContent(rs.getString("content"));
				ctgrProd.setProdGrd(rs.getInt("prod_grd"));
				ctgrProd.setFrstRgsrUsrno(rs.getString("frst_rgsr_usrno"));
				ctgrProd.setFrstRgstDttm(rs.getString("frst_rgst_dttm"));
				ctgrProd.setLastProcrUsrno(rs.getString("last_procr_usrno"));
				ctgrProd.setLastProcDttm(rs.getString("last_proc_dttm"));
			}
			
		} catch (SQLException e) {
			System.out.println("[에러]selectReview 메소드의 sql 오류=" +e.getMessage());
		}finally {
			close(con,pstmt,rs);
		}
		return ctgrProd;
	}
	
	//리뷰 수정
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
			System.out.println("[에러]updateReview() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
}
