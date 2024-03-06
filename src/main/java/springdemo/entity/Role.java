package springdemo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="role")
public class Role {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="role_name")
	private String role_name;
	
	public Role()
	{}

	public Role(int id, String role_name) {
		this.id = id;
		this.role_name = role_name;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	@Override
	public String toString() {
		return "Role [id=" + id + ", role_name=" + role_name + "]";
	}
	
}
