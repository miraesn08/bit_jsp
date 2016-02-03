package test;

import com.google.gson.Gson;

public class JsonTest {

	public static void main(String[] args) {
		Member m = new Member("홍길동",50);
		System.out.println(m);

		// object --> json
		Gson gson = new Gson();
		String json = gson.toJson(m);
		System.out.println(json);
	}

}

class Member {
	private String name;
	private int age;
	
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