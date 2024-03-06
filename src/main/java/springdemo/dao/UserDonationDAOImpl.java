package springdemo.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import springdemo.entity.Customer;
import springdemo.entity.User;
import springdemo.entity.UserDonation;

@Repository
public class UserDonationDAOImpl implements UserDonationDAO {

	@Autowired
	private SessionFactory sessionFactory;

	

	@Override
	@Transactional
	public List<UserDonation> getUserDonations() {
		Session currentSession = sessionFactory.getCurrentSession();

		// Create a query
		Query<UserDonation> theQuery = currentSession.createQuery("from UserDonation", UserDonation.class);


		
		// Execute query and get result list
		List<UserDonation> userDonations = theQuery.getResultList();

		// Return the results
		return userDonations;
	}
	
	@Override
	@Transactional
	public List<UserDonation> getUserDonations(int id) {
		// TODO Auto-generated method stub
		
		Session currentSession = sessionFactory.getCurrentSession();

		// Create a query
		Query<UserDonation> theQuery = currentSession.createQuery("from UserDonation where donation_id=:donationId ", UserDonation.class);

		theQuery.setParameter("donationId", id);
		
		// Execute query and get result list
		List<UserDonation> userDonations = theQuery.getResultList();

		// Return the results
		return userDonations;
	}
	
	@Override
	@Transactional
	public List<UserDonation> getUserDonations(int id, int status) {
		// TODO Auto-generated method stub
		
		Session currentSession = sessionFactory.getCurrentSession();

		// Create a query
		Query<UserDonation> theQuery = currentSession.createQuery("from UserDonation where donation_id=:donationId and status=:status", UserDonation.class);

		theQuery.setParameter("donationId", id);
		theQuery.setParameter("status", status);
		
		// Execute query and get result list
		List<UserDonation> userDonations = theQuery.getResultList();

		// Return the results
		return userDonations;
	}

	@Override
	@Transactional
	public void saveUserDonation(UserDonation theUserDonation) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();

		try {
			currentSession.saveOrUpdate(theUserDonation);
			System.out.println("Donation thanh cong!");
		} catch (Exception e) {
			System.out.println("Donation that bai!");
		}
		
		
	}

	@Override
	@Transactional
	public UserDonation getUserDonation(int theId) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();

		UserDonation theUserDonation = currentSession.get(UserDonation.class, theId);

		return theUserDonation;
	}

	@Override
	@Transactional
	public void deleteUserDonation(int theId) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();

		Query theQuery = currentSession.createQuery("UPDATE UserDonation"
				+ " SET is_show = 0"
				+ " where id=:userDonationId");
		
		theQuery.setParameter("userDonationId", theId);

		theQuery.executeUpdate();

	}

}
