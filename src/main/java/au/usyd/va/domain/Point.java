package au.usyd.va.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class Point {
  @Column(name="X")
  double x;
  
  @Column(name="Y")
  double y;
  
  public double getX() {
    return x;
  }

  public void setX(double x) {
    this.x = x;
  }

  public double getY() {
    return y;
  }

  public void setY(double y) {
    this.y = y;
  }
}
