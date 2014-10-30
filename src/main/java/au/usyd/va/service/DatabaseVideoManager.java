package au.usyd.va.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.va.dao.AnnotationDao;
import au.usyd.va.dao.VideoDao;
import au.usyd.va.domain.User;
import au.usyd.va.domain.Video;
import au.usyd.va.domain.VideoAnnotation;

@Service(value = "VideoManager")
@Transactional
public class DatabaseVideoManager implements VideoManager {

  /**
   * 
   */
  private static final long serialVersionUID = 1L;

  private VideoDao videoDao;
  private AnnotationDao annotationDao;
  

  @Autowired
  public void setVideoDao(VideoDao videoDao) {
    this.videoDao = videoDao;
  }
  
  @Autowired
  public void setAnnotationDao(AnnotationDao annotationDao) {
    this.annotationDao = annotationDao;
  }

  @Override
  public List<Video> getVideos() {
    return this.videoDao.getVideos();
  }
  
  public List<Video> getFinishedVideos(User user) {
    List<Video> returnVideos = new ArrayList<Video>();
    
    List<Video> videos = this.getVideos();
    Iterator<Video> it = videos.iterator();
    while(it.hasNext()) {
      Video video = it.next();
      List<VideoAnnotation> vas = this.annotationDao.getAnnotations(video, user);
      if(!vas.isEmpty()) {
        if(vas.get(0).isFinished())
          returnVideos.add(video);
      }
    }
    
    return returnVideos;
  }
  
  public List<Video> getStartedVideos(User user) {
    List<Video> returnVideos = new ArrayList<Video>();
    
    List<Video> videos = this.getVideos();
    Iterator<Video> it = videos.iterator();
    while(it.hasNext()) {
      Video video = it.next();
      List<VideoAnnotation> vas = this.annotationDao.getAnnotations(video, user);
      if(!vas.isEmpty()) {
        if(!vas.get(0).isFinished())
          returnVideos.add(video);
      }
    }
    
    return returnVideos;
  }
  
  public List<Video> getNewVideos(User user) {
    List<Video> returnVideos = new ArrayList<Video>();
    
    List<Video> videos = this.getVideos();
    Iterator<Video> it = videos.iterator();
    while(it.hasNext()) {
      Video video = it.next();
      List<VideoAnnotation> vas = this.annotationDao.getAnnotations(video, user);
      if(vas.isEmpty()) {
        returnVideos.add(video);
      }
    }
    
    return returnVideos;
  }

  @Override
  public void addVideo(Video video) {
    this.videoDao.addVideo(video);
  }

  @Override
  public Video getVideoById(long id) {
    return this.videoDao.getVideoById(id);
  }

  @Override
  public void updateVideo(Video video) {
    this.videoDao.updateVideo(video);
  }

  @Override
  public void deleteVideo(long id) {
    this.videoDao.deleteVideo(id);
  }
  
  

}
