package au.usyd.va.dao;

import org.springframework.security.core.userdetails.UserDetails;

import au.usyd.va.domain.User;

public interface UserDao {
  public void addUser(User user);
  public void updateUser(User user);
  public void deleteUserByUsername(String username);
  public UserDetails loadUserByUsername(String username);
  
}
