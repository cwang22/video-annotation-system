package au.usyd.va.dao;

import java.util.List;

import au.usyd.va.domain.Video;

public interface VideoDao {
  public List<Video> getVideos();
  public void addVideo(Video video);
  public Video getVideoById(long id);
  public void updateVideo(Video video);
  public void deleteVideo(long id);
}
