package kr.co.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.bit.common.DBUtil;
import kr.co.bit.vo.MemberVO;

//VO  : Value Object
//DTO : Data Transfer Object
//DAO : Data Access Object

// ** OOP 설계 : "Beauty and Beast" animation에서 야수성을 방문하는 장면을 참고
public class MemberDAO {
	
	public MemberVO getMember(String id) {
		MemberVO member = null;
		List<MemberVO> memberList = getMemberListByField("id", id, true);
		
		if (memberList != null) {
			if (memberList.size() == 1) {
				member = memberList.get(0);
			}
		}
		
		return member;
	}

	// 복수의 자료는 List와 같은 자료 구조를 활요하고  generic(제네릭) 사용
	public List<MemberVO> getMemberList() {
		return getMemberListByField("", "");
	}
	
	public List<MemberVO> getMemberListByField(String fieldName, String searchValue) {
		return getMemberListByField(fieldName, searchValue, false);
	}

	public List<MemberVO> getMemberListByField(String fieldName, String searchValue, boolean isExact) {
		List<MemberVO> memberList = new ArrayList<MemberVO>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from member";
			if (fieldName.length() > 0 ) {
				if (isExact) {
					sql += " where " + fieldName + " = ?";
				} else {
					sql += " where " + fieldName + " like '%" + searchValue + "%'";
				}
			}
			ps = conn.prepareStatement(sql);
			if (isExact) {
				ps.setString(1, searchValue);
			}
			
			rs = ps.executeQuery();
			while (rs.next()) {
				MemberVO member = new MemberVO();
				
				member.setId(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setName(rs.getString(3));
				member.setPhone(rs.getString(4));
				member.setEmail(rs.getString(5));
				member.setRegDate(rs.getString(6));
				
				memberList.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps, rs);
		}
		
		return memberList;
	}

	public List<MemberVO> getMemberListByName(String searchName) {
		return getMemberListByField("name", searchName);
	}

	public boolean setMember(MemberVO member) {
		boolean returnValue = false;

		// 1. 선언(필요한 객체...)
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			// 3. 드라이버 로딩, 4. 접속
			conn = DBUtil.getConnection();
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
			// exception 처리를 blank로 두면 절대 안됨
			e.printStackTrace();
		} finally {
			// 2.선언한 객체 닫기
			DBUtil.close(conn, ps);
		}
		
		return returnValue;
	}
	
	public boolean deleteMember(String id) {
		boolean returnValue = false;
		
		Connection conn = null;
		PreparedStatement ps = null;

		try {
			conn = DBUtil.getConnection(); 
			String sql = "delete from member where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			returnValue = (ps.executeUpdate() > 0);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps);
		}
		
		return returnValue;
	}

	public boolean updateMember(MemberVO member) {
		boolean returnValue = false;

		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = DBUtil.getConnection();
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
			DBUtil.close(conn, ps);
		}
		
		return returnValue;
	}
	
}
