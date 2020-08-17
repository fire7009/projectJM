package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jm_dto.ProductInfoDTO;
import jm_dto.UserInfoDTO;

public class ProductInfoDAO extends JdbcDAO {


	private static ProductInfoDAO _dao;

	public ProductInfoDAO() {
		// TODO Auto-generated constructor stub
	}

	static {
		_dao = new ProductInfoDAO();
	}

	public static ProductInfoDAO getDAO() {
		return _dao;
	}

	// 占쏙옙품占쏙옙占쏙옙 占쏙옙占쌨받억옙 ProductInfo 占쏙옙占싱븝옙 占쏙옙占쏙옙占싹곤옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙환占싹댐옙 占쌨소듸옙
	// => 占쏙옙품占쌘듸옙, 카占쌓곤옙占쌘듸옙, 占쏙옙품占쏙옙, 占쏙옙품占쏙옙占쏙옙, 占쏙옙품占쏙옙, 占쏙옙占십듸옙占쏙옙占싫몌옙占쏙옙占싫�, 占쏙옙占쏙옙처占쏙옙占쏙옙회占쏙옙占쏙옙호
	public int insertProductInfo(ProductInfoDTO ProductInfo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "insert into product_Info(prod_cd, ctgr_cd, prod_nm, prod_price, bas_file_path, bas_file_nm, detl_file_path, detl_file_nm, prod_detl, frst_rgsr_usrno"
					+ ", last_procr_usrno) values((SELECT (NVL(MAX(PROD_CD), 0) + 1) FROM PRODUCT_INFO), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);			
			pstmt.setString(1, ProductInfo.getCtgrCd());
			pstmt.setString(2, ProductInfo.getProdNm());
			pstmt.setInt(3, ProductInfo.getProdPrice());
			pstmt.setString(4, ProductInfo.getBasFilePath());
			pstmt.setString(5, ProductInfo.getBasFileNm());
			pstmt.setString(6, ProductInfo.getDetlFilePath());
			pstmt.setString(7, ProductInfo.getDetlFileNm());
			pstmt.setString(8, ProductInfo.getProdDetl());
			pstmt.setString(9, ProductInfo.getFrstRgsrUsrno());
			pstmt.setString(10, ProductInfo.getLastProcrUsrno());
			
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[占쏙옙占쏙옙]insertProductInfo() 占쌨소듸옙占쏙옙 SQL 占쏙옙占쏙옙 = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	
	
	
	//占쏙옙품占쏙옙占쏙옙 占쏙옙 占쏙옙회 
	//占쏙옙품占쌘드를 占쏙옙占쌨받억옙 ProductInfo 占쏙옙占싱븝옙 占쏙옙占쏙옙占� 占쌔댐옙 占쏙옙품占쌘드에 占쌔댐옙占싹댐옙 占쏙옙품占쏙옙 占싯삼옙占싹울옙 占쏙옙환占싹댐옙 占쌨소듸옙
	public ProductInfoDTO selectProductInfo(String prodCd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductInfoDTO productInfo = null;
		try {
			con = getConnection();

			String sql = "SELECT PROD_CD,CTGR_CD,PROD_NM,PROD_PRICE,PROD_DETL,VIEW_CNT,MAIN_EXP_YN,SALES_YN FROM PRODUCT_INFO WHERE PROD_CD=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, prodCd);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				productInfo = new ProductInfoDTO();
				productInfo.setProdCd(rs.getString("prod_cd"));
				productInfo.setCtgrCd(rs.getString("ctgr_cd"));
				productInfo.setProdNm(rs.getString("prod_nm"));
				productInfo.setProdPrice(rs.getInt("prod_price"));
				productInfo.setProdDetl(rs.getString("prod_detl"));
				productInfo.setViewCnt(rs.getInt("view_cnt"));
				productInfo.setMainExpYn(rs.getString("main_exp_yn"));
				productInfo.setSalesYn(rs.getString("sales_yn"));
			}
			
		} catch (SQLException e) {
			System.out.println("[占쏙옙占쏙옙]selectProductInfo() 占쌨소듸옙占쏙옙 SQL 占쏙옙占쏙옙 = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productInfo;
	}
	
}
