package springdemo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springdemo.dao.CustomerDAO;
import springdemo.dao.DonationDao;
import springdemo.dao.RoleDao;
import springdemo.dao.UserDAO;
import springdemo.dao.UserDonationDAO;
import springdemo.entity.Customer;
import springdemo.entity.Donation;
import springdemo.entity.Role;
import springdemo.entity.User;
import springdemo.entity.UserDonation;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	public UserDAO userDAO;

	@Autowired
	public RoleDao roleDAO;

	@Autowired
	public DonationDao donationDAO;

	@Autowired
	public UserDonationDAO userDonationDAO;

	@Override
	@Transactional
	public List<User> getUsers() {
		// TODO Auto-generated method stub
		return userDAO.getUsers();
	}

	@Override
	@Transactional
	public void saveUser(User theUser) {
		// TODO Auto-generated method stub
		userDAO.saveUser(theUser);
	}

	@Override
	@Transactional
	public User getUser(int theId) {
		// TODO Auto-generated method stub
		return userDAO.getUser(theId);
	}

	@Override
	@Transactional
	public void deleteUser(int theId) {
		// TODO Auto-generated method stub
		userDAO.deleteUser(theId);
	}

	@Override
	@Transactional
	public List<UserDonation> getUserDonations() {
		// TODO Auto-generated method stub
		return userDonationDAO.getUserDonations();
	}

	@Override
	@Transactional
	public void saveUserDonation(UserDonation theUserDonation) {
		// TODO Auto-generated method stub
		userDonationDAO.saveUserDonation(theUserDonation);
	}

	@Override
	@Transactional
	public UserDonation getUserDonation(int theId) {
		// TODO Auto-generated method stub
		return userDonationDAO.getUserDonation(theId);
	}

	@Override
	@Transactional
	public void deleteUserDonation(int theId) {
		// TODO Auto-generated method stub
		userDonationDAO.deleteUserDonation(theId);
	}

	@Override
	@Transactional
	public List<Donation> getDonations() {
		// TODO Auto-generated method stub
		return donationDAO.getDonations();
	}
	
	@Override
	@Transactional
	public List<Donation> getDonations(int page) {
		// TODO Auto-generated method stub
		return donationDAO.getDonations(page);
	}
	

	@Override
	@Transactional
	public void saveDonation(Donation theDonation) {
		// TODO Auto-generated method stub
		donationDAO.saveDonation(theDonation);
	}

	@Override
	@Transactional
	public Donation getDonation(int theId) {
		// TODO Auto-generated method stub
		return donationDAO.getDonation(theId);
	}

	@Override
	@Transactional
	public void deleteDonation(int theId) {
		// TODO Auto-generated method stub
		donationDAO.deleteDonation(theId);
	}

	@Override
	@Transactional
	public List<Role> getRoles() {
		// TODO Auto-generated method stub

		return roleDAO.getRoles();
	}

	@Override
	@Transactional
	public void saveRole(Role theRole) {
		// TODO Auto-generated method stub
		roleDAO.saveRole(theRole);
	}

	@Override
	@Transactional
	public Role getRole(int theId) {
		// TODO Auto-generated method stub
		return roleDAO.getRole(theId);
	}

	@Override
	@Transactional
	public void deleteRole(int theId) {
		// TODO Auto-generated method stub
		roleDAO.deleteRole(theId);
	}
	
	@Override
	@Transactional
	public List<UserDonation> getUserDonations(int id ) {
		// TODO Auto-generated method stub
		return userDonationDAO.getUserDonations(id );
	}

	@Override
	@Transactional
	public List<UserDonation> getUserDonations(int id, int status ) {
		// TODO Auto-generated method stub
		return userDonationDAO.getUserDonations(id, status );
	}

}
