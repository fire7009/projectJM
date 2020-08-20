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
	
	//리뷰 추가
	public int insertReview(ProdReviewDTO review) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			//prod_grd -> 별점인데 일단은 빼봄...
			
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
			System.out.println("[에러]insertReview() 메소드의 SQL 오류 = "+e.getMessage());
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
			System.out.println("[에러]udpateNumReview() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return rows;
	}
	
	//게시글 번호를 전달받아 BOARD 테이블에 저장된 게시글을 검색하여 반환하는 메소드
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
			System.out.println("[에러]selectNumBoard() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return review;
	}
	
	//리뷰 게시글의 시작 행번호와 종료 행번호를 전달받아 테이블에 저장된 
	//게시글에서 시작과 종료 범위에 포함된 게시글만 검색하여 반환하는 메소드
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
				System.out.println("[에러]selectReviewBoard() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return boardReviewList;
		}
	/*
	//리뷰글 선택
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
			System.out.println("[에러]selectReview 메소드의 sql 오류=" +e.getMessage());
		}finally {
			close(con,pstmt,rs);
		}
		return ctgrProd;
	}
	*/
	
	//리뷰 수정
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
			System.out.println("[에러]updateReview() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	//게시글 갯수 검색
	public int selectReviewCount(String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			
			if(keyword.equals("")) {//검색을 하지 않은 경우
				String sql="select count(*) from prod_review";
				pstmt=con.prepareStatement(sql);
			}else {//검색을 한 경우
				String sql="select count(*) from prod_review where "+search+" like '%'||?||'%'";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectReviewCount 메소드의 sql 오류=" +e.getMessage());
		} finally {
			close(con,pstmt,rs);
		}
		
		return count;
	}
	
	//조회수
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
			System.out.println("[에러]updateReadCount() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt); 
		}
		return rows;
	}
	//게시글번호를 전달받아 BOARD 테이블에 저장된 해당 게시글을 삭제
	//처리하는 처리행의 갯수를 반환하는 메소드 
	// => 게시글의 상태 컬럼값을 삭제 상태(9)로 변경
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
			System.out.println("[에러]deleteReview() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt); 
		}
		return rows;
	}
}
