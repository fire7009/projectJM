package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jm_dto.OrdProdHisDTO;

public class OrdProdHisDAO extends JdbcDAO {
	private static OrdProdHisDAO _dao;
	
	public OrdProdHisDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao = new OrdProdHisDAO();
	}
	
	public static OrdProdHisDAO getDAO() {
		return _dao;
	}
	
	public int insertOrdProdHis(String user,OrdProdHisDTO ordProdHis) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		int rows = 0;

		try {
			con = getConnection();
			
			String sql = "insert into ord_prod_his values(?,(SELECT (NVL(MAX(ORD_NO), 0) + 1) FROM ORD_PROD_HIS), ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ordProdHis.getHisSeqno());
			pstmt.setString(2, ordProdHis.getProdCd());
			pstmt.setInt(3, ordProdHis.getOrdQty());
			pstmt.setString(4, user);


			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[에러]insertOrdProdHis() 메소드의 SQL 오류" + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
}