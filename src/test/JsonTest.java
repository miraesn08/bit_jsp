package test;

import com.google.gson.Gson;

//http://1004lucifer.blogspot.kr/2015/04/javagson-gson-java-json.html 
//를 참고하여 작성하였음.
public class JsonTest {

	public static void main(String[] args) {
		Member m1 = new Member("홍길동",50);
		System.out.println(m1);
		System.out.println("-------------------------");

		// m1 참조변수가 가리키는 인스턴스를 json 문자열로 만든다. GSon 라이브러리를 이용한다.
		String member2Json = new Gson().toJson(m1);
		System.out.println(member2Json);
		
		// 
		Member m2 = new Gson().fromJson(member2Json, Member.class);
		System.out.println(m2.getName());
		System.out.println(m2.getAge());
		
		if(m1 == m2){
			System.out.println("m1과 m2는 같은 레퍼런스이다.");
		}else{
			System.out.println("m1과 m2는 같은 레퍼런스가 아니다.");
		}		
	}

}

class Member {
	private String name;
	private int age;
	
	// 기본생성자 - Java Bean은 기본생성자가 있어야 한다.
	public Member () { }
	// 2개의 값을 받아들여 필드 2개를 초기화 한다.
	public Member(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "Member [name=" + name + ", age=" + age + "]";
	}
	
}