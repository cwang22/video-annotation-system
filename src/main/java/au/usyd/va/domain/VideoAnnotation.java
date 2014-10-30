package au.usyd.va.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "VideoAnnotation")
@XmlRootElement(name="VideoAnnotation")
public class VideoAnnotation {

  @Id
  @Column(name = "Id")
  @GeneratedValue
  private long id;

  @ManyToOne
  @JoinColumn(name = "Videoid")
  private Video video;

  @ManyToOne
  @JoinColumn(name = "Username")
  private User user;
  
  @Column(name = "Starttime")
  private double startTime;

  @Column(name = "Endtime")
  private double endTime;
  
  @Column(name = "Description")
  private String description;
  
  @Column(name = "IsFinished")
  private boolean isFinished;

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

  public double getStartTime() {
    return startTime;
  }
  
  public void setStartTime(double startTime) {
    this.startTime = startTime;
  }

  public double getEndTime() {
    return endTime;
  }
  
  @XmlElement
  public void setEndTime(double endTime) {
    this.endTime = endTime;
  }

  public User getUser() {
    return user;
  }
  @XmlTransient
  public void setUser(User user) {
    this.user = user;
  }
  
  public String getDescription() {
    return description;
  }
  
  public void setDescription(String description) {
    this.description = description;
  }

  public boolean isFinished() {
    return isFinished;
  }
  
  public void setFinished(boolean isFinished) {
    this.isFinished = isFinished;
  }

  @Override
  public String toString() {
    return "VideoAnnotation [id=" + id + ", video=" + video + ", user=" + user + ", startTime="
            + startTime + ", endTime=" + endTime + ", isFinished=" + isFinished + "]";
  }
  
}
