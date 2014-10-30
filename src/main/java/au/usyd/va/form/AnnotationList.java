package au.usyd.va.form;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import au.usyd.va.domain.VideoAnnotation;

@XmlRootElement(name = "VideoAnnotations")  
public class AnnotationList {
  private List<VideoAnnotation> annotations;

  public AnnotationList() {
    super();
  }

  public AnnotationList(List<VideoAnnotation> annotations) {
    super();
    this.annotations = annotations;
  }
  
  @XmlElement(name = "VideoAnnotation")  
  public List<VideoAnnotation> getAnnotations() {
    return annotations;
  }

  public void setAnnotations(List<VideoAnnotation> annotations) {
    this.annotations = annotations;
  }
  
}
