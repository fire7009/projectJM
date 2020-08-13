package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jm_dto.OrderInfoDTO;

public class OrderInfoDAO extends JdbcDAO {
	private static OrderInfoDAO _dao;
	
	public OrderInfoDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao = new OrderInfoDAO();
	}
	
	public static OrderInfoDAO getDAO() {
		return _dao;
	}
	
	//주문정보 추가 쿼리
	public int insertOrderInfo(OrderInfoDTO orderInfo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		int rows = 0;
		
		try {
			con = getConnection();
			
			String sql = "insert into order_info values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, orderInfo.getOrdNo());
			pstmt.setInt(2, orderInfo.getOrdSumQty());
			pstmt.setInt(3, orderInfo.getOrdSumAmt());
			pstmt.setString(4, orderInfo.getRcvrNm());
			pstmt.setString(5, orderInfo.getDlvrPostCd());
			pstmt.setString(6, orderInfo.getDlvrBasAddr());
			pstmt.setString(7, orderInfo.getDlvrDetlAddr());
			pstmt.setString(8, orderInfo.getOrdPathDv());
			pstmt.setString(9, orderInfo.getPaymtDvcd());
			pstmt.setString(10, orderInfo.getPaystDvcd());
			pstmt.setString(11, orderInfo.getOrdPrcstDvcd());
			pstmt.setString(12, orderInfo.getOrdCnclReqYn());
			pstmt.setString(13, orderInfo.getOrdCnclYn());
			pstmt.setString(14, orderInfo.getOrdCnclRsDvcd());
			pstmt.setString(15, orderInfo.getFrstRgsrUsno());
			pstmt.setString(16, orderInfo.getLastProcrUsrno());

			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[에러]insertOrderInfo() 메소드의 SQL 오류" + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	//주문정보 선택 쿼리
	
	
	//주문정보 수정 쿼리
	
}
