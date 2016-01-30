package kr.co.bit.vo;

public class MemberVO {
	
	private String id;
	private String name;
	private String password;
	private String phone;
	private String email;
	private String regDate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		if (phone != null)
			return phone;
		else 
			return "";
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		if (email != null)
			return email;
		else 
			return "";
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegDate() {
		if (regDate != null)
			return regDate;
		else 
			return "";
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		// post-it과 같은 역할
		// debug를 쉽게 
		return "MemberVO [id=" + id + ", name=" + name + ", password=" + password + ", phone=" + phone + ", email="
				+ email + ", regDate=" + regDate + "]";
	}

}
