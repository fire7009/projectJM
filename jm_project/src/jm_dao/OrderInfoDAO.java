package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


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
			
			String sql = "insert into order_info (ord_no,ord_sum_amt,rcvr_nm,dlvr_post_cd,dlvr_bas_addr,"
					+ "dlvr_detl_addr,frst_rgsr_usrno) values((select(nvl(max(to_number(ord_no)),0)+1)from order_info), ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, orderInfo.getOrdSumAmt());
			pstmt.setString(2, orderInfo.getRcvrNm());
			pstmt.setString(3, orderInfo.getDlvrPostCd());
			pstmt.setString(4, orderInfo.getDlvrBasAddr());
			pstmt.setString(5, orderInfo.getDlvrDetlAddr());
			pstmt.setString(6, orderInfo.getFrstRgsrUsno());
		

			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[에러]insertOrderInfo() 메소드의 SQL 오류" + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//주문정보 선택
	public List<OrderInfoDTO> selectOrdList(String frst) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderInfoDTO> ordList=new ArrayList<OrderInfoDTO>();
		try {
			con=getConnection();
			
			String sql="select ord_no,ord_sum_amt,rcvr_nm,dlvr_post_cd,dlvr_bas_addr,dlvr_detl_addr,ord_cncl_yn from order_info where frst_rgsr_usrno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,frst);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				OrderInfoDTO ord=new OrderInfoDTO();
				ord.setOrdNo(rs.getString("ord_no"));
				ord.setOrdSumAmt(rs.getInt("ord_sum_amt"));
				ord.setRcvrNm(rs.getString("rcvr_nm"));
				ord.setDlvrPostCd(rs.getString("dlvr_post_cd"));
				ord.setDlvrBasAddr(rs.getString("dlvr_bas_addr"));
				ord.setDlvrDetlAddr(rs.getString("dlvr_detl_addr"));
				ord.setOrdCnclYn(rs.getString("ord_cncl_yn"));
				ordList.add(ord);
			}
			
		} catch (SQLException e) {
			System.out.println("[에러]selectOrdList 메소드의 sql 오류=" +e.getMessage());
		}finally {
			close(con,pstmt,rs);
		}
		return ordList;
	}
	
	
	
	//주문내역 삭제
	public int delOrd(String user,String ord) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
		
			String sql="update order_info set ord_cncl_yn=? where ord_no=? and frst_rgsr_usrno=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, "Y");
			pstmt.setString(2, ord);
			pstmt.setString(3, user);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
		} finally {
			close(con,pstmt);
		}
		return rows;
	}
	
}



