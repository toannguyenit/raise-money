package springdemo.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_donation")
public class UserDonation {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "created")
	private Date created;

	@Column(name = "money")
	private int money;

	@Column(name = "name")
	private String name;

	@Column(name = "status")
	private int status;

	@Column(name = "text")
	private String text;

	@Column(name = "donation_id")
	private Integer donation_id;

	@Column(name = "user_id")
	private Integer user_id;

	public UserDonation() {
	}

	public UserDonation(int id, Date created, int money, String name, int status, String text, Integer donation_id,
			Integer user_id) {
		this.id = id;
		this.created = created;
		this.money = money;
		this.name = name;
		this.status = status;
		this.text = text;
		this.donation_id = donation_id;
		this.user_id = user_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Integer getDonation_id() {
		return donation_id;
	}

	public void setDonation_id(Integer donation_id) {
		this.donation_id = donation_id;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "UserDonation [id=" + id + ", created=" + created + ", money=" + money + ", name=" + name + ", status="
				+ status + ", text=" + text + ", donation_id=" + donation_id + ", user_id=" + user_id + "]";
	}

}
