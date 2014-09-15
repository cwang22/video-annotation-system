package au.usyd.va.web;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import au.usyd.va.domain.User;
import au.usyd.va.service.UserManager;

@Controller

public class RegisterController {
  private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
  
  @Resource(name="DefaultUserManager")
  private UserManager userManager;
  
  @RequestMapping(value="/register",method=RequestMethod.GET)
  public String home() {
    logger.info("RegisterController.home");
    return "register";
  }
  
  @RequestMapping(value="/register",method=RequestMethod.POST)
  public String register(HttpServletRequest request) {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    User user = new User();
    user.setUsername(username);
    user.setPassword(password);
    user.setRole(1);
    user.setAccountNonExpired(true);
    user.setAccountNonLocked(true);
    user.setCredentialsNonExpired(true);
    user.setEnabled(true);
    
    this.userManager.addUser(user);
    
    return "home";
  }
}
