package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jm_dto.ProductInfoDTO;
import jm_dto.UserInfoDTO;

public class ProductInfoDAO extends JdbcDAO {
	/*
	private String prodCd;
	private String ctgrCd;
	private String prodNm;
	private int prodPrice;
	private String prodDetl;
	private int viewCnt;
	private String mainExpYn;
	private String salesYn;
	private String delYn;
	private String frstRgsrUsrno;
	private String frstRgstDttm;
	private String lastProcrUsrno;
	private String lastProcDttm;
	
	 */

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
	//��ǰ�ڵ带 ���޹޾� ProductInfo ���̺� ����� �ش� ��ǰ�ڵ带 �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
	public ProductInfoDTO selectProductInfo(String prodCd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductInfoDTO productInfo = null;
		try {
			con = getConnection();

			String sql = "SELECT B.PROD_CD , A.CTGR_NM , B.PROD_NM , B.PROD_PRICE , B.PROD_DETL , B.VIEW_CNT , B.MAIN_EXP_YN\r\n" + 
					", B.SALES_YN , C.FILE_PATH || '/' || C.SRVR_FILE_NM   FILE_NM , TO_CHAR(B.FRST_RGST_DTTM, 'YYYY.MM.DD')   RGST_DT  FROM PROD_CTGR_INFO A  LEFT OUTER JOIN  PRODUCT_INFO B ON A.CTGR_CD = B.CTGR_CD\r\n" + 
					" INNER JOIN  PROD_FILE_HIS C ON B.PROD_CD = C.PROD_CD  WHERE B.PROD_CD = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, prodCd);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				productInfo = new ProductInfoDTO();
				productInfo.setProdCd(rs.getString("prodCd"));
				productInfo.setCtgrCd(rs.getString("ctgrCd"));
				productInfo.setProdPrice(rs.getString("prodPrice"));
				productInfo.setProdDetl(rs.getString("prodDetl"));
				productInfo.setPostCd(rs.getString("postCd"));
				productInfo.setBasAddr(rs.getString("basAddr"));
				productInfo.setDetlAddr(rs.getString("detlAddr"));
				productInfo.setUserDv(rs.getString("firstRgstDttm"));

			}
		} catch (SQLException e) {
			System.out.println("[����]selectProductInfo() �޼ҵ��� SQL ���� = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productInfo;
	}
	
}
