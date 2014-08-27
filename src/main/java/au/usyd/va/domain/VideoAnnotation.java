package au.usyd.va.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Annotation")
public class VideoAnnotation {
	
	@Id
	@Column(name="id")
	@GeneratedValue
	private long id;
	
	@ManyToOne
	@JoinColumn(name="video_id")
	private Video video;
	
	@Column(name="start")
	private long start;
	
	@Column(name="end")
	private long end;
	
	@Column(name="keyframe")
	private long keyFrame;
	
	@Column(name="rank")
	private int rank;
	
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
	public long getStart() {
		return start;
	}
	public void setStart(long start) {
		this.start = start;
	}
	public long getEnd() {
		return end;
	}
	public void setEnd(long end) {
		this.end = end;
	}
	public long getKeyFrame() {
		return keyFrame;
	}
	public void setKeyFrame(long keyFrame) {
		this.keyFrame = keyFrame;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	
}
