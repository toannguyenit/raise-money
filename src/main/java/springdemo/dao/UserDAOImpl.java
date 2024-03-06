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

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<User> getUsers() {
		// TODO Auto-generated method stub
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// Create a query
		Query<User> theQuery = currentSession.createQuery("from User where is_show = 1", User.class);

		// Execute query and get result list
		List<User> users = theQuery.getResultList();

		// Return the results
		return users;
	}

	@Override
	@Transactional
	public void saveUser(User theUser) {
		// TODO Auto-generated method stub

		Session currentSession = sessionFactory.getCurrentSession();

		currentSession.saveOrUpdate(theUser);

	}

	@Override
	@Transactional
	public User getUser(int theId) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();

		User theUser = currentSession.get(User.class, theId);

		return theUser;
	}

	@Override
	@Transactional
	public void deleteUser(int theId) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();

		Query theQuery = currentSession.createQuery("UPDATE User"
				+ " SET is_show = 0"
				+ " where id=:userId");
		
		theQuery.setParameter("userId", theId);

		theQuery.executeUpdate();

	}

}
