package springdemo.dao;

import java.util.List;

import springdemo.entity.UserDonation;

public interface UserDonationDAO {

	public List<UserDonation> getUserDonations();
	
	public List<UserDonation> getUserDonations(int id);
	
	public List<UserDonation> getUserDonations(int id, int status);

	public void saveUserDonation(UserDonation theUserDonation);

	public UserDonation getUserDonation(int theId);

	public void deleteUserDonation(int theId);

}
