package au.usyd.va.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.va.domain.User;
import au.usyd.va.domain.Video;
import au.usyd.va.domain.VideoObject;

@Repository(value = "objectDao")
@Transactional
public class DefaultObjectDao implements ObjectDao {

  SessionFactory sessionFactory;

  @Autowired
  public void setSessionFactory(SessionFactory sessionFactory) {
    this.sessionFactory = sessionFactory;
  }

  @SuppressWarnings("unchecked")
  @Override
  public List<VideoObject> getObjects(Video video) {
    long id = video.getId();
    return this.sessionFactory.getCurrentSession()
            .createQuery("FROM VideoObject as vid where vid.video.id = :id").setLong("id", id)
            .list();
  }

  @SuppressWarnings("unchecked")
  @Override
  public List<VideoObject> getObjects(Video video, User user) {
    long id = video.getId();
    String username = user.getUsername();
    return this.sessionFactory
            .getCurrentSession()
            .createQuery(
                    "FROM VideoObject as vid where vid.video.id = :id and vid.user.username = :username ")
            .setLong("id", id).setString("username", username).list();
  }

  @Override
  public void addVideoObject(VideoObject vo) {
    this.sessionFactory.getCurrentSession().save(vo);

  }

  @Override
  public VideoObject getVideoObjectById(long id) {
    return (VideoObject) this.sessionFactory.getCurrentSession().get(VideoObject.class, id);
  }

  @Override
  public void updateVideoObject(VideoObject vo) {
    this.sessionFactory.getCurrentSession().update(vo);

  }

  @Override
  public void deleteVideoObject(long id) {
    VideoObject vo = this.getVideoObjectById(id);
    this.sessionFactory.getCurrentSession().delete(vo);
  }

  @Override
  public int getObjectCount(User user) {
    String username = user.getUsername();
    return ((Number) this.sessionFactory
            .getCurrentSession()
            .createQuery(
                    "SELECT count(*) FROM VideoObject as vo where vo.user.username = :username ")
            .setString("username", username).uniqueResult()).intValue();
  }

  @SuppressWarnings("unchecked")
  @Override
  public List<VideoObject> getObjects(User user) {
    String username = user.getUsername();
    return this.sessionFactory.getCurrentSession()
            .createQuery("FROM VideoObject as vo where vo.user.username = :username ")
            .setString("username", username).list();
    
  }

}
