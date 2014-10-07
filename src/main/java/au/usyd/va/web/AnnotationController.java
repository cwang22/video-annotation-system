package au.usyd.va.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import au.usyd.va.domain.User;
import au.usyd.va.domain.VideoAnnotation;
import au.usyd.va.service.VideoAnnotationManager;

@Controller
public class AnnotationController {
  @Resource(name = "VideoAnnotationManager")
  private VideoAnnotationManager videoAnnotationManager;

  @RequestMapping(value = "/annotation/{id}", method = RequestMethod.GET)
  public @ResponseBody VideoAnnotation get(@PathVariable long id) {
    VideoAnnotation va = this.videoAnnotationManager.getVideoAnnotationById(id);
    return va;
  }

  @RequestMapping(value = "/annotation/{id}", method = RequestMethod.DELETE)
  public void delete(@PathVariable long id, HttpServletResponse response) {
    VideoAnnotation va = this.videoAnnotationManager.getVideoAnnotationById(id);
    User owner = va.getUser();
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    User currentUser = (User) auth.getPrincipal();
    if (owner.equals(currentUser)) {
      this.videoAnnotationManager.deleteVideoAnnotation(id);
      response.setStatus(HttpServletResponse.SC_OK);
    }else{
      response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
    }
  }

}
