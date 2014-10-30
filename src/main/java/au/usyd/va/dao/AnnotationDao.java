package au.usyd.va.dao;

import java.util.List;

import au.usyd.va.domain.User;
import au.usyd.va.domain.Video;
import au.usyd.va.domain.VideoAnnotation;

public interface AnnotationDao {
  public List<VideoAnnotation> getAnnotations(Video video);
  public List<VideoAnnotation> getAnnotations(Video video, User user);
  public void addVideoAnnotation(VideoAnnotation va);
  public VideoAnnotation getVideoAnnotationById(long id);
  public void updateVideoAnnotation(VideoAnnotation va);
  public void deleteVideoAnnotation(long id);
  public int getAnnotationCount(User user);
  public List<VideoAnnotation> getAnnotations(User user);
}
