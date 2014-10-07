package au.usyd.va.web;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import au.usyd.va.domain.User;
import au.usyd.va.domain.Video;
import au.usyd.va.domain.VideoObject;
import au.usyd.va.service.VideoManager;
import au.usyd.va.service.VideoObjectManager;

@Controller
public class ObjectController {
  
  private static final Logger logger = LoggerFactory.getLogger(ObjectController.class);
  
  @Resource(name = "VideoObjectManager")
  private VideoObjectManager videoObjectManager;
  
  @Resource(name = "VideoManager")
  private VideoManager videoManger;
  
  @RequestMapping(value="/objects/", method = RequestMethod.POST)
  @ResponseStatus(value = HttpStatus.OK)
  public void newObject(@RequestBody VideoObject vo){
    
    Video video = this.videoManger.getVideoById(vo.getVideo().getId());
    
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    User user = (User) auth.getPrincipal();
    
    vo.setVideo(video);
    vo.setUser(user);
    this.videoObjectManager.addVideoObject(vo);
  }
  
  @RequestMapping(value="/object/{id}", method = RequestMethod.GET)
  public @ResponseBody VideoObject getObject(@PathVariable long id){
    VideoObject vo = this.videoObjectManager.getVideoObjectById(id);
    return vo;
  }
  
  @RequestMapping(value="/objects/", method = RequestMethod.GET)
  public @ResponseBody List<VideoObject> getObjects(@RequestParam(value="video", required=true) long id) {
    Video video = this.videoManger.getVideoById(id);
    List<VideoObject> vos = this.videoObjectManager.getObjects(video);
    return vos;
  }
}
