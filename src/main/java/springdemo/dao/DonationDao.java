package springdemo.dao;

import java.util.List;

import springdemo.entity.Donation;

public interface DonationDao {

	public List<Donation> getDonations();
	
	public List<Donation> getDonations(int page);

	public void saveDonation(Donation theDonation);

	public Donation getDonation(int theId);

	public void deleteDonation(int theId);

}
