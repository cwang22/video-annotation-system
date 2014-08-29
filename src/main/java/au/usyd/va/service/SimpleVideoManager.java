package au.usyd.va.service;

import java.util.List;

import au.usyd.va.domain.Video;

public class SimpleVideoManager implements VideoManager {

  private static final long serialVersionUID = 1L;

  @Override
  public List<Video> getVideos() {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public void addVideo(Video Video) {
    // TODO Auto-generated method stub
  }

  @Override
  public Video getVideoById(long id) {
    Video v = new Video();
    return v;
  }

  @Override
  public void updateVideo(Video Video) {
    // TODO Auto-generated method stub
  }

  @Override
  public void deleteVideo(long id) {
    // TODO Auto-generated method stub
  }

}
