package springdemo.dao;

import java.util.List;

import springdemo.entity.Role;

public interface RoleDao {

	public List<Role> getRoles();

	public void saveRole(Role theRole);

	public Role getRole(int theId);

	public void deleteRole(int theId);

}
