package au.usyd.va.service;

import au.usyd.va.domain.User;

public interface UserManager {
  public void addUser(User user);
  public void updateUser(User user);
  public void deleteUserByUsername(String username);
  public User getUserByUsername(String username);
}
