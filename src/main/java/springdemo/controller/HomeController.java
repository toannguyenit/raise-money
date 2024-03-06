package springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import springdemo.entity.Donation;
import springdemo.entity.UserDonation;
import springdemo.service.UserService;

@Controller
public class HomeController {

	@Autowired
	private UserService userService;

	@RequestMapping("/")
	public String showPage(Model theModel) {

		// Get donations from the DAO
		List<Donation> theDonations = userService.getDonations(1);

		// Add the users to the model
		theModel.addAttribute("donations", theDonations);

		return "index";
	}
	
	@RequestMapping("/{page}")
	public String showPage2(@PathVariable("page") int page,Model theModel) {
		

		// Get donations from the DAO
		List<Donation> theDonations = userService.getDonations(page);

		// Add the users to the model
		theModel.addAttribute("donations", theDonations);
		theModel.addAttribute("page", page);

		return "index";
	}
	
	
	

}
