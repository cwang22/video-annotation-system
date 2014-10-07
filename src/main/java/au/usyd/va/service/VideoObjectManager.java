package au.usyd.va.service;

import java.util.List;

import au.usyd.va.domain.User;
import au.usyd.va.domain.Video;
import au.usyd.va.domain.VideoObject;


public interface VideoObjectManager {
  public List<VideoObject> getObjects(Video video);
  public List<VideoObject> getObjects(Video video, User user);
  public void addVideoObject(VideoObject vo);
  public VideoObject getVideoObjectById(long id);
  public void updateVideoObject(VideoObject vo);
  public void deleteVideoObject(long id);
}
