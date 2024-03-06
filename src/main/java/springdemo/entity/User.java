package springdemo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "username")
	private String username;

	@Column(name = "password")
	private String password;

	@Column(name = "full_name")
	private String full_name;

	@Column(name = "address")
	private String address;

	@Column(name = "phone_number")
	private String phone_number;

	@Column(name = "email")
	private String email;

	@Column(name = "status")
	private Integer status;

	@Column(name = "note")
	private String note;

	@Column(name = "created")
	private String created;

	@Column(name = "role_id")
	private Integer role_id;

	@Column(name = "is_show")
	private Integer is_show;

	public User() {
	}

	public User(int id, String username, String password, String full_name, String address, String phone_number,
			String email, Integer status, String note, String created, Integer role_id, Integer is_show) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.full_name = full_name;
		this.address = address;
		this.phone_number = phone_number;
		this.email = email;
		this.status = status;
		this.note = note;
		this.created = created;
		this.role_id = role_id;
		this.is_show = is_show;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
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

	public String getFull_name() {
		return full_name;
	}

	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public Integer getRole_id() {
		return role_id;
	}

	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}

	public Integer getShow() {
		return is_show;
	}

	public void setShow(Integer show) {
		this.is_show = show;
	}
	
	public Integer getIs_show() {
		return is_show;
	}

	public void setIs_show(Integer is_show) {
		this.is_show = is_show;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", full_name=" + full_name
				+ ", address=" + address + ", phone_number=" + phone_number + ", email=" + email + ", status=" + status
				+ ", note=" + note + ", created=" + created + ", role_id=" + role_id + ", show=" + is_show + "]";
	}

}
