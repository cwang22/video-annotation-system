package au.usyd.va.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import au.usyd.va.domain.Video;
import au.usyd.va.service.VideoManager;


@Controller
@RequestMapping(value="/video/**")
public class VideoController {
	
	@Resource(name="videoManager")
	private VideoManager videoManager;
	
	@RequestMapping(value="/all")
	public String videoPage(Model uiModel){
		
		return "video";
	}
	
	
	@RequestMapping(value="/watch/{id}")
	public String watchVideo(@PathVariable("id") Long id, Model uiModel) {
		Video video = this.videoManager.getVideoById(id);
		uiModel.addAttribute("video",video);
		return "watch";
	}
	
	@RequestMapping(value="/add")
	public String addVideo(Model uiModel) {
		return "addvideo";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String addVideo(HttpServletRequest httpServletRequest) {
		Video video = new Video();
		
		video.setTitle(httpServletRequest.getParameter("title"));
		video.setSource(httpServletRequest.getParameter("source"));
		videoManager.addVideo(video);
		return "redirect:/";
		
	}
	
	@RequestMapping(value="/mark/{id}")
	public String markVideo(@PathVariable("id") Long id, Model uiModel) {
		Video video = this.videoManager.getVideoById(id);
		uiModel.addAttribute("video",video);
		return "mark";
		
	}
	
	@RequestMapping(value="/mark",method=RequestMethod.POST)
	public String addAnnotation(HttpServletRequest httpServletRequest) {
		long id = Long.parseLong(httpServletRequest.getParameter("id"));
		String time[] = httpServletRequest.getParameterValues("time");
		System.out.println(time);
 		Video video = this.videoManager.getVideoById(id);
		return "redirect:rank/" + id;
		
	}
	
	@RequestMapping(value="/select/{id}")
	public String selectKeyFrame(@PathVariable("id") Long id, Model uiModel) {
		Video video = this.videoManager.getVideoById(id);
		uiModel.addAttribute(video);
		return "select";
	}
	
	@RequestMapping(value="/rank/{id}")
	public String rankAnnotation(@PathVariable("id") Long id, Model uiModel) {
		Video video = this.videoManager.getVideoById(id);
		uiModel.addAttribute(video);
		return "rank";
	}

}
