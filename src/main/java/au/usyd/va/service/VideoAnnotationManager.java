package au.usyd.va.service;

import java.util.List;

import au.usyd.va.domain.Video;
import au.usyd.va.domain.VideoAnnotation;

public interface VideoAnnotationManager {
	public List<VideoAnnotation> getAnnotations(Video video);
	public void addVideoAnnotation(VideoAnnotation va);
	public VideoAnnotation getVideoAnnotationById(long id);
	public void updateVideoAnnotation(Video video);
	public void deleteVideoAnnoation(long id);
}
