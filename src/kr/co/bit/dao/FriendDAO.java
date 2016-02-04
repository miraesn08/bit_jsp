package kr.co.bit.dao;

import java.util.List;

import kr.co.bit.vo.FriendDTO;

// interface는 protocol, 객체의 사용방법, 구현할 기능 명세
public interface FriendDAO {
	public List<FriendDTO> getList();
	public FriendDTO addFriend(String name, String tel);
	public int deleteFriend(int id);
}
