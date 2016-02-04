package kr.co.bit.vo;

public class FriendDTO {
	
	private int id;
	private String name;
	private String tel;

	public FriendDTO() {
		super();
	}

	public FriendDTO(int id, String name, String tel) {
		super();
		this.id = id;
		this.name = name;
		this.tel = tel;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FriendDTO other = (FriendDTO) obj;
		if (id != other.id)
			return false;
		return true;
	}

}
