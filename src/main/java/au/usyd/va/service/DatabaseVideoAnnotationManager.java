package au.usyd.va.service;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.va.domain.Video;
import au.usyd.va.domain.VideoAnnotation;


@Service(value="VideoAnnotationManager")
@Transactional
public class DatabaseVideoAnnotationManager implements VideoAnnotationManager{
	
	private SessionFactory sessionFactory;

	@Autowired
	public void setSeesionFactory(SessionFactory seesionFactory) {
		this.sessionFactory = seesionFactory;
	}

	@Override
	public List<VideoAnnotation> getAnnotations(Video video) {
		long id = video.getId();
		return this.sessionFactory.getCurrentSession().createQuery("FROM Video where video_id = " + id).list();
	
	}

	@Override
	public void addVideoAnnotation(VideoAnnotation va) {
		this.sessionFactory.getCurrentSession().save(va);
	}

	@Override
	public VideoAnnotation getVideoAnnotationById(long id) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		VideoAnnotation va = (VideoAnnotation) currentSession.get(VideoAnnotation.class, id);
		return va;
	}

	@Override
	public void updateVideoAnnotation(VideoAnnotation va) {
		this.sessionFactory.getCurrentSession().merge(va);
		
	}

	@Override
	public void deleteVideoAnnoation(long id) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		VideoAnnotation va = (VideoAnnotation) currentSession.get(VideoAnnotation.class, id);
		currentSession.delete(va);
		
	}

	

}
