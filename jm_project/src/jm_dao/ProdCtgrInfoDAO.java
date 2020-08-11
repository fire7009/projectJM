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
	
	//ī�װ� �߰�
	public int insertCtgr(ProdCtgrInfoDTO ctgr) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into prod_ctgr_info values(?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, ctgr.getCtgrCd());
			pstmt.setString(2, ctgr.getCtgrNm());
			pstmt.setString(3, ctgr.getUzYn());
			pstmt.setString(4, ctgr.getDelYn());
			pstmt.setString(5, ctgr.getFrstRgsrUsrno());
			pstmt.setString(6, ctgr.getFrstRgstDttm());
			pstmt.setString(7, ctgr.getLastProcrUsrno());
			pstmt.setString(8, ctgr.getLastProcDttm());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]insertProd()�޼ҵ��� sql ����=" +e.getMessage());
		}finally {
			close(con,pstmt);
		}
		return rows;
	}
	
	//ī�װ� ����
	public ProdCtgrInfoDTO selectCtgr(String ctgr) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProdCtgrInfoDTO ctgrProd=null;
		try {
			con=getConnection();
			
			String sql="select * from prod_ctgr_info where ctgr_cd=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,ctgr);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				ctgrProd.setCtgrCd(rs.getString("ctgr_cd"));
				ctgrProd.setCtgrNm(rs.getString("ctgr_nm"));
				ctgrProd.setUzYn(rs.getString("uz_yn"));
				ctgrProd.setDelYn(rs.getString("del_yn"));
				ctgrProd.setFrstRgsrUsrno(rs.getString("frst_rgsr_usrno"));
				ctgrProd.setFrstRgstDttm(rs.getString("frst_rgst_dttm"));
				ctgrProd.setLastProcrUsrno(rs.getString("last_procr_usrno"));
				ctgrProd.setLastProcDttm(rs.getString("last_proc_dttm"));
			}
			
		} catch (SQLException e) {
			System.out.println("[����]selectCtgr �޼ҵ��� sql ����=" +e.getMessage());
		}finally {
			close(con,pstmt,rs);
		}
		return ctgrProd;
	}
	
	//ī�װ� ������Ʈ
	public int updateCtgr(String ctgr) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update prod_ctgr_info set last_proc_dttm=sysdate where ctgr_cd=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, ctgr);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]updateCtgr() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
}
