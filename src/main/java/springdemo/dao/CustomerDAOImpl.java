package springdemo.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import springdemo.entity.Customer;



@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Customer> getCustomers() {

		// get the current hibernate session
		Session currentSession =  sessionFactory.getCurrentSession();
		
		// Create a query
		Query<Customer> theQuery =  currentSession.createQuery("from Customer", Customer.class);
		
		// Execute query and get result list
		List<Customer> customers = theQuery.getResultList();
				
		// Return the results
		return customers;
	}

	@Override
	@Transactional
	public void saveCustomer(Customer theCustomer) {
		// TODO Auto-generated method stub
		Session currentSession =  sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(theCustomer);
	}

	@Override
	@Transactional
	public Customer getCustomer(int theId) {
		// TODO Auto-generated method stub
		Session currentSession =  sessionFactory.getCurrentSession();
		
		Customer theCustomer = currentSession.get(Customer.class, theId);
		
		return theCustomer;
	}

	@Override
	@Transactional
	public void deleteCustomer(int theId) {
		// TODO Auto-generated method stub
		Session currentSession =  sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("delete from Customer where id=:customerId");
		
		theQuery.setParameter("customerId", theId);
		
		theQuery.executeUpdate();
		
	}
}
