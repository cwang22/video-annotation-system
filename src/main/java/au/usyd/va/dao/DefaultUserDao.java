package au.usyd.va.dao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.va.domain.User;

@Repository(value="userDao")
@Transactional
public class DefaultUserDao implements UserDao, UserDetailsService {
  
  protected final Log logger = LogFactory.getLog(getClass());
  
  
  private SessionFactory sessionFactory;

  @Autowired
  public void setSeesionFactory(SessionFactory seesionFactory) {
    this.sessionFactory = seesionFactory;
  }

  public void addUser(User user) {
    this.sessionFactory.getCurrentSession().save(user);
  }

  public void updateUser(User user) {
    this.sessionFactory.getCurrentSession().merge(user);
  }

  public void deleteUserByUsername(String username) {
    User user = (User) this.sessionFactory.getCurrentSession()
            .createQuery("FROM User where username =: username").setString("username", username)
            .uniqueResult();
    this.sessionFactory.getCurrentSession().delete(user);
  }

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

    System.out.println(sessionFactory);
    
    Session session = this.sessionFactory.getCurrentSession();
    System.out.println("hi");
    User user = (User) session.createQuery("FROM User where username = :username")
            .setString("username", username).uniqueResult();

    System.out.println(user.toString());

    logger.info("*********************" + username + "***********************");
    logger.info(user.getAuthorities());
    logger.info("********************************************************");

    return user;
  }

}
