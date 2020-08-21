package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import jm_dto.OrdProdHisDTO;

public class OrdProdHisDAO extends JdbcDAO {
	private static OrdProdHisDAO _dao;
	
	public OrdProdHisDAO() {
		// TODO Auto-generated constructor stubs
	}
	
	static {
		_dao = new OrdProdHisDAO();
	}
	
	public static OrdProdHisDAO getDAO() {
		return _dao;
	}
	
	public int insertOrdProdHis(OrdProdHisDTO ordProdHis) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		int rows = 0;

		try {
			con = getConnection();
			
			String sql = "insert into ord_prod_his(his_seqno,ord_no,prod_cd,ord_qty,frst_rgsr_usrno) values((select(nvl(max(to_number(his_seqno)),0)+1)from ord_prod_his),?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ordProdHis.getOrdNo());
			pstmt.setString(2, ordProdHis.getProdCd());
			pstmt.setInt(3, ordProdHis.getOrdQty());
			pstmt.setString(4, ordProdHis.getFrstRgsrUsrno());


			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[에러]insertOrdProdHis() 메소드의 SQL 오류" + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//선택된 회원번호의 구매 리스트 출력
	public List<OrdProdHisDTO> selectOrdList(String frst) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrdProdHisDTO> ordList=new ArrayList<OrdProdHisDTO>();
		
		try {
			con=getConnection();
			
			String sql="select ord_no,prod_cd,ord_qty from ord_prod_his where frst_rgsr_usrno=? order by his_seqno";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,frst);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				OrdProdHisDTO ord=new OrdProdHisDTO();
				ord.setOrdNo(rs.getString("ord_no"));
				ord.setProdCd(rs.getString("prod_cd"));
				ord.setOrdQty(rs.getInt("ord_qty"));
				ordList.add(ord);
			}
			
		} catch (SQLException e) {
			System.out.println("[에러]selectOrdList 메소드의 sql 오류=" +e.getMessage());
		}finally {
			close(con,pstmt,rs);
		}
		return ordList;
	}
	
	
}