package springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springdemo.dao.CustomerDAO;
import springdemo.entity.Customer;
import springdemo.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	// Need to inject to the customer dao
	@Autowired
	private CustomerDAO customerDAO;
	
	@Autowired
	private CustomerService customerService;
			
	@GetMapping("/list")
	public String lisCustomer(Model theModel) {
		
		// Get customers from the DAO
		List<Customer> theCustomers = customerService.getCustomers();
		
		// Add the customers to the model
		theModel.addAttribute("customers", theCustomers);
		
		return "list-customer";
	}
	
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {
		
		Customer theCustomer = new Customer();
		
		// Add the customers to the model
		theModel.addAttribute("customer", theCustomer);
		
		return "customer-form";
	}
	
	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("customer") Customer theCustomer) {
		
		customerService.saveCustomer(theCustomer);
		
		return "redirect:/customer/list";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("customerId") int theId, Model theModel) {
		
		Customer theCustomer = customerService.getCustomer(theId);
		
		theModel.addAttribute("customer",theCustomer);
		
		return "customer-form";
	}
	
	@GetMapping("/delete")
	public String deleteCustomer(@RequestParam("customerId") int theId) {
		
		customerService.deleteCustomer(theId);
		
		return "redirect:/customer/list";
	}


}
 