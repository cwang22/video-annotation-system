package au.usyd.va.web;

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
import au.usyd.va.domain.VideoAnnotation;
import au.usyd.va.domain.VideoObject;
import au.usyd.va.form.AnnotationList;
import au.usyd.va.form.ObjectList;
import au.usyd.va.service.VideoAnnotationManager;
import au.usyd.va.service.VideoManager;
import au.usyd.va.service.VideoObjectManager;

@Controller
public class AnnotationController {
  
  @Resource(name = "VideoManager")
  private VideoManager videoManager;
  @Resource(name = "VideoAnnotationManager")
  private VideoAnnotationManager videoAnnotationManager;
  @Resource(name ="VideoObjectManager")
  private VideoObjectManager videoObjectManager;
  
  public void setVideoManager(VideoManager videoManager) {
    this.videoManager = videoManager;
  }

  public void setVideoAnnotationManager(VideoAnnotationManager videoAnnotationManager) {
    this.videoAnnotationManager = videoAnnotationManager;
  }

  public void setVideoObjectManager(VideoObjectManager videoObjectManager) {
    this.videoObjectManager = videoObjectManager;
  }

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
    int annotationCount = this.videoAnnotationManager.getAnnotationCount();
    int objectCount = this.videoObjectManager.getObjectCount();
    model.addAttribute("annotationCount", annotationCount);
    model.addAttribute("objectCount", objectCount);
    return "annotations";
  }
  
  @RequestMapping(value="/export/annotations")
  public @ResponseBody AnnotationList exportAnnotations(){
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    User currentUser = (User) auth.getPrincipal();
    List<VideoAnnotation> annotations = this.videoAnnotationManager.getAnnotations(currentUser);
    AnnotationList annotationList = new AnnotationList(annotations);
    return annotationList;
  }
  
  @RequestMapping(value="/export/objects")
  public @ResponseBody ObjectList exportObjects(){
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    User currentUser = (User) auth.getPrincipal();
    List<VideoObject> objects = this.videoObjectManager.getObjects(currentUser);
    ObjectList objectList = new ObjectList(objects);
    return objectList;
  }

}
