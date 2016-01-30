package kr.co.bit.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kr.co.bit.vo.MemberVO;

//VO  : Value Object
//DTO : Data Transfer Object
//DAO : Data Access Object 
public class MemberDAO {
	
	public boolean setMember(MemberVO member) {
		boolean returnValue = false;

		// 1. 선언(필요한 객체...)
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			// 3. 드라이버 로딩
			Class.forName(DbUtil.DRIVER_NAME);
			// 4. 접속
			conn = DriverManager.getConnection(DbUtil.URL, DbUtil.USER, DbUtil.PASSWORD);
			// 5. 쿼리
			String sql = "insert into member values (?,?,?,?,?,sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getPassword());
			ps.setString(3, member.getName());
			ps.setString(4, member.getPhone());
			ps.setString(5, member.getEmail());
			// 6.쿼리 실행
			returnValue = (ps.executeUpdate() == 1);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			// 2.선언한 객체 닫기
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}
		}
		
		return returnValue;
	}
	
	public boolean deleteMember(String id) {
		boolean returnValue = false;

		Connection conn = DbUtil.getConnect();
		if (conn != null) {
			PreparedStatement ps = null;
			
			try {
				String sql = "delete from member where id = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				returnValue = (ps.executeUpdate() > 0);
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				// 2.선언한 객체 닫기
				if (ps != null) {
					try {
						ps.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}				
				}
			}
		}
		
		return returnValue;
	}

	public boolean updateMember(MemberVO member) {
		boolean returnValue = false;

		// 1. 선언(필요한 객체...)
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			// 3. 드라이버 로딩
			Class.forName(DbUtil.DRIVER_NAME);
			// 4. 접속
			conn = DriverManager.getConnection(DbUtil.URL, DbUtil.USER, DbUtil.PASSWORD);
			// 5. 쿼리
			String sql = "update member set password=?,name=?,phone=?,email=? where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getPassword());
			ps.setString(2, member.getName());
			ps.setString(3, member.getPhone());
			ps.setString(4, member.getEmail());
			ps.setString(5, member.getId());
			// 6.쿼리 실행
			returnValue = (ps.executeUpdate() > 0);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			// 2.선언한 객체 닫기
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}
		}
		
		return returnValue;
	}
	
}
