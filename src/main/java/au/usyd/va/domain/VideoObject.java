package au.usyd.va.domain;

import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "VideoObject")
@XmlRootElement(name="VideoAnnotation")
public class VideoObject {

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
  
  @Column(name = "Text")
  private String text;
  
  @Column(name = "Videotime")
  private double time;
  
  @ElementCollection(fetch=FetchType.EAGER)
  @CollectionTable(
        name="Point",
        joinColumns=@JoinColumn(name="Ownerid")
  )
  private List<Point> points;

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

  public User getUser() {
    return user;
  }
  
  @XmlTransient
  public void setUser(User user) {
    this.user = user;
  }

  public String getText() {
    return text;
  }

  public void setText(String text) {
    this.text = text;
  }

  public double getTime() {
    return time;
  }

  public void setTime(double time) {
    this.time = time;
  }

  public List<Point> getPoints() {
    return points;
  }

  public void setPoints(List<Point> points) {
    this.points = points;
  }

  @Override
  public String toString() {
    return "VideoObject [id=" + id + ", video=" + video + ", user=" + user + ", text=" + text
            + ", time=" + time + ", points=" + points + "]";
  }
  
  
}
