package test;

import java.util.List;

import kr.co.bit.dao.FriendDAO;
import kr.co.bit.dao.FriendDAOImpl;
import kr.co.bit.vo.FriendDTO;

public class FriendDAOTest {

	public static void main(String[] args) {
		
		FriendDAO dao = new FriendDAOImpl();
		
		// add
		//FriendDTO dto = dao.addFriend("성춘향", "010-2837-5678");
		//System.out.println(dto);
		
		// delete
		//dao.deleteFriend(1);
		
		// list
		List<FriendDTO> list = dao.getList();
		System.out.println(list);
		
	}

}
