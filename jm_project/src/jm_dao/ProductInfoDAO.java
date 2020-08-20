package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	//
	public int insertProductInfo(ProductInfoDTO product) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "insert into product_info(prod_cd,ctgr_cd, prod_nm,prod_price,bas_file_path,bas_file_nm,detl_file_path,detl_file_nm,\r\n"
					+ "prod_detl,view_cnt,main_exp_yn,del_yn,frst_rgsr_usrno,last_procr_usrno) values((SELECT (NVL(MAX(PROD_CD), 0) + 1) FROM PRODUCT_INFO),?,?,?,?,?,?,?,?,?,?,?,?,?);";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, product.getCtgrCd());
			pstmt.setString(2, product.getProdNm());
			pstmt.setInt(3, product.getProdPrice());
			pstmt.setString(4, product.getBasFilePath());
			pstmt.setString(5, product.getBasFileNm());
			pstmt.setString(6, product.getDetlFilePath());
			pstmt.setString(7, product.getDetlFileNm());
			pstmt.setString(8, product.getProdDetl());
			pstmt.setInt(9, product.getViewCnt());
			pstmt.setString(10, product.getMainExpYn());
			pstmt.setString(11, product.getDelYn());
			pstmt.setString(12, product.getFrstRgsrUsrno());
			pstmt.setString(13, product.getLastProcrUsrno());

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertProductInfo()의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public ProductInfoDTO selectProductInfo(String prodCd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductInfoDTO product = null;
		try {
			con = getConnection();

			String sql = "SELECT B.PROD_CD" + ", B.PROD_NM" + ", B.PROD_PRICE" + ", B.BAS_FILE_PATH" + ", B.BAS_FILE_NM"
					+ ", B.DETL_FILE_PATH" + ", B.DETL_FILE_NM" + ", B.PROD_DETL" + " FROM PROD_CTGR_INFO A"
					+ " INNER JOIN" + " PRODUCT_INFO B" + " ON A.CTGR_CD = B.CTGR_CD" + " WHERE B.PROD_CD = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, prodCd);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				product = new ProductInfoDTO();
				product.setProdCd(rs.getString("prod_cd"));
				product.setProdNm(rs.getString("prod_nm"));
				product.setProdPrice(rs.getInt("prod_price"));
				product.setBasFileNm(rs.getString("bas_file_nm"));
				product.setBasFileNm(rs.getString("bas_file_path"));
				product.setBasFileNm(rs.getString("detl_file_nm"));
				product.setBasFileNm(rs.getString("detl_file_path"));
				product.setProdDetl(rs.getString("prod_detl"));
			}

		} catch (SQLException e) {
			System.out.println("[에러]selectProductInfo()의 SQL오류 = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return product;
	}

	public int updateProduct(String delYn, String prodCd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update product_info set del_yn=? where prod_cd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delYn);
			pstmt.setString(2, prodCd);

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public List<ProductInfoDTO> selectCategoryProduct(String category) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductInfoDTO> productList = new ArrayList<ProductInfoDTO>();
		try {
			con = getConnection();

			if (category.equals("ALL")) {
				String sql = "select * from product_info order by frst_rgst_dttm desc";
				pstmt = con.prepareStatement(sql);
			} else {
				String sql = "select * from product_info where ctgr_cd like ?||'%' order by prod_cd";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, category);
			}

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductInfoDTO product = new ProductInfoDTO();
				product.setProdCd(rs.getString("prod_cd"));
				product.setCtgrCd(rs.getString("ctgr_cd"));
				product.setProdNm(rs.getString("prod_nm"));
				product.setProdPrice(rs.getInt("prod_price"));
				product.setBasFilePath(rs.getString("bas_file_path"));
				product.setBasFileNm(rs.getString("bas_file_nm"));
				product.setDetlFilePath(rs.getString("detl_file_path"));
				product.setDetlFileNm(rs.getString("detl_file_nm"));
				product.setProdDetl(rs.getString("prod_detl"));
				product.setViewCnt(rs.getInt("view_cnt"));
				product.setMainExpYn(rs.getString("main_exp_yn"));
				product.setDelYn(rs.getString("del_yn"));
				productList.add(product);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectCategoryProduct() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productList;
	}

}