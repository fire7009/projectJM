package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jm_dto.ProdFileHisDTO;

public class ProdFileHisDAO extends JdbcDAO {
	private static ProdFileHisDAO _dao;
	
	public ProdFileHisDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao = new ProdFileHisDAO();
	}
	
	public static ProdFileHisDAO getDAO() {
		return _dao;
	}
	
	//상품등록쿼리
	
	public int insertProdFileHis(ProdFileHisDTO prodFileHis) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		int rows = 0;
		
		try {
			con = getConnection();
			
			String sql = "insert into prod_file_his values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, prodFileHis.getHisSeqno());
			pstmt.setString(2, prodFileHis.getProdCd());
			pstmt.setString(3, prodFileHis.getFilePath());
			pstmt.setString(4, prodFileHis.getOrgnFileNm());
			pstmt.setString(5, prodFileHis.getSrvrFileNm());
			pstmt.setString(6, prodFileHis.getFrstRgsrUsrno());
			pstmt.setString(7, prodFileHis.getLastProcrUsrno());

			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[에러]insertProdFileHis() 메소드의 SQL 오류" + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		
		return rows;
	}
	
	/*
	//상품정보조회 쿼리(너무 어려움)
	
	public ProdFileHisDTO selectProdFileHis(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProdFileHisDTO prodFileHis = null;
		try {
			con = getConnection();

			String sql = "SELECT B.PROD_CD, A.CTGR_NM, B.PROD_NM, B.PROD_PRICE, B.PROD_DETL, B.VIEW_CNT"+ 
					", B.MAIN_EXP_YN, B.SALES_YN, C.FILE_PATH || '/' ||C.SRVR_FILE_NM	FILE_NM" + 
					", TO_CHAR(B.FRST_RGST_DTTM,'YYYY.MM.DD')RGST_DT FROM PROD_CTGR_INFO A" + 
					" LEFT OUTER JOIN PRODUCT_INFO B ON A.CTGR_CD = B.CTGR_CD INNER JOIN PROD_FILE_HIS C ON B.PROD_CD = C.PROD_CD"
					+ "WHERE B.PROD_CD = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

	
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectMember() 메소드의 SQL 오류 " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return member;
	}
	*/
	
	// 상품 조회수 증가 쿼리
	public int updateProductViewCnt(String prodCd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update product_info set view_cnt = view_cnt+1 where prod_cd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, prodCd);

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateProductViewCnt() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	//상품정보 수정 쿼리
	public int updateProductInfo(String prodCd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update product_info set prod_nm = ?, prod_price = ?, prod_detl = ?"
					+ " main_exp_yn = ?, sales_yn = ?, last_proc_dttm = sysdate where prod_cd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, prodCd);

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateProductInfo() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	
}
