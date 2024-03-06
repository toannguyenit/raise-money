package springdemo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "donation")
public class Donation {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "code")
	private String code;

	@Column(name = "description")
	private String description;

	@Column(name = "end_date")
	private String end_date;

	@Column(name = "money")
	private Integer money;

	@Column(name = "name")
	private String name;

	@Column(name = "organization_name")
	private String organization_name;

	@Column(name = "phone_number")
	private String phone_number;

	@Column(name = "start_date")
	private String start_date;

	@Column(name = "status")
	private Integer status;

	@Column(name = "is_show")
	private Integer is_show;

	public Donation() {
	}

	public Donation(int id, String code, String description, String end_date, Integer money, String name,
			String organization_name, String phone_number, String start_date, Integer status, Integer is_show) {
		this.id = id;
		this.code = code;
		this.description = description;
		this.end_date = end_date;
		this.money = money;
		this.name = name;
		this.organization_name = organization_name;
		this.phone_number = phone_number;
		this.start_date = start_date;
		this.status = status;
		this.is_show = is_show;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOrganization_name() {
		return organization_name;
	}

	public void setOrganization_name(String organization_name) {
		this.organization_name = organization_name;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getIs_show() {
		return is_show;
	}

	public void setIs_show(Integer is_show) {
		this.is_show = is_show;
	}

	@Override
	public String toString() {
		return "Donation [id=" + id + ", code=" + code + ", description=" + description + ", end_date=" + end_date
				+ ", money=" + money + ", name=" + name + ", organization_name=" + organization_name + ", phone_number="
				+ phone_number + ", start_date=" + start_date + ", status=" + status + ", is_show=" + is_show + "]";
	}

}
