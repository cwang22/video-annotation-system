package au.usyd.va.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.va.dao.ObjectDao;
import au.usyd.va.domain.User;
import au.usyd.va.domain.Video;
import au.usyd.va.domain.VideoObject;

@Service(value = "VideoObjectManager")
@Transactional
public class DatabaseVideoObjectManager implements VideoObjectManager {

  @Autowired
  private ObjectDao objectDao;

  public void setObjectDao(ObjectDao objectDao) {
    this.objectDao = objectDao;
  }

  @Override
  public List<VideoObject> getObjects(Video video) {
    return this.objectDao.getObjects(video);
  }

  @Override
  public List<VideoObject> getObjects(Video video, User user) {
    return this.objectDao.getObjects(video, user);
  }

  @Override
  public void addVideoObject(VideoObject vo) {
    this.objectDao.addVideoObject(vo);
  }

  @Override
  public VideoObject getVideoObjectById(long id) {
    return this.objectDao.getVideoObjectById(id);
  }

  @Override
  public void updateVideoObject(VideoObject vo) {
    this.objectDao.updateVideoObject(vo);
  }

  @Override
  public void deleteVideoObject(long id) {
    this.objectDao.deleteVideoObject(id);
  }

  @Override
  public int getObjectCount() {
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    User user = (User) auth.getPrincipal();
    return this.objectDao.getObjectCount(user);
  }
}
