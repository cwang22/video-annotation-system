package au.usyd.va.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Frame")
public class Frame {
  
  @Id
  @Column(name="Id")
  @GeneratedValue
  private long id;
  
  @ManyToOne
  @JoinColumn(name = "Videoannotationid")
  private VideoAnnotation va;
  
  @Column(name="Sequence")
  private int sequence;
  
  @Column(name="Rank")
  private int rank;

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public VideoAnnotation getVa() {
    return va;
  }

  public void setVa(VideoAnnotation va) {
    this.va = va;
  }

  public int getSequence() {
    return sequence;
  }

  public void setSequence(int sequence) {
    this.sequence = sequence;
  }

  public int getRank() {
    return rank;
  }

  public void setRank(int rank) {
    this.rank = rank;
  }
}
