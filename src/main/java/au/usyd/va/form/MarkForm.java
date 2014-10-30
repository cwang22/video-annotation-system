package au.usyd.va.form;

import java.util.List;
import au.usyd.va.domain.Video;
import au.usyd.va.domain.VideoAnnotation;

public class MarkForm {
  Video video;
  List<VideoAnnotation> vas;
  
  public Video getVideo() {
    return video;
  }
  public void setVideo(Video video) {
    this.video = video;
  }
  public List<VideoAnnotation> getVas() {
    return vas;
  }
  public void setVas(List<VideoAnnotation> vas) {
    this.vas = vas;
  }
  
  
}
