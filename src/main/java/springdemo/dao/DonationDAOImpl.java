package springdemo.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import springdemo.entity.Donation;
import springdemo.entity.User;

@Repository
public class DonationDAOImpl implements DonationDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<Donation> getDonations() {
		// TODO Auto-generated method stub
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// Create a query
		Query<Donation> theQuery = currentSession.createQuery("from Donation where is_show = 1", Donation.class);

		// Execute query and get result list
		List<Donation> donations = theQuery.getResultList();

		// Return the results
		return donations;
	}

	@Override
	@Transactional
	public List<Donation> getDonations(int page) {
		// TODO Auto-generated method stub
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		if (page < 1) page = 1;

		// Create a query
		Query<Donation> theQuery = currentSession.createQuery("from Donation where is_show=:isShow ", Donation.class);
		theQuery.setParameter("isShow", 1);
		theQuery.setFirstResult((page - 1) * 5);
		theQuery.setMaxResults(5);

		// Execute query and get result list
		List<Donation> donations = theQuery.getResultList();

		// Return the results
		return donations;
	}

	@Override
	@Transactional
	public void saveDonation(Donation theDonation) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();

		theDonation.setIs_show(1);
		try {
			currentSession.saveOrUpdate(theDonation);
			System.out.println("Them dot quyen gop thanh cong!");
		} catch (Exception e) {
			System.out.println("Them dot quyen gop that bai!");
		}
	}

	@Override
	@Transactional
	public Donation getDonation(int theId) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();

		Donation theDonation = currentSession.get(Donation.class, theId);

		return theDonation;
	}

	@Override
	@Transactional
	public void deleteDonation(int theId) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();

		Query theQuery = currentSession.createQuery("UPDATE Donation" + " SET is_show = 0" + " where id=:donationId");

		theQuery.setParameter("donationId", theId);

		theQuery.executeUpdate();
	}

}
