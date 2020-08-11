package jm_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jm_dto.CommonCodeDTO;

public class CommonCodeDAO extends JdbcDAO {
	private static CommonCodeDAO _dao;
	
	public CommonCodeDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new CommonCodeDAO();
	}
	
	public static CommonCodeDAO getDAO() {
		return _dao;
	}
	
	public CommonCodeDTO selectCommon(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		CommonCodeDTO common=null;
		try {
			con=getConnection();
			
			String sql="select * from common_code where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				common=	new CommonCodeDTO();
				common.setCodeId(rs.getString("code_no"));
				common.setGrpCdid(rs.getString("grp_cdid"));
				common.setCodeNm(rs.getString("code_nm"));
				common.setGrpCdnm(rs.getString("grp_cdnm"));
				common.setUzYn(rs.getString("uz_yn"));
				common.setFrstRgsrUsrno(rs.getString("frst_rgsr_usrno"));
				common.setFrstRgstDttm(rs.getString("frst_rgst_dttm"));
				common.setLastProcrUsrno(rs.getString("last_procr_usrno"));
				common.setLastProcDttm(rs.getString("last_proc_dttm"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectCommon() 메소드의 SQL 오류 = "+e.getMessage());
		}finally {
			close(con,pstmt,rs);
		}
		return common;
	}
	
	public int updateCommon(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update common_code set last_proc_dttm=sysdate where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateCommon() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con,pstmt);
		}
		return rows;
	}
}
