package au.usyd.va.service;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.va.domain.Video;

@Service(value="VideoManager")
@Transactional
public class DatabaseVideoManager implements VideoManager {
	
	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Video> getVideos() {
		return this.sessionFactory.getCurrentSession().createQuery("FROM Video").list();
	}

	@Override
	public void addVideo(Video video) {
		
		this.sessionFactory.getCurrentSession().save(video);

	}

	@Override
	public Video getVideoById(long id) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		Video video = (Video) currentSession.get(Video.class, id);
		return video;
	}

	@Override
	public void updateVideo(Video video) {
		this.sessionFactory.getCurrentSession().merge(video);

	}

	@Override
	public void deleteVideo(long id) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		Video video = (Video) currentSession.get(Video.class, id);
		currentSession.delete(video);
	}
}
