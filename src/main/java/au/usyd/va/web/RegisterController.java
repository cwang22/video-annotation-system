package au.usyd.va.web;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/register")
public class RegisterController {
  private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
  
  @Resource(name="DefaultUserDetailsService")
  private UserDetailsService defaultUserDetailsService;
  
  public String home() {
    logger.info("RegisterController.home");
    return "register";
    
  }
}
