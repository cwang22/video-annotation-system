package au.usyd.va.form;

import java.util.List;

import au.usyd.va.domain.Point;

public class ObjectForm {
  long id;
  String text;
  double time;
  List<Point> points;
  
  public ObjectForm(long id, String text, double time, List<Point> points) {
    super();
    this.id = id;
    this.text = text;
    this.time = time;
    this.points = points;
  }
  
  public ObjectForm() {
  }

  public long getId() {
    return id;
  }
  public void setId(long id) {
    this.id = id;
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
}
