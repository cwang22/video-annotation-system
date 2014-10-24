package au.usyd.va.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import au.usyd.va.domain.User;
import au.usyd.va.domain.Video;
import au.usyd.va.domain.VideoAnnotation;
import au.usyd.va.service.VideoAnnotationManager;
import au.usyd.va.service.VideoManager;

@Controller
public class AnnotationController {
  
  @Resource(name = "VideoManager")
  private VideoManager videoManager;
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
  
  @RequestMapping(value = "/annotations")
  public String annotationPage(Model model){
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    User currentUser = (User) auth.getPrincipal();
    
    List<Video> videos = this.videoManager.getVideos();
    List<VideoAnnotation> vas = new ArrayList<VideoAnnotation>();
    for(Video video : videos){
      List<VideoAnnotation> singlevas = this.videoAnnotationManager.getAnnotations(video, currentUser);
      vas.addAll(singlevas);
    }

    model.addAttribute("vas",vas);
    return "annotations";
  }

}
