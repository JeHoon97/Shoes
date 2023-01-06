package ez.web.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ShoesAdDAO {
	
	public static final int ADMIN_LOGIN_SUCCESS = 1;
	public static final int ADMIN_LOGIN_PW_FAIL = 0;
	public static final int ADMIN_LOGIN_NOT = -1;
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	DataSource ds = null;
	
	private static ShoesAdDAO instance;
	
	private ShoesAdDAO() {}
	
	public static ShoesAdDAO getInstance() {
		if(instance == null) {
			instance = new ShoesAdDAO();
		}
		
		return instance;
	}
	
	public Connection getConnection() {
		Context ctx = null;
		DataSource ds = null;
		Connection conn = null;
		
		try {
			ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc_oracle11g");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public void dbClose() {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
	}
	
	// 관리자 로그인 체크
		public int adminCheck(String id, String pw) {
			int n = 0;
			String dbPw;
			
			String sql = "SELECT password FROM shoes_admin WHERE id = ?";
			conn = getConnection();
			
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					dbPw = rs.getString("password");
					if(dbPw.equals(pw)) { // 로그인 성공(비번 일치)
						n=ShoesAdDAO.ADMIN_LOGIN_SUCCESS;
					}else { // 비번 불일치
						n = ShoesAdDAO.ADMIN_LOGIN_PW_FAIL;
					}
				}else {
					n = ShoesAdDAO.ADMIN_LOGIN_NOT;
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				dbClose();
			}
			
			
			return n;
		}
		
		// 관리자 정보 가져오기
		public ShoesAdDTO getAdminInfo(String id) {
			ShoesAdDTO dto = null;
			String sql = "SELECT * FROM shoes_admin WHERE id = ?";
			
			conn = getConnection();
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					dto = new ShoesAdDTO();
					dto.setId(rs.getString("id"));
					dto.setPassword(rs.getString("password"));
					dto.setName(rs.getString("name"));
					dto.setEmail(rs.getString("email"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				dbClose();
			}
			
			return dto;
		}
	
	

}
