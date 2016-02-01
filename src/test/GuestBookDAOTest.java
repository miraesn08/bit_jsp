package test;

import java.util.List;

import kr.co.bit.dao.GuestBookDAO;
import kr.co.bit.vo.GuestBookVO;

public class GuestBookDAOTest {

	public static void main(String[] args) {
		GuestBookVO vo = new GuestBookVO();
		GuestBookDAO dao = new GuestBookDAO();
		
		// insert
		/*vo.setName("홍길동");
		vo.setId("hong");
		vo.setTitle("처음 방문합니다.");
		vo.setContent("반갑습니다.");
		
		if (dao.setGuestBook(vo)) {
			System.out.println("insert ok");
		} else {
			System.out.println("insert fail");
		}*/

		// get
		System.out.println("> get GuestBook ------------------------------");
		System.out.println(dao.getGuestBook(1));
		System.out.println(dao.getGuestBook(2));
		System.out.println(dao.getGuestBook(4));

		// update
		/*vo.setNo(4);
		vo.setId("hyang");
		vo.setName("성춘향");
		vo.setTitle("님도 오셨네요");
		vo.setContent("방가방가");

		if (dao.updateGuestBook(vo)) {
			System.out.println("update ok");
		} else {
			System.out.println("update fail");
		}*/
		
 		// delete
		/*if (dao.deleteGuestBook(3)) {
			System.out.println("delete ok");
		} else {
			System.out.println("delete fail");
		}*/
	
		// list
		List<GuestBookVO> list;
		System.out.println("> list all ------------------------------");
		list = dao.getGuestBookList();
		for (GuestBookVO item : list) {
			System.out.println(item);
		}
		/*System.out.println("> list by name ------------------------------");
		GuestBookList = dao.getGuestBookListByName("경");
		for (GuestBookVO vo : GuestBookList) {
			System.out.println(vo);
		}*/


	}

}
