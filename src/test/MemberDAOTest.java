package test;

import kr.co.bit.dao.MemberDAO;
import kr.co.bit.vo.MemberVO;

public class MemberDAOTest {

	public static void main(String[] args) {
		MemberVO member = new MemberVO();
		MemberDAO dao = new MemberDAO();
/*		
		// insert
		member.setId("test11");
		member.setPassword("444");
		member.setName("테스트");
		member.setPhone("010-111-3333");
		member.setEmail("test11@test.com");

		if (dao.setMember(member)) {
			System.out.println("insert ok");
		} else {
			System.out.println("insert fail");
		}

		// update
		member.setId("test11");
		member.setPassword("555");
		member.setName("수정 테스트");
		member.setPhone("010-0000-0000");
		member.setEmail("new@new.com");

		if (dao.updateMember(member)) {
			System.out.println("update ok");
		} else {
			System.out.println("update fail");
		}
		
		// delete
		if (dao.deleteMember("test11")) {
			System.out.println("delete ok");
		} else {
			System.out.println("delete fail");
		}
*/
		
		System.out.println(dao.getMember("test"));

	}

}
