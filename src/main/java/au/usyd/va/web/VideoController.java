package au.usyd.va.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

import au.usyd.va.domain.Video;
import au.usyd.va.domain.VideoAnnotation;
import au.usyd.va.service.VideoAnnotationManager;
import au.usyd.va.service.VideoManager;

@Controller
@RequestMapping(value = "/video/**")
public class VideoController {

  @Resource(name = "VideoManager")
  private VideoManager videoManager;

  @Resource(name = "VideoAnnotationManager")
  private VideoAnnotationManager videoAnnotationManager;

  @RequestMapping(value = "/all")
  public String videoPage(Model uiModel) {

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
  public String markVideo(@PathVariable("id") Long id, Model uiModel) {
    Video video = this.videoManager.getVideoById(id);
    uiModel.addAttribute("video", video);
    return "mark";

  }

  @RequestMapping(value = "/mark", method = RequestMethod.POST)
  public String addAnnotation(HttpServletRequest httpServletRequest) {
    long id = Long.parseLong(httpServletRequest.getParameter("id"));
    String jsonString = httpServletRequest.getParameter("json");
    Gson gson = new Gson();
    JsonParser parser = new JsonParser();

    Video video = this.videoManager.getVideoById(id);
    JsonArray array = parser.parse(jsonString).getAsJsonObject().getAsJsonArray("time");
    System.out.println(array);
    for (int i = 0; i < array.size(); i++) {
      VideoAnnotation va = gson.fromJson(array.get(i), VideoAnnotation.class);
      va.setVideo(video);
      System.out.println(va);
      this.videoAnnotationManager.addVideoAnnotation(va);
    }

    return "redirect:select/" + id;

  }

  @RequestMapping(value = "/select/{id}")
  public String selectKeyFrame(@PathVariable("id") Long id, HttpServletRequest httpServletRequest,
          Model uiModel) {
    Video video = this.videoManager.getVideoById(id);
    List<VideoAnnotation> vas = this.videoAnnotationManager.getAnnotations(video);
    uiModel.addAttribute(video);
    uiModel.addAttribute("vas", vas);
    return "select";
  }

  @RequestMapping(value = "/select/{id}", method = RequestMethod.POST)
  public String selectKeyFrame(@PathVariable("id") Long id, Model uiModel) {
    Video video = this.videoManager.getVideoById(id);
    uiModel.addAttribute(video);
    return "redirect:rank/" + id;
  }

  @RequestMapping(value = "/rank/{id}")
  public String rankAnnotation(@PathVariable("id") Long id, Model uiModel) {
    Video video = this.videoManager.getVideoById(id);
    uiModel.addAttribute(video);
    return "rank";
  }

}
