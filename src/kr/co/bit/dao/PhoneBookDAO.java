package kr.co.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.bit.common.DBUtil;
import kr.co.bit.vo.PhoneBookVO;


public class PhoneBookDAO {

	public PhoneBookVO getPhoneBook(int id) {
		PhoneBookVO phoneBook = null;
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from phonebook where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			rs = ps.executeQuery();
			if (rs.next()) {
				phoneBook = new PhoneBookVO();
				
				phoneBook.setId(rs.getInt(1));
				phoneBook.setName(rs.getString(2));
				phoneBook.setPhone(rs.getString(3));
				phoneBook.setRegDate(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps, rs);
		}
		
		return phoneBook;
	}

	public List<PhoneBookVO> getPhoneBookList() {
		return getPhoneBookListByField("", "");
	}
	
	public List<PhoneBookVO> getPhoneBookListByField(String fieldName, String searchValue) {
		return getPhoneBookListByField(fieldName, searchValue, false);
	}

	public List<PhoneBookVO> getPhoneBookListByField(String fieldName, String searchValue, boolean isExact) {
		List<PhoneBookVO> phoneBookList = new ArrayList<PhoneBookVO>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from phonebook";
			if (fieldName.length() > 0 ) {
				if (isExact) {
					sql += " where " + fieldName + " = ?";
				} else {
					sql += " where " + fieldName + " like '%" + searchValue + "%'";
				}
			}
			sql += " order by id";
			ps = conn.prepareStatement(sql);
			if (isExact) {
				ps.setString(1, searchValue);
			}
			
			rs = ps.executeQuery();
			while (rs.next()) {
				PhoneBookVO phoneBook = new PhoneBookVO();
				
				phoneBook.setId(rs.getInt(1));
				phoneBook.setName(rs.getString(2));
				phoneBook.setPhone(rs.getString(3));
				phoneBook.setRegDate(rs.getString(4));
				
				phoneBookList.add(phoneBook);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps, rs);
		}
		
		return phoneBookList;
	}

	public List<PhoneBookVO> getPhoneBookListByName(String searchName) {
		return getPhoneBookListByField("name", searchName);
	}

	public boolean setPhoneBook(PhoneBookVO phoneBook) {
		boolean returnValue = false;

		Connection conn = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection(true);
			
			String sql = "insert into phoneBook values (phonebook_seq.nextval,?,?,sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, phoneBook.getName());
			ps.setString(2, phoneBook.getPhone());
			
			returnValue = (ps.executeUpdate() == 1);
			
			sql = "select phonebook_seq.CURRVAL from dual";
			ps2 = conn.prepareStatement(sql);
			rs = ps2.executeQuery();
			rs.next(); // 무조건 한건 읽어온다.
			int id = rs.getInt(1);
			phoneBook.setId(id);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps);
		}
		
		return returnValue;
	}
	
	public boolean deletePhoneBook(int id) {
		boolean returnValue = false;
		
		Connection conn = null;
		PreparedStatement ps = null;

		try {
			conn = DBUtil.getConnection(); 
			String sql = "delete from phonebook where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			returnValue = (ps.executeUpdate() > 0);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps);
		}
		
		return returnValue;
	}

	public boolean updatePhoneBook(PhoneBookVO phoneBook) {
		boolean returnValue = false;

		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = DBUtil.getConnection();
			String sql = "update phoneBook set name=?,phone=? where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, phoneBook.getName());
			ps.setString(2, phoneBook.getPhone());
			ps.setInt(3, phoneBook.getId());
			returnValue = (ps.executeUpdate() > 0);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps);
		}
		
		return returnValue;
	}

}
