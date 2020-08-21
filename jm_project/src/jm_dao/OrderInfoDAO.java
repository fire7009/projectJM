package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jm_dto.OrderInfoDTO;
import jm_dto.ProductInfoDTO;

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
	public List<OrderInfoDTO> selectOrderInfo(String ordNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrderInfoDTO> orderList=new ArrayList<OrderInfoDTO>();
		try {
			con = getConnection();

			String sql = "select ord_sum_qty,ord_sum_amt,rcvr_nm,dlvr_post_cd,dlvr_bas_addr,dlvr_detl_addr,"
					+ "ord_cncl_yn from order_info where ord_no=? order by to_number(ord_no)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ordNo);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				OrderInfoDTO order=new OrderInfoDTO();
				order.setOrdSumQty(rs.getInt("ord_sum_qty"));
				order.setOrdSumAmt(rs.getInt("ord_sum_amt"));
				order.setRcvrNm(rs.getString("rcvr_nm"));
				order.setDlvrPostCd(rs.getString("dlvr_post_cd"));
				order.setDlvrBasAddr(rs.getString("dlvr_bas_addr"));
				order.setDlvrDetlAddr(rs.getString("dlvr_detl_addr"));
				order.setOrdCnclYn(rs.getString("ord_cncl_yn"));
				orderList.add(order);
			}
			
		} catch (SQLException e) {
			System.out.println("[에러]selectOrderInfo()의 SQL오류 = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderList;
	}
	
	//주문정보 선택
	public List<OrderInfoDTO> selectOrderInfoTwo(int startRow, int endRow, String user) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrderInfoDTO> orderList=new ArrayList<OrderInfoDTO>();
		try {
			con = getConnection();
			
			String sql = "select ord_sum_amt,rcvr_nm,dlvr_post_cd,dlvr_bas_addr,dlvr_detl_addr,"
					+ "ord_cncl_yn from (select rownum rn, temp.* from("
					+ "select * from order_info order by to_number(ord_no)"
					+ " ) temp) where rn between ? and ? and frst_rgsr_usrno=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2,endRow);
			pstmt.setString(3, user);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				OrderInfoDTO order=new OrderInfoDTO();
				order.setOrdSumAmt(rs.getInt("ord_sum_amt"));
				order.setRcvrNm(rs.getString("rcvr_nm"));
				order.setDlvrPostCd(rs.getString("dlvr_post_cd"));
				order.setDlvrBasAddr(rs.getString("dlvr_bas_addr"));
				order.setDlvrDetlAddr(rs.getString("dlvr_detl_addr"));
				order.setOrdCnclYn(rs.getString("ord_cncl_yn"));
				orderList.add(order);
			}
			
		} catch (SQLException e) {
			System.out.println("[에러]selectOrderInfoTwo()의 SQL오류 = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderList;
	}
	
	public int selectOrdCnt(String user) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			
				String sql="select count(*) from order_info where frst_rgsr_usrno=? ";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, user);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectOrdCnt() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return count;
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



