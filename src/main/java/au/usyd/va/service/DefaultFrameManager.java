package au.usyd.va.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import au.usyd.va.dao.FrameDao;
import au.usyd.va.domain.Frame;
import au.usyd.va.domain.VideoAnnotation;

@Service(value="frameManager")
public class DefaultFrameManager implements FrameManager{
  
  private FrameDao frameDao;
  
  @Autowired
  public void setFrameDao(FrameDao frameDao) {
    this.frameDao = frameDao;
  }

  @Override
  public void addFrame(Frame frame) {
    this.frameDao.addFrame(frame);
  }

  @Override
  public void updateFrame(Frame frame) {
    this.frameDao.updateFrame(frame);
    
  }

  @Override
  public void deleteFrameById(long id) {
    this.frameDao.deleteFrameById(id);
    
  }

  @Override
  public Frame getFrameById(long id) {
    return this.frameDao.getFrameById(id);
  }

  @Override
  public List<Frame> getFrames(VideoAnnotation va) {
    return this.frameDao.getFrames(va);
  }
}
