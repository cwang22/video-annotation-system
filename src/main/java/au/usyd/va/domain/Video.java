package au.usyd.va.domain;

import javax.persistence.*;

@Entity
@Table(name = "Video")
public class Video {
	
	@Id
	@Column(name= "Id")
	@GeneratedValue
	private long id;
	
	@Column(name = "Title")
	private String title;

	@Column(name = "Source")
	private String source;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	@Override
	public String toString() {
		return "Video [id=" + id + ", title=" + title + ", source=" + source
				+ "]";
	}
}

