package au.usyd.va.service;

import java.io.Serializable;
import java.util.List;

import au.usyd.va.domain.Video;


public interface VideoManager extends Serializable{
	public List<Video> getVideos();
	public void addVideo(Video Video);
	public Video getVideoById(long id);
	public void updateVideo(Video Video);
	public void deleteVideo(long id);
}
