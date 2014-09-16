package au.usyd.va.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.va.domain.Frame;
import au.usyd.va.domain.VideoAnnotation;

@Repository(value="frameDao")
@Transactional
public class DefaultFrameDao implements FrameDao{
  
  private SessionFactory sessionFactory;
  
  @Autowired
  public void setSessionFactory(SessionFactory sessionFactory) {
    this.sessionFactory = sessionFactory;
  }

  @Override
  public void addFrame(Frame frame) {
    this.sessionFactory.getCurrentSession().save(frame);
    
  }

  @Override
  public void updateFrame(Frame frame) {
    this.sessionFactory.getCurrentSession().update(frame);
    
  }

  @Override
  public void deleteFrameById(long id) {
    Frame frame = (Frame) this.sessionFactory.getCurrentSession().get(Frame.class, id);
    this.sessionFactory.getCurrentSession().delete(frame);
    
  }

  @Override
  public Frame getFrameById(long id) {
    Frame frame = (Frame) this.sessionFactory.getCurrentSession().get(Frame.class, id);
    return frame;
  }

  @Override
  public List<Frame> getFrames(VideoAnnotation va) {
    List<Frame> frames = new ArrayList<Frame>();
    long id = va.getId();
    frames = this.sessionFactory.getCurrentSession()
            .createQuery("FROM Frame as frame where frame.va.id = " + id).list();
    return frames;
  }
}
