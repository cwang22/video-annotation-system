package au.usyd.va.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.va.domain.User;
import au.usyd.va.domain.Video;
import au.usyd.va.domain.VideoAnnotation;

@Repository(value = "annotationDao")
@Transactional
public class DefaultAnnotationDao implements AnnotationDao {

  SessionFactory sessionFactory;

  @Autowired
  public void setSessionFactory(SessionFactory sessionFactory) {
    this.sessionFactory = sessionFactory;
  }

  @SuppressWarnings("unchecked")
  @Override
  public List<VideoAnnotation> getAnnotations(Video video) {
    long id = video.getId();
    return this.sessionFactory.getCurrentSession()
            .createQuery("FROM VideoAnnotation as vid where vid.video.id = :id").setLong("id", id)
            .list();
  }

  @SuppressWarnings("unchecked")
  @Override
  public List<VideoAnnotation> getAnnotations(Video video, User user) {
    long id = video.getId();
    String username = user.getUsername();
    return this.sessionFactory
            .getCurrentSession()
            .createQuery(
                    "FROM VideoAnnotation as vid where vid.video.id = :id and vid.user.username = :username ")
            .setLong("id", id).setString("username", username).list();
  }

  @Override
  public void addVideoAnnotation(VideoAnnotation va) {
    this.sessionFactory.getCurrentSession().save(va);

  }

  @Override
  public VideoAnnotation getVideoAnnotationById(long id) {
    return (VideoAnnotation) this.sessionFactory.getCurrentSession().get(VideoAnnotation.class, id);
  }

  @Override
  public void updateVideoAnnotation(VideoAnnotation va) {
    this.sessionFactory.getCurrentSession().update(va);

  }

  @Override
  public void deleteVideoAnnotation(long id) {
    VideoAnnotation va = this.getVideoAnnotationById(id);
    this.sessionFactory.getCurrentSession().delete(va);
  }

  @Override
  public int getAnnotationCount(User user) {
    String username = user.getUsername();
    return ((Number) this.sessionFactory
            .getCurrentSession()
            .createQuery(
                    "SELECT count(*) FROM VideoAnnotation as va where va.user.username = :username ")
            .setString("username", username).uniqueResult()).intValue();
  }

  @SuppressWarnings("unchecked")
  @Override
  public List<VideoAnnotation> getAnnotations(User user) {
    String username = user.getUsername();
    return this.sessionFactory.getCurrentSession()
            .createQuery("FROM VideoAnnotation as va where va.user.username = :username ")
            .setString("username", username).list();
  }

}
