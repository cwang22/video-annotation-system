package au.usyd.va.service;

import java.util.ArrayList;
import java.util.Collection;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserCache;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.va.domain.User;

/**
 * 
 * @author C
 * @TODO decouple UserDAO
 */
@Service(value="DefaultUserDetailsService")
@Transactional
public class DefaultUserDetailsService implements UserDetailsService {

  protected final Log logger = LogFactory.getLog(getClass());

  @Autowired
  private SessionFactory sessionFactory;
  
  public void addUser(User user) {
    this.sessionFactory.getCurrentSession().save(user);
  }
  
  public void updateUser(User user) {
    this.sessionFactory.getCurrentSession().merge(user);
  }
  
  public void deleteUserByUsername(String username) {
    User user = (User) this.sessionFactory.getCurrentSession().createQuery("FROM User where username =: username").setString("username", username)
            .uniqueResult();
    this.sessionFactory.getCurrentSession().delete(user);
  }

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    Collection<GrantedAuthority> auths = new ArrayList<GrantedAuthority>();
    System.out.println("loadUserByUsername");
    User user = this.sessionFactory.getCurrentSession().save();

    if (user == null) {
      user = (User) this.sessionFactory.getCurrentSession()
              .createQuery("FROM User where username =: username").setString("username", username)
              .uniqueResult();
      if (user == null)
        throw new UsernameNotFoundException(
                "UserDetailsService.userNotFount");
    }

    logger.info("*********************" + username + "***********************");
    logger.info(user.getAuthorities());
    logger.info("********************************************************");

    return user;
  }

}
