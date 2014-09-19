package au.usyd.va.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.va.dao.AnnotationDao;
import au.usyd.va.domain.User;
import au.usyd.va.domain.Video;
import au.usyd.va.domain.VideoAnnotation;

@Service(value = "VideoAnnotationManager")
@Transactional
public class DatabaseVideoAnnotationManager implements VideoAnnotationManager {
  
  @Autowired
  private AnnotationDao annotationDao;
  
  
  public void setAnnotationDao(AnnotationDao annotationDao) {
    this.annotationDao = annotationDao;
  }

  @Override
  public List<VideoAnnotation> getAnnotations(Video video) {
   return this.annotationDao.getAnnotations(video);
  }
  

  @Override
  public List<VideoAnnotation> getAnnotations(Video video, User user) {
    return this.annotationDao.getAnnotations(video, user);
  }

  @Override
  public void addVideoAnnotation(VideoAnnotation va) {
    this.annotationDao.addVideoAnnotation(va);
  }

  @Override
  public VideoAnnotation getVideoAnnotationById(long id) {
    return this.annotationDao.getVideoAnnotationById(id);
  }

  @Override
  public void updateVideoAnnotation(VideoAnnotation va) {
    this.annotationDao.updateVideoAnnotation(va);
  }

  @Override
  public void deleteVideoAnnoation(long id) {
    this.annotationDao.deleteVideoAnnoation(id);
  }

}
