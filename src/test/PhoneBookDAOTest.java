package test;

import java.util.List;

import kr.co.bit.dao.PhoneBookDAO;
import kr.co.bit.vo.PhoneBookVO;

public class PhoneBookDAOTest {

	public static void main(String[] args) {
		PhoneBookVO vo = new PhoneBookVO();
		PhoneBookDAO dao = new PhoneBookDAO();
		
		// insert
		vo.setName("삼월이");
		vo.setPhone("010-3852-1234");
		
		if (dao.setPhoneBook(vo)) {
			System.out.println(vo);
			System.out.println("insert ok");
		} else {
			System.out.println("insert fail");
		}

		// get
		/*System.out.println("> get PhoneBook ------------------------------");
		System.out.println(dao.getPhoneBook(1));
		System.out.println(dao.getPhoneBook(2));
		System.out.println(dao.getPhoneBook(3));*/

		// update
		/*vo.setId(3);
		vo.setName("이몽룡");
		vo.setPhone("010-7436-2835");

		if (dao.updatePhoneBook(vo)) {
			System.out.println("update ok");
		} else {
			System.out.println("update fail");
		}*/
		
 		// delete
		/*if (dao.deletePhoneBook(4)) {
			System.out.println("delete ok");
		} else {
			System.out.println("delete fail");
		}*/
	
		// list
		List<PhoneBookVO> list;
		System.out.println("> list all ------------------------------");
		list = dao.getPhoneBookList();
		for (PhoneBookVO item : list) {
			System.out.println(item);
		}
		/*System.out.println("> list by name ------------------------------");
		PhoneBookList = dao.getPhoneBookListByName("경");
		for (PhoneBookVO vo : PhoneBookList) {
			System.out.println(vo);
		}*/
	}

}
