package au.usyd.va.form;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import au.usyd.va.domain.VideoObject;

@XmlRootElement(name = "VideoObjects")
public class ObjectList {
  private List<VideoObject> objects;

  public ObjectList() {
    super();
  }

  public ObjectList(List<VideoObject> objects) {
    super();
    this.objects = objects;
  }

  @XmlElement(name = "VideoObject")
  public List<VideoObject> getObjects() {
    return objects;
  }

  public void setObjects(List<VideoObject> objects) {
    this.objects = objects;
  }

}
