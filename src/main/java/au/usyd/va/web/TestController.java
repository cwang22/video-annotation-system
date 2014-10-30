package au.usyd.va.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/test")
public class TestController {

  /**
   * Simply selects the home view to render by returning its name.
   */
  @RequestMapping(value = "/")
  public String testPage(Model model) {

    return "test";
  }

}
