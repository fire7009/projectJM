package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
			con=getConnection();
			
			String sql="insert into cart_his(his_seqno,prod_cd,prod_qty,ord_yn,del_yn,"
					+ "frst_rgsr_usrno,frst_rgst_dttm,last_procr_usrno,last_proc_dttm)"
					+ "values((select(nvl(max(his_seqno),0)+1)from cart_his),?,?,?,?,'1',sysdate,'1',sysdate)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, cart.getProdCd());
			pstmt.setInt(2, cart.getProdQty());
			pstmt.setString(3, cart.getOrdYn());
			pstmt.setString(4, cart.getDelYn());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertCart()메소드의 sql 오류=" +e.getMessage());
		}finally {
			close(con,pstmt);
		}
		return rows;
	}
	
	
	//선택된 his코드에 해당하는 장바구니 목록 출력
	public List<CartHisDTO> selectCartList(String pcode) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CartHisDTO> cartList=new ArrayList<CartHisDTO>();
		try {
			con=getConnection();
			
			String sql="select his_seqno,prod_cd,prod_qty,ord_yn,del_yn from cart_his where prod_cd=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,pcode);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				CartHisDTO cart=new CartHisDTO();
				cart.setHisSeqno(rs.getString("his_seqno"));
				cart.setProdCd(rs.getString("prod_cd"));
				cart.setProdQty(rs.getInt("prod_qty"));
				cart.setOrdYn(rs.getString("ord_yn"));
				cart.setDelYn(rs.getString("del_yn"));
				cartList.add(cart);
			}
			
		} catch (SQLException e) {
			System.out.println("[에러]selectCart 메소드의 sql 오류=" +e.getMessage());
		}finally {
			close(con,pstmt,rs);
		}
		return cartList;
	}
	
	public int deleteCart(String his) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from cart_his where his_seqno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, his);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteCart() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
}
