package springdemo.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/donation/detail/add-user-donation", method = RequestMethod.POST)
	public String addUserDonation(HttpServletRequest request) {

		int id = Integer.parseInt(request.getParameter("donationId"));
//		System.out.println("Donation có ID: " + id + " đang được cập nhật!!!");

		UserDonation theUserDonation = new UserDonation();

		Date currentDate = new Date();

//		System.out.println("Ngày hiện tại: " + currentDate);

		theUserDonation.setDonation_id(id);
		theUserDonation.setCreated(currentDate);
		theUserDonation.setName(request.getParameter("name"));
		theUserDonation.setMoney(Integer.parseInt(request.getParameter("money")));
		theUserDonation.setText(request.getParameter("text"));
		theUserDonation.setStatus(0);
		theUserDonation.setUser_id(6);


		userService.saveUserDonation(theUserDonation);
		
//		System.out.println(theUserDonation.toString());

		return "redirect:/user/donation/detail/" + id;
	}

	@RequestMapping(value = "/donation/detail/{id}", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public String showDetailPage(@PathVariable("id") int id, Model theModel) {

		Donation theDonation = userService.getDonation(id);

		List<UserDonation> theUserDonations = userService.getUserDonations(id , 1);

		// Add the Donations to the model
		theModel.addAttribute("donation", theDonation);

		// Add the UserDonations to the model
		theModel.addAttribute("userDonations", theUserDonations);

		return "/templates/detail";
	}

	@RequestMapping(value = "/donation/detail/{id}/accept", method = RequestMethod.POST, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public String acceptDonation(@PathVariable("id") int id, Model theModel, HttpServletRequest request) {

		int theIdUserDonation = Integer.parseInt(request.getParameter("userDonationId"));
		System.out.println("Donation có ID: " + theIdUserDonation + " đang được cập nhật!!!");

		UserDonation theUserDonation = userService.getUserDonation(theIdUserDonation);

		Date currentDate = new Date();

//		System.out.println("Ngày hiện tại: " + currentDate);

		theUserDonation.setStatus(2);

//		System.out.println(theUserDonation.toString());

		userService.saveUserDonation(theUserDonation);

		Donation theDonation = userService.getDonation(id);

		List<UserDonation> theUserDonations = userService.getUserDonations(id , 1);

		// Add the Donations to the model
		theModel.addAttribute("donation", theDonation);

		// Add the UserDonations to the model
		theModel.addAttribute("userDonations", theUserDonations);

		return "/templates/detail";
	}

}
