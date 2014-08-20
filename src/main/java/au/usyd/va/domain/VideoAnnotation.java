package au.usyd.va.domain;

public class VideoAnnotation {
	private long id;
	private Video video;
	private long start;
	private long end;
	private long keyFrame;
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
