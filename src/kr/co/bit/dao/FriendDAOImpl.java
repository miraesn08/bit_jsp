package kr.co.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.bit.common.DBUtil;
import kr.co.bit.vo.FriendDTO;

public class FriendDAOImpl implements FriendDAO {

	@Override
	public List<FriendDTO> getList() {
		List<FriendDTO> friendList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			conn = DBUtil.getConnection();
			String sql = "select id, name, tel from myfriend order by id";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				FriendDTO dto = new FriendDTO();
				dto.setId(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setTel(rs.getString(3));
				friendList.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps,rs);
		}
		
		return friendList;
	}

	@SuppressWarnings("unused")
	@Override
	public FriendDTO addFriend(String name, String tel) {
		FriendDTO friend = new FriendDTO();
		friend.setName(name);
		friend.setTel(tel);
		int resultCount = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection(false);
			String sql = "insert into myfriend(id, name, tel) values(friend_seq.NEXTVAL, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, tel);
			resultCount = ps.executeUpdate();
			sql = "select friend_seq.CURRVAL from dual";
			ps2 = conn.prepareStatement(sql);
			rs = ps2.executeQuery();
			rs.next(); // 무조건 한건 읽어온다.
			int id = rs.getInt(1);
			friend.setId(id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				ps2.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBUtil.close(conn, ps);
		}
		return friend;
	}

	@Override
	public int deleteFriend(int id) {
		int resultCount = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		try{
			conn = DBUtil.getConnection();
			String sql = "delete from myfriend where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			resultCount = ps.executeUpdate();			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps);
		}
		return resultCount;
	}

}
