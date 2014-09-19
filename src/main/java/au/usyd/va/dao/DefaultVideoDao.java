package au.usyd.va.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.va.domain.Video;

@Repository(value="videoDao")
@Transactional
public class DefaultVideoDao implements VideoDao{
  
  private SessionFactory sessionFactory;

  @Autowired
  public void setSeesionFactory(SessionFactory seesionFactory) {
    this.sessionFactory = seesionFactory;
  }

  @Override
  public List<Video> getVideos() {
    return this.sessionFactory.getCurrentSession().createQuery("FROM Video").list();
  }

  @Override
  public void addVideo(Video video) {
    this.sessionFactory.getCurrentSession().save(video);
    
  }

  @Override
  public Video getVideoById(long id) {
    Session currentSession = this.sessionFactory.getCurrentSession();
    Video video = (Video) currentSession.get(Video.class, id);
    return video;
  }

  @Override
  public void updateVideo(Video video) {
    this.sessionFactory.getCurrentSession().update(video);
    
  }

  @Override
  public void deleteVideo(long id) {
    Session currentSession = this.sessionFactory.getCurrentSession();
    Video video = (Video) currentSession.get(Video.class, id);
    currentSession.delete(video);
  }

}
