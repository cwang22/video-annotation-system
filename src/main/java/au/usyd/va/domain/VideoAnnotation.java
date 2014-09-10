package au.usyd.va.domain;

import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "VideoAnnotation")
public class VideoAnnotation {

  @Id
  @Column(name = "Id")
  @GeneratedValue
  private long id;

  @ManyToOne
  @JoinColumn(name = "Videoid")
  private Video video;

  @Column(name = "Starttime")
  private double startTime;

  @Column(name = "Endtime")
  private double endTime;

  @Column(name = "Keyframe")
  private int keyFrame;

  @Column(name = "Rank")
  private int rank;
  
  @ElementCollection
  @CollectionTable(name="Frame",joinColumns=@JoinColumn(name="videoAnnotationid"))
  @Column(name = "Keyframes")
  private List<Frame> keyFrames;

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public Video getVideo() {
    return video;
  }

  public void setVideo(Video video) {
    this.video = video;
  }

  public double getStarttime() {
    return startTime;
  }

  public void setStarttime(double starttime) {
    this.startTime = starttime;
  }

  public double getEndtime() {
    return endTime;
  }

  public void setEndtime(double endtime) {
    this.endTime = endtime;
  }

  public int getKeyFrame() {
    return keyFrame;
  }

  public void setKeyFrame(int keyFrame) {
    this.keyFrame = keyFrame;
  }

  public int getRank() {
    return rank;
  }

  public void setRank(int rank) {
    this.rank = rank;
  }

  @Override
  public String toString() {
    return "VideoAnnotation [id=" + id + ", video=" + video + ", starttime=" + startTime
            + ", endtime=" + endTime + ", keyFrame=" + keyFrame + ", rank=" + rank + "]";
  }

}
