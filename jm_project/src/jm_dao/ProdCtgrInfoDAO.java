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
			
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertProd()메소드의 sql 오류");
		}finally {
			close(con,pstmt);
		}
		return rows;
		
	}
}
