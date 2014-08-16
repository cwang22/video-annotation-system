package au.usyd.va.web;

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
	
	
	
	@RequestMapping(value="/watch/{id}")
	public String watchVideo(@PathVariable("id") Long id, Model uiModel) {
		Video video = this.videoManager.getVideoById(id);
		System.out.println(video.toString());
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
		System.out.println(video.toString());
		uiModel.addAttribute("video",video);
		return "mark";
		
	}

}
