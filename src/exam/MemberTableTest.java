package exam;

public class MemberTableTest {

	public static void main(String[] args) throws Exception {
		// insert
/*		if (MemberTable.Insert("ddd", "성춘향", "1234", "010-1234-0987", "ddd@gmail.com")) {
			System.out.println("insert ok");
		} else {
			System.out.println("insert error");
		}
*/
		// update
		if (MemberTable.Update("ddd", "이몽룡", "1111", "010-6543-0987", "eee@nate.com")) {
			System.out.println("update ok");
		} else {
			System.out.println("update error");
		}

		// update
		if (MemberTable.Delete("ddd")) {
			System.out.println("delete ok");
		} else {
			System.out.println("delete error");
		}

	}

}
