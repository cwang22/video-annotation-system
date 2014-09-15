package au.usyd.va.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.va.dao.UserDao;
import au.usyd.va.domain.User;

@Service(value="DefaultUserManager")
@Transactional
public class DefaultUserManager implements UserManager {
  
  @Resource(name="")
  private UserDao userDao;
  
  @Autowired
  public UserDao getUserDao() {
    return userDao;
  }

  @Override
  public void addUser(User user) {
    userDao.addUser(user);
  }

  @Override
  public void updateUser(User user) {
    userDao.updateUser(user);

  }

  @Override
  public void deleteUserByUsername(String username) {
    userDao.deleteUserByUsername(username);
  }

}
