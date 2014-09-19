package au.usyd.va.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import au.usyd.va.domain.Frame;
import au.usyd.va.domain.User;
import au.usyd.va.domain.Video;
import au.usyd.va.domain.VideoAnnotation;
import au.usyd.va.service.FrameManager;
import au.usyd.va.service.VideoAnnotationManager;
import au.usyd.va.service.VideoManager;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

@Controller
@RequestMapping(value = "/video/**")
public class VideoController {

  @Resource(name = "VideoManager")
  private VideoManager videoManager;

  @Resource(name = "VideoAnnotationManager")
  private VideoAnnotationManager videoAnnotationManager;
  
  @Resource(name = "frameManager")
  private FrameManager frameManager;

  @RequestMapping(value = "/all")
  public String videoPage(Model uiModel) {
    User user = this.getCurrentUser();
    List<Video> newVideos = this.videoManager.getNewVideos(user);
    List<Video> startedVideos = this.videoManager.getStartedVideos(user);
    List<Video> finishedVideos = this.videoManager.getFinishedVideos(user);
    
    uiModel.addAttribute("newvideos", newVideos);
    uiModel.addAttribute("startedvideos", startedVideos);
    uiModel.addAttribute("finishedvideos", finishedVideos);
    return "video";
  }

  @RequestMapping(value = "/watch/{id}")
  public String watchVideo(@PathVariable("id") Long id, Model uiModel) {
    Video video = this.videoManager.getVideoById(id);
    uiModel.addAttribute("video", video);
    return "watch";
  }

  @RequestMapping(value = "/add")
  public String addVideo(Model uiModel) {
    return "addvideo";
  }

  @RequestMapping(value = "/add", method = RequestMethod.POST)
  public String addVideo(HttpServletRequest httpServletRequest) {
    Video video = new Video();

    video.setTitle(httpServletRequest.getParameter("title"));
    video.setSource(httpServletRequest.getParameter("source"));
    video.setDuration(Double.parseDouble(httpServletRequest.getParameter("duration")));
    videoManager.addVideo(video);
    return "redirect:mark/1";

  }

  @RequestMapping(value = "/mark/{id}")
  public String markPage(@PathVariable("id") Long id, Model uiModel) {
    Video video = this.videoManager.getVideoById(id);
    uiModel.addAttribute("video", video);
    return "mark";

  }

  @RequestMapping(value = "/mark", method = RequestMethod.POST)
  public String addAnnotation(HttpServletRequest httpServletRequest) {
    long id = Long.parseLong(httpServletRequest.getParameter("id"));
    String jsonString = httpServletRequest.getParameter("json");
    System.out.println(jsonString);
    Gson gson = new Gson();
    JsonParser parser = new JsonParser();

    Video video = this.videoManager.getVideoById(id);
    User user = this.getCurrentUser();
    JsonArray array = parser.parse(jsonString).getAsJsonObject().getAsJsonArray("va");
    System.out.println(array);
    
    for (int i = 0; i < array.size(); i++) {
      VideoAnnotation va = gson.fromJson(array.get(i), VideoAnnotation.class);
      va.setVideo(video);
      va.setUser(user);
      va.setFinished(false);
      System.out.println(va);
      this.videoAnnotationManager.addVideoAnnotation(va);
    }

    return "redirect:select/" + id;

  }

  @RequestMapping(value = "/select/{id}")
  public String selectPage(@PathVariable("id") Long id, Model uiModel) {
    Video video = this.videoManager.getVideoById(id);
    User user = this.getCurrentUser();
    List<VideoAnnotation> vas = this.videoAnnotationManager.getAnnotations(video, user);
    uiModel.addAttribute(video);
    uiModel.addAttribute("vas", vas);
    return "select";
  }

  @RequestMapping(value = "/select", method = RequestMethod.POST)
  public String selectKeyFrame(HttpServletRequest httpServletRequest) {
    long id = Long.parseLong(httpServletRequest.getParameter("id"));

    String jsonString = httpServletRequest.getParameter("json");
    System.out.println(jsonString);
    JsonParser parser = new JsonParser();
    
    JsonArray array = parser.parse(jsonString).getAsJsonObject().getAsJsonArray("va");
    for (int i = 0; i < array.size(); i++) {
      long vaid = array.get(i).getAsJsonObject().get("id").getAsLong();
      VideoAnnotation va = this.videoAnnotationManager.getVideoAnnotationById(vaid);
      
      String keyFramesString = array.get(i).getAsJsonObject().get("keyFrame").getAsString();
      Scanner s = new Scanner(keyFramesString);
      s.useDelimiter(",");
      while(s.hasNext()) {
        int sequence = s.nextInt();
        Frame frame = new Frame();
        frame.setVa(va);
        frame.setSequence(sequence);
        this.frameManager.addFrame(frame);
      }
      s.close();
      
    }
    return "redirect:rank/" + id;
  }

  @RequestMapping(value = "/rank/{id}")
  public String rankPage(@PathVariable("id") Long id, Model uiModel) {
    List<Frame> returnFrames = new ArrayList<Frame>();
    Video video = this.videoManager.getVideoById(id);
    User user = this.getCurrentUser();
    List<VideoAnnotation> vas = this.videoAnnotationManager.getAnnotations(video, user);
    for(VideoAnnotation va : vas) {
      List<Frame> frames = this.frameManager.getFrames(va);
      returnFrames.addAll(frames);
    }
    uiModel.addAttribute(video);
    uiModel.addAttribute("frames", returnFrames);
    return "rank";
  }

  @RequestMapping(value = "/rank", method = RequestMethod.POST)
  public String rankSegment(HttpServletRequest httpServletRequest) {
    String order = httpServletRequest.getParameter("order");
    long vid = Long.parseLong(httpServletRequest.getParameter("id"));

    Scanner s = new Scanner(order);
    s.useDelimiter(",");
    int count = 0;
    
    while (s.hasNext()) {
      long id = s.nextLong();
      Frame frame = this.frameManager.getFrameById(id);
      frame.setRank(count++);
      this.frameManager.updateFrame(frame);
    }
    
    Video video = this.videoManager.getVideoById(vid);
    User user = this.getCurrentUser();
    List<VideoAnnotation> vas = this.videoAnnotationManager.getAnnotations(video, user);
    for(VideoAnnotation va : vas) {
      va.setFinished(true);
      this.videoAnnotationManager.updateVideoAnnotation(va);
    }
    
    s.close();
    
    return "redirect:success";
  }
  
  @RequestMapping(value="/success")
  public String successPage(Model uiModel) {
    List<Video> videos = this.videoManager.getVideos();
    uiModel.addAttribute("videos", videos);
    return "success";
  }
  
  private User getCurrentUser() {
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    User user = (User) auth.getPrincipal();
    return user;
  }
}
