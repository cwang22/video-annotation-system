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

import au.usyd.va.domain.User;

/**
 * 
 * @author C
 * @TODO decouple UserDAO
 */
public class DefaultUserDetailsService implements UserDetailsService {

  protected final Log logger = LogFactory.getLog(getClass());

  @Autowired
  private SessionFactory sessionFactory;

  @Autowired
  private MessageSource messageSource;

  @Autowired
  private UserCache userCache;

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    Collection<GrantedAuthority> auths = new ArrayList<GrantedAuthority>();

    User user = (User) this.userCache.getUserFromCache(username);

    if (user == null) {
      user = (User) this.sessionFactory.getCurrentSession()
              .createQuery("FROM User where username =: username").setString("username", username)
              .uniqueResult();
      if (user == null)
        throw new UsernameNotFoundException(this.messageSource.getMessage(
                "UserDetailsService.userNotFount", new Object[] {username}, null));
    }

    logger.info("*********************" + username + "***********************");
    logger.info(user.getAuthorities());
    logger.info("********************************************************");

    this.userCache.putUserInCache(user);

    return user;

  }

}
