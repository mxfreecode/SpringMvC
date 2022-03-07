package com.ecommerce.app;

/**
 * @author adminmx
 *
 */
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ecommerce.app.dto.Credential;
import com.ecommerce.app.entity.User;
import com.ecommerce.app.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	//Initial Page
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}

	
	@RequestMapping("error")
	public ModelAndView getError() {
		ModelAndView modelo = new ModelAndView();
		modelo.setViewName("error");
		return modelo;
	}
	
	@RequestMapping(value = "/showRegisters", method = RequestMethod.GET)
	public String showRegistrationPage(Model model) {
		User user = new User();
		model.addAttribute("user",user);
		return "registration";
	}
	

	
	@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	public String doRegistration(@ModelAttribute User user, Model model) {
		
		try {
		userService.saveUser(user);
		Credential credential = new Credential();
		model.addAttribute("credential", credential);
		return "login";
		}
		catch(Exception e)
		{
			return "login";
		}
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String autheticateUser(@ModelAttribute Credential credential, RedirectAttributes redAtt) {
		User user = userService.autheticateUser(credential.getName(), credential.getPassword());
		if(ObjectUtils.isEmpty(user)) return "loginfailure";
		redAtt.addFlashAttribute("userId", user.getUserId());
		return "redirect:/getProducts"; 
	}
}
