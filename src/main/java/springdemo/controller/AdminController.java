package springdemo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import springdemo.entity.Donation;
import springdemo.entity.Role;
import springdemo.entity.User;
import springdemo.entity.UserDonation;
import springdemo.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private UserService userService;



	@RequestMapping("/")
	public String homePage() {
		return "/templates/admin/index";
	}

	// ===== ACCOUNT =====
	@RequestMapping("/account")
	public String showAccountPage(Model theModel) {

		// Get users from the DAO
		List<User> theUsers = userService.getUsers();

		// Get roles from the DAO
		List<Role> theRoles = userService.getRoles();

		// Add the users to the model
		theModel.addAttribute("users", theUsers);

		// Add the roles to the model
		theModel.addAttribute("roles", theRoles);

		theModel.addAttribute("user", new User());

		return "/templates/admin/account";
	}

	@PostMapping("/account/saveUser")
	public String saveUser(@ModelAttribute("user") User theUser) {

		System.out.println(theUser.toString());
		
		theUser.setIs_show(1);
		
		theUser.setStatus(1);

		userService.saveUser(theUser);

		return "redirect:/admin/account";
	}

	@RequestMapping(value = "/account/updateUser", method = RequestMethod.POST)
	public String updateUser(HttpServletRequest request) {

		int id = Integer.parseInt(request.getParameter("userId"));

		User theUser = userService.getUser(id);

		theUser.setFull_name(request.getParameter("full_name"));
		theUser.setEmail(request.getParameter("email"));
		theUser.setPhone_number(request.getParameter("phone_number"));
		theUser.setAddress(request.getParameter("address"));
		theUser.setRole_id(Integer.parseInt(request.getParameter("role_id")));

		userService.saveUser(theUser);

		return "redirect:/admin/account";
	}

	@RequestMapping(value = "/ql-user/lock", method = RequestMethod.POST)
	public String lockUser(HttpServletRequest request) {

		int id = Integer.parseInt(request.getParameter("userId"));

		User theUser = userService.getUser(id);

		theUser.setStatus(0);

		userService.saveUser(theUser);

		return "redirect:/admin/account";
	}

	@RequestMapping(value = "/ql-user/un-lock", method = RequestMethod.POST)
	public String unlockUser(HttpServletRequest request) {

		int id = Integer.parseInt(request.getParameter("userId"));

		User theUser = userService.getUser(id);

		theUser.setStatus(1);

		userService.saveUser(theUser);

		return "redirect:/admin/account";
	}

	@PostMapping("/account/deleteUser")
	public String deleteUser(@RequestParam("idUser") int theId) {

		System.out.println("Xóa user có id là: " + theId);

		userService.deleteUser(theId);

		return "redirect:/admin/account";
	}

	// ===== DONNATION =====
	@RequestMapping("/donation")
	public String showDonationPage(Model theModel) {

		// Get donations from the DAO
		List<Donation> theDonations = userService.getDonations();

		// Add the users to the model
		theModel.addAttribute("donations", theDonations);

		theModel.addAttribute("donation", new Donation());

		return "/templates/admin/donation";
	}

	@RequestMapping(value = "/donation/saveDonation", method = RequestMethod.POST)
	public String saveDonation(HttpServletRequest request) {

		Donation theDonation = new Donation();

		theDonation.setCode(request.getParameter("code"));
		theDonation.setDescription(request.getParameter("description"));
		theDonation.setName(request.getParameter("name"));
		theDonation.setStart_date(request.getParameter("start_date"));
		theDonation.setEnd_date(request.getParameter("end_date"));
		theDonation.setOrganization_name(request.getParameter("organization_name"));
		theDonation.setPhone_number(request.getParameter("phone_number"));
		theDonation.setStatus(0);
		theDonation.setMoney(0);

		System.out.println(theDonation.toString());

		userService.saveDonation(theDonation);

		return "redirect:/admin/donation";
	}

	@RequestMapping(value = "/donation/updateDonation", method = RequestMethod.POST)
	public String updateDonation(HttpServletRequest request) {

		int id = Integer.parseInt(request.getParameter("donationId"));
		System.out.println("Donation có ID: " + id + " đang được cập nhật!!!");

		Donation theDonation = userService.getDonation(id);

		theDonation.setCode(request.getParameter("code"));
		theDonation.setName(request.getParameter("name"));
		theDonation.setStart_date(request.getParameter("start_date"));
		theDonation.setEnd_date(request.getParameter("end_date"));
		theDonation.setOrganization_name(request.getParameter("organization_name"));
		theDonation.setPhone_number(request.getParameter("phone_number"));
		theDonation.setDescription(request.getParameter("description"));

		System.out.println(theDonation.toString());

		userService.saveDonation(theDonation);

		return "redirect:/admin/donation";
	}
	
	

	@RequestMapping(value = "/ql-donation/lock", method = RequestMethod.POST)
	public String lockDonation(HttpServletRequest request) {

		int id = Integer.parseInt(request.getParameter("donationId"));

		Donation theDonation = userService.getDonation(id);

		theDonation.setStatus(3);

		userService.saveDonation(theDonation);

		return "redirect:/admin/donation";
	}

	@RequestMapping(value = "/ql-donation/un-lock", method = RequestMethod.POST)
	public String unlockDonation(HttpServletRequest request) {

		int id = Integer.parseInt(request.getParameter("donationId"));

		Donation theDonation = userService.getDonation(id);

		theDonation.setStatus(1);

		userService.saveDonation(theDonation);

		return "redirect:/admin/donation";
	}

	@RequestMapping(value = "/donation/finishDonation", method = RequestMethod.POST)
	public String finishDonation(HttpServletRequest request) {

		int id = Integer.parseInt(request.getParameter("donationId"));

		Donation theDonation = userService.getDonation(id);

		theDonation.setStatus(2);

		userService.saveDonation(theDonation);

		return "redirect:/admin/donation";
	}
	
	@RequestMapping(value = "/donation/closeDonation", method = RequestMethod.POST)
	public String closeDonation(HttpServletRequest request) {

		int id = Integer.parseInt(request.getParameter("donationId"));

		Donation theDonation = userService.getDonation(id);

		theDonation.setStatus(3);

		userService.saveDonation(theDonation);

		return "redirect:/admin/donation";
	}
	
	@RequestMapping(value = "/donation/openDonation", method = RequestMethod.POST)
	public String openDonation(HttpServletRequest request) {

		int id = Integer.parseInt(request.getParameter("donationId"));

		Donation theDonation = userService.getDonation(id);

		theDonation.setStatus(1);

		userService.saveDonation(theDonation);

		return "redirect:/admin/donation";
	}

	@PostMapping("/donation/deleteDonation")
	public String deleteDonation(@RequestParam("donationId") int theId) {

		System.out.println("Xóa Donation có id là: " + theId);

		userService.deleteDonation(theId);

		return "redirect:/admin/donation";
	}

	// ===== DETAILS =====
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public String showDetailPage(@PathVariable("id") int id, Model theModel) {

		Donation theDonation = userService.getDonation(id);

		List<UserDonation> theUserDonations = userService.getUserDonations(id);

		// Add the Donations to the model
		theModel.addAttribute("donation", theDonation);

		// Add the UserDonations to the model
		theModel.addAttribute("userDonations", theUserDonations);

		return "/templates/admin/detail";
	}
	
	@RequestMapping(value = "/detail/accept-user-donation", method = RequestMethod.POST)
	public String acceptUserDonation(HttpServletRequest request) {
		
		int donationId = Integer.parseInt(request.getParameter("donationId"));
		
		int userDonationId = Integer.parseInt(request.getParameter("userDonationId"));
//		System.out.println("UserDonation có ID: " + userDonationId  + " đang được cập nhật!!!");

		UserDonation theUserDonation = userService.getUserDonation(userDonationId);
		Donation theDonation = userService.getDonation(donationId);
		
		int money = theDonation.getMoney();
		int moneyDonation = theUserDonation.getMoney();
		money += moneyDonation;
		theUserDonation.setStatus(1);
		theDonation.setMoney(money);
		
		System.out.println(theUserDonation.toString());

		userService.saveUserDonation(theUserDonation);
		userService.saveDonation(theDonation);

		return "redirect:/admin/detail/" + donationId;
	}
	
	@RequestMapping(value = "/detail/unaccept-user-donation", method = RequestMethod.POST)
	public String unacceptUserDonation(HttpServletRequest request) {
		
		int donationId = Integer.parseInt(request.getParameter("donationId"));
		
		int userDonationId = Integer.parseInt(request.getParameter("userDonationId"));
//		System.out.println("UserDonation có ID: " + userDonationId  + " đang được cập nhật!!!");

		UserDonation theUserDonation = userService.getUserDonation(userDonationId);
		Donation theDonation = userService.getDonation(donationId);

		theUserDonation.setStatus(2);
		
		System.out.println(theUserDonation.toString());

		userService.saveUserDonation(theUserDonation);

		return "redirect:/admin/detail/" + donationId;
	}
	

	// ===== LOGIN =====
	@RequestMapping("/login")
	public String showLoginPage() {
		return "/templates/admin/login";
	}
}
