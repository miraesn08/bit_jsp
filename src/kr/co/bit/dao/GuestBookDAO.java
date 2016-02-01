package kr.co.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.bit.common.DBUtil;
import kr.co.bit.vo.GuestBookVO;

public class GuestBookDAO {

	public boolean setGuestBook(GuestBookVO book) {
		boolean returnValue = false;

		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = DBUtil.getConnection();
			
			String sql = "insert into guestbook values (guestbook_seq.nextval,?,?,?,?,sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, book.getName());
			ps.setString(2, book.getId());
			ps.setString(3, book.getTitle());
			ps.setString(4, book.getContent());
			
			returnValue = (ps.executeUpdate() == 1);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps);
		}
		
		return returnValue;
	}
	
	public GuestBookVO getGuestBook(int no) {
		GuestBookVO guestBook = null;
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			
			String sql = "select * from guestbook where no = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs = ps.executeQuery();
			if (rs.next()) {
				guestBook = new GuestBookVO();
				
				fillGuestBookVOByResultSet(guestBook, rs);
				/*guestBook.setNo(rs.getInt(1));
				guestBook.setName(rs.getString(2));
				guestBook.setId(rs.getString(3));
				guestBook.setTitle(rs.getString(4));
				guestBook.setContent(rs.getString(5));
				guestBook.setRegDate(rs.getString(6));*/
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps, rs);
		}
		
		return guestBook;
	}
	
	private void fillGuestBookVOByResultSet(GuestBookVO guestBook, ResultSet rs) throws SQLException {
		guestBook.setNo(rs.getInt(1));
		guestBook.setName(rs.getString(2));
		guestBook.setId(rs.getString(3));
		guestBook.setTitle(rs.getString(4));
		guestBook.setContent(rs.getString(5));
		guestBook.setRegDate(rs.getString(6));
	}
	
	public List<GuestBookVO> getGuestBookList() {
		List<GuestBookVO> list = new ArrayList<GuestBookVO>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			
			String sql = "select * from guestbook order by no";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while (rs.next()) {
				GuestBookVO guestBook = new GuestBookVO();
				fillGuestBookVOByResultSet(guestBook, rs);
				list.add(guestBook);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps, rs);
		}
		
		return list;
	}
	
	public boolean updateGuestBook(GuestBookVO guestBook) {
		Connection conn = null;
		PreparedStatement ps = null;
		int countResult = 0;
		
		try {
			conn = DBUtil.getConnection();
			
			String sql = "update guestbook set name=?,id=?,title=?,content=? where no = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, guestBook.getName());
			ps.setString(2, guestBook.getId());
			ps.setString(3, guestBook.getTitle());
			ps.setString(4, guestBook.getContent());
			ps.setInt(5, guestBook.getNo());
			
			countResult = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps);
		}
		
		return (countResult > 0);
	}
	
	public boolean deleteGuestBook(int no) {
		int countResult = 0;
		
		if (no > 0) {
			Connection conn = null;
			PreparedStatement ps = null;
			
			try {
				conn = DBUtil.getConnection();
				
				String sql = "delete from guestbook where no = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, no);
				
				countResult = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(conn, ps);
			}
		}
		
		return (countResult > 0);
	}

}
