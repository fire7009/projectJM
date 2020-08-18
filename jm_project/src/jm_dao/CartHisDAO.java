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

	//��ٱ��Ͽ� �� �߰�
	public int insertCart(CartHisDTO cart) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into cart_his(his_seqno,prod_cd,prod_qty,"
					+ "frst_rgsr_usrno)"
					+ "values((select(nvl(max(his_seqno),0)+1)from cart_his),?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, cart.getProdCd());
			pstmt.setInt(2, cart.getProdQty());
			pstmt.setString(3,cart.getFrstRgsrUsrno());
	
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]insertCart()�޼ҵ��� sql ����=" +e.getMessage());
		}finally {
			close(con,pstmt);
		}
		return rows;
	}
	
	
	//���õ� ����� �ڵ忡 �ش��ϴ� ��ٱ��� ��� ���
	public List<CartHisDTO> selectCartList(String frst) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CartHisDTO> cartList=new ArrayList<CartHisDTO>();
		try {
			con=getConnection();
			
			String sql="select his_seqno,prod_cd,prod_qty,ord_yn,del_yn from cart_his where frst_rgsr_usrno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,frst);
			
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
			System.out.println("[����]selectCart �޼ҵ��� sql ����=" +e.getMessage());
		}finally {
			close(con,pstmt,rs);
		}
		return cartList;
	}
	
	//���õ� ����� �ڵ�� his�� �ش��ϴ� ��ٱ��� ��� ���
	public List<CartHisDTO> selectCartListTwo(String frst, String his) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CartHisDTO> cartList=new ArrayList<CartHisDTO>();
		try {
			con=getConnection();
			
			String sql="select his_seqno,prod_cd,prod_qty,ord_yn,del_yn from cart_his where frst_rgsr_usrno=? and his_seqno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,frst);
			pstmt.setString(2,his);

			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				CartHisDTO cart=new CartHisDTO();
				cart.setProdCd(rs.getString("prod_cd"));
				cart.setProdQty(rs.getInt("prod_qty"));
				cart.setOrdYn(rs.getString("ord_yn"));
				cart.setDelYn(rs.getString("del_yn"));
				cartList.add(cart);
			}
			
		} catch (SQLException e) {
			System.out.println("[����]selectCart �޼ҵ��� sql ����=" +e.getMessage());
		}finally {
			close(con,pstmt,rs);
		}
		return cartList;
	}
	
	//������ ��ٱ����� his code�� �ش��ϴ� ���� ����
	public int updateQtyCart(int num,String his, String user) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update cart_his set prod_qty=? where his_seqno=? and frst_rgsr_usrno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, his);
			pstmt.setString(3, user);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
		} finally {
			close(con,pstmt);
		}
		return rows;
	}
	
	public int updateDelCart(String user,String his) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update cart_his set del_yn=? where his_seqno=? and frst_rgsr_usrno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "Y");
			pstmt.setString(2, his);
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
