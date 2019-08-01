package entity;

public class User {
	private int id;
	private String username;
	private String password;
	private String realName;
	private String sex;
	private String telephone;
	private String address;
	private String email;
	private User(int id, String username, String password, String realName,
			String sex, String telephone, String address, String email) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.realName = realName;
		this.sex = sex;
		this.telephone = telephone;
		this.address = address;
		this.email = email;
	}
	public User() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", realName=" + realName + ", sex=" + sex
				+ ", telephone=" + telephone + ", address=" + address
				+ ", email=" + email + "]";
	}
}