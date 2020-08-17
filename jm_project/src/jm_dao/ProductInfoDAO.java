package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jm_dto.ProductInfoDTO;
import jm_dto.UserInfoDTO;

public class ProductInfoDAO extends JdbcDAO {


	private static ProductInfoDAO _dao;

	public ProductInfoDAO() {//
		// TODO Auto-generated constructor stub
	}

	static {
		_dao = new ProductInfoDAO();
	}

	public static ProductInfoDAO getDAO() {
		return _dao;
	}

	// ��ǰ���� ���޹޾� ProductInfo ���̺� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
	// => ��ǰ�ڵ�, ī�װ��ڵ�, ��ǰ��, ��ǰ����, ��ǰ��, ���ʵ����ȸ����ȣ, ����ó����ȸ����ȣ
	public int insertProductInfo(ProductInfoDTO ProductInfo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "insert into product_Info(prod_cd, ctgr_cd, prod_nm, prod_price, prod_detl, frst_rgst_usrno"
					+ ", last_procr_usrno) values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ProductInfo.getProdCd());
			pstmt.setString(2, ProductInfo.getCtgrCd());
			pstmt.setString(3, ProductInfo.getProdNm());
			pstmt.setString(4, ProductInfo.getProdDetl());
			pstmt.setString(5, ProductInfo.getFirstRgstUsrno());
			pstmt.setString(6, ProductInfo.getLastProcrUsrno());

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]insertProductInfo() �޼ҵ��� SQL ���� = " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	
	
	
	//��ǰ���� �� ��ȸ 
	//��ǰ�ڵ带 ���޹޾� ProductInfo ���̺� ����� �ش� ��ǰ�ڵ忡 �ش��ϴ� ��ǰ�� �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
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
			System.out.println("[����]selectProductInfo() �޼ҵ��� SQL ���� = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productInfo;
	}
	
}
