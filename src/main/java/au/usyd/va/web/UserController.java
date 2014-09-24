package au.usyd.va.web;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import au.usyd.va.domain.User;
import au.usyd.va.service.UserManager;

@Controller
public class UserController {

  @RequestMapping(method = RequestMethod.GET, value = "/login")
  public String login() {
    return "login";
  }

  private static final Logger logger = LoggerFactory.getLogger(UserController.class);

  @Resource(name = "DefaultUserManager")
  private UserManager userManager;

  @RequestMapping(value = "/register", method = RequestMethod.GET)
  public String register(Model model) {
    logger.info("register");
    User user = new User();
    model.addAttribute(user);
    return "register";
  }

  @RequestMapping(value = "/register", method = RequestMethod.POST)
  public String register(@Valid User user, BindingResult result, Model model) {
    logger.info(user.getPassword());
    

    if (result.hasErrors()) {
      return "register";
    }

    if (user != null) {
      user.setAccountNonExpired(true);
      user.setAccountNonLocked(true);
      user.setCredentialsNonExpired(true);
      user.setEnabled(true);
      user.setRole(1);
      this.userManager.addUser(user);
    }

    return "redirect:/login";
  }
  
  @RequestMapping(value="/profile", method = RequestMethod.GET)
  public String profile(Model model){
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    User user = (User) auth.getPrincipal();
    model.addAttribute(user);
    return "profile";
  }
  
  @RequestMapping(value="/profile", method = RequestMethod.POST)
  public String profile(User user){
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    User currentUser = (User) auth.getPrincipal();
    currentUser.setInstitution(user.getInstitution());
    currentUser.setName(user.getName());
    if(!user.getPassword().isEmpty())
      currentUser.setPassword(user.getPassword());
    this.userManager.updateUser(currentUser);
    return "profile";
  }
}
