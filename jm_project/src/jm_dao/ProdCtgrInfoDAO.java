package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jm_dto.ProdCtgrInfoDTO;

public class ProdCtgrInfoDAO extends JdbcDAO {
	private static ProdCtgrInfoDAO _dao;
	
	public ProdCtgrInfoDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new ProdCtgrInfoDAO();
	}
	
	public static ProdCtgrInfoDAO getDAO() {
		return _dao;
	}
	
	//카테고리 추가
	public int insertCtgr(ProdCtgrInfoDTO ctgr) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into prod_ctgr_info(ctgr_cd, ctgr_nm,frst_rgsr_usrno,last_procr_usrno) values ((select(nvl(max(to_number(ctgr_cd)),0)+1)from prod_ctgr_info),?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, ctgr.getCtgrNm());
			pstmt.setString(2, ctgr.getFrstRgsrUsrno());
			pstmt.setString(3, ctgr.getLastProcrUsrno());

			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertProd()메소드의 sql 오류=" +e.getMessage());
		}finally {
			close(con,pstmt);
		}
		return rows;
	}
	
	//카테고리 선택
	public ProdCtgrInfoDTO selectCtgr(String ctgr) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProdCtgrInfoDTO ctgrProd=null;
		try {
			con=getConnection();
			
			String sql="select (ctgr_nm,frst_rgsr_usrno,last_procr_usrno) from prod_ctgr_info where ctgr_cd=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,ctgr);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				ctgrProd.setCtgrCd(rs.getString("ctgr_cd"));
				ctgrProd.setCtgrNm(rs.getString("ctgr_nm"));
				ctgrProd.setDelYn(rs.getString("del_yn"));
				ctgrProd.setFrstRgsrUsrno(rs.getString("frst_rgsr_usrno"));
				ctgrProd.setLastProcrUsrno(rs.getString("last_procr_usrno"));
			}
			
		} catch (SQLException e) {
			System.out.println("[에러]selectCtgr 메소드의 sql 오류=" +e.getMessage());
		}finally {
			close(con,pstmt,rs);
		}
		return ctgrProd;
	}
	
}

