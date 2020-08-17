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
			
			String sql = "insert into order_info values(?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, sysdate, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, orderInfo.getOrdNo());
			pstmt.setInt(2, orderInfo.getOrdSumQty());
			pstmt.setInt(3, orderInfo.getOrdSumAmt());
			pstmt.setString(4, orderInfo.getRcvrNm());
			pstmt.setString(5, orderInfo.getDlvrPostCd());
			pstmt.setString(6, orderInfo.getDlvrBasAddr());
			pstmt.setString(7, orderInfo.getDlvrDetlAddr());
			pstmt.setString(8, orderInfo.getOrdCnclYn());
			pstmt.setString(9, orderInfo.getFrstRgsrUsno());
			pstmt.setString(10, orderInfo.getLastProcrUsrno());

			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[에러]insertOrderInfo() 메소드의 SQL 오류" + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//주문정보 선택 쿼리
	//public 
	
	//주문정보 수정 쿼리
	
}
