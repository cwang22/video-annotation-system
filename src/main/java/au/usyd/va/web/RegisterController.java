package au.usyd.va.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import au.usyd.va.domain.User;
import au.usyd.va.service.UserManager;

@Controller
public class RegisterController {
  private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);

  @Resource(name = "DefaultUserManager")
  private UserManager userManager;

  @RequestMapping(value = "/register", method = RequestMethod.GET)
  public String home(Model model) {
    logger.info("RegisterController.home");
    User user = new User();
    model.addAttribute(user);
    return "register";
  }

  @RequestMapping(value = "/register", method = RequestMethod.POST)
  public String register(@Valid User user, BindingResult result, Model model) {
    
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
    
    return "home";
  }
}
