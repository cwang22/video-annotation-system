package au.usyd.va.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable 
public class Frame {
  
  @Column(name="sequence")
  private int sequence;
  
  @Column(name="rank")
  private int rank;
}
