/**
 * 
 */
package com.ecommerce.app;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ecommerce.app.entity.LogIn;

/**
 * @author adminmx
 *
 */
public class RegisterController {

	@RequestMapping("/goRegister")
	public ModelAndView redirect() {
		
		return new ModelAndView("register", "command", new LogIn());
	}



	@RequestMapping(value = "/register", method = {RequestMethod.GET, RequestMethod.POST})
	public String register() {
		return "registration";
	}


}













