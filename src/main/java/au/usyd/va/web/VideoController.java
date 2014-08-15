package au.usyd.va.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
		uiModel.addAttribute(video);
		return "watch";
	}
	

}
