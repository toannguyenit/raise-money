package springdemo.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import springdemo.entity.Role;

@Repository
public class RoleDAOImpl implements RoleDao{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<Role> getRoles() {
		// TODO Auto-generated method stub
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// Create a query
		Query<Role> theQuery = currentSession.createQuery("from Role", Role.class);

		// Execute query and get result list
		List<Role> Roles = theQuery.getResultList();

		// Return the results
		return Roles;
	}

	@Override
	@Transactional
	public void saveRole(Role theRole) {
		// TODO Auto-generated method stub

		Session currentSession = sessionFactory.getCurrentSession();

		currentSession.saveOrUpdate(theRole);

	}

	@Override
	@Transactional
	public Role getRole(int theId) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();

		Role theRole = currentSession.get(Role.class, theId);

		return theRole;
	}

	@Override
	@Transactional
	public void deleteRole(int theId) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();

		Query theQuery = currentSession.createQuery("delete from Role where id=:roleId");

		theQuery.setParameter("roleId", theId);

		theQuery.executeUpdate();

	}

}
