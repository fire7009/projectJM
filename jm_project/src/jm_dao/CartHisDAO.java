package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jm_dto.CartHisDTO;


public class CartHisDAO extends JdbcDAO{
	private static CartHisDAO _dao;
	
	public CartHisDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao = new CartHisDAO();
	}
	
	public static CartHisDAO getDAO() {
		return _dao;
	}

	//장바구니에 값 추가
	public int insertCart(CartHisDTO cart) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			String sql="insert into cart_his valuse(?,?,?,?,?,1,sysdate,1,sysdate)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, cart.getHisSeqno());
			pstmt.setString(2, cart.getProdCd());
			pstmt.setInt(3, cart.getProdQty());
			pstmt.setString(4, cart.getOrdYn());
			pstmt.setString(5, cart.getDelYn());
			
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertCart()메소드의 sql 오류=" +e.getMessage());
		}finally {
			close(con,pstmt);
		}
		return rows;
	}
	
	//선택된 his코드에 해당하는 장바구니 목록 출력
	public CartHisDTO selectCart(String his) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		CartHisDTO cart=null;
		try {
			con=getConnection();
			
			String sql="select his_seqno,prod_cd,prod_qty,ord_yn,del_yn from cart_his where his_seqno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,his);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cart.setHisSeqno(rs.getString("his_seqno"));
				cart.setProdCd(rs.getString("prod_cd"));
				cart.setProdQty(rs.getInt("prod_qty"));
				cart.setDelYn(rs.getString("del_yn"));
			}
			
		} catch (SQLException e) {
			System.out.println("[에러]selectCart 메소드의 sql 오류=" +e.getMessage());
		}finally {
			close(con,pstmt,rs);
		}
		return cart;
	}
	
	public int updateQtyCart(int num,String his) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update cart_his set prod_qty=? where his_seqno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, his);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
		} finally {
			close(con,pstmt);
		}
		return rows;
	}
}
