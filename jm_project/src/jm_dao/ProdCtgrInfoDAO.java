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
	public int insertProd(ProdCtgrInfoDTO prod) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into product values(?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, prod.getCtgrCd());
			pstmt.setString(2, prod.getCtgrNm());
			pstmt.setString(3, prod.getUzYn());
			pstmt.setString(4, prod.getDelYn());
			pstmt.setString(5, prod.getFrstRgsrUsrno());
			pstmt.setString(6, prod.getFrstRgstDttm());
			pstmt.setString(7, prod.getLastProcrUsrno());
			pstmt.setString(8, prod.getLastProcDttm());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]insertProd()�޼ҵ��� sql ����");
		}finally {
			close(con,pstmt);
		}
		return rows;
	}
}
