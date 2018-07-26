package com.cb.demo.web;

import com.cb.demo.model.Customer;
import com.cb.demo.model.Product;
import com.cb.demo.model.User;
import com.cb.demo.service.ProductService;
import com.cb.demo.service.SecurityService;
import com.cb.demo.service.UserService;
import com.cb.demo.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.net.URISyntaxException;
import java.util.List;

@Controller
public class UserController {
  @Autowired private UserService userService;

  @Autowired private SecurityService securityService;

  @Autowired private UserValidator userValidator;

  @Autowired private ProductService productService;

  @RequestMapping(value = "/registration", method = RequestMethod.GET)
  public String registration(Model model) {
    model.addAttribute("userForm", new User());

    return "registration";
  }

  @RequestMapping(value = "/registration", method = RequestMethod.POST)
  public String registration(
      @ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
    userValidator.validate(userForm, bindingResult);

    if (bindingResult.hasErrors()) {
      return "registration";
    }

    userService.save(userForm);

    securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

    return "redirect:/cards";
  }

  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public String login(Model model, String error, String logout) {
    if (error != null) model.addAttribute("error", "Your username and password is invalid.");

    if (logout != null) model.addAttribute("message", "You have been logged out successfully.");

    return "login";
  }

  @RequestMapping(
      value = {"/", "/welcome"},
      method = RequestMethod.GET)
  public String welcome(Model model) throws URISyntaxException {

    List<Product> products = productService.getProductRecommendation();
    model.addAttribute("products", products);

    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    String email = auth.getName();
    if (email.equalsIgnoreCase("support@cb.com")) {
      return "support-cards";
    }
    return "cards";
  }

  @RequestMapping(
      value = {"/customers/{searchText}"},
      method = RequestMethod.GET)
  public String customers(@PathVariable("searchText") String searchText, Model model)
      throws URISyntaxException {

    List<Customer> customers = productService.fetchCustomersForProducts(searchText);
    model.addAttribute("customers", customers);

    return "customers";
  }
}
