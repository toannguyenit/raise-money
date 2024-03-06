package springdemo.service;

import java.util.List;

import springdemo.entity.Customer;
import springdemo.entity.Donation;
import springdemo.entity.Role;
import springdemo.entity.User;
import springdemo.entity.UserDonation;

public interface UserService {
	
	public List<User> getUsers();

	public void saveUser(User theUser);

	public User getUser(int theId);

	public void deleteUser(int theId);
	
	public List<UserDonation> getUserDonations();
	
	public List<UserDonation> getUserDonations(int id);
	
	public List<UserDonation> getUserDonations(int id, int status);

	public void saveUserDonation(UserDonation theUserDonation);

	public UserDonation getUserDonation(int theId);

	public void deleteUserDonation(int theId);
	
	public List<Donation> getDonations();
	
	public List<Donation> getDonations(int page);

	public void saveDonation(Donation theDonation);

	public Donation getDonation(int theId);

	public void deleteDonation(int theId);
	
	public List<Role> getRoles();

	public void saveRole(Role theRole);

	public Role getRole(int theId);

	public void deleteRole(int theId);

	


}
