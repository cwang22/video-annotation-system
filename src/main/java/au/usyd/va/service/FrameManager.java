package au.usyd.va.service;

import java.util.List;

import au.usyd.va.domain.Frame;
import au.usyd.va.domain.VideoAnnotation;

public interface FrameManager {
  public void addFrame(Frame frame);
  public void updateFrame(Frame frame);
  public void deleteFrameById(long id);
  public Frame getFrameById(long id);
  public List<Frame> getFrames(VideoAnnotation va);
}
