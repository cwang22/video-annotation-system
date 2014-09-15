package au.usyd.va.domain;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name="User")
public class User implements UserDetails {
  
  /**
   * 
   */
  private static final long serialVersionUID = -3904938781686891076L;
  
  @Id
  @Column(name="Username")
  private String username;
  
  @Column(name="Password")
  private String password;
  
  @Column(name="Enabled")
  private boolean enabled;
  
  @Column(name="AccountNonExpired")
  private boolean accountNonExpired;
  
  @Column(name="AccountNonLocked")
  private boolean accountNonLocked;
  
  @Column(name="CredentialsNonExpired")
  private boolean credentialsNonExpired;
  
  @Column(name="role")
  private int role;
  


  public String getUsername() {
    return username;
  }
  public void setUsername(String username) {
    this.username = username;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public boolean isEnabled() {
    return enabled;
  }
  public void setEnabled(boolean enabled) {
    this.enabled = enabled;
  }
  public boolean isAccountNonExpired() {
    return accountNonExpired;
  }
  public void setAccountNonExpired(boolean accountNonExpired) {
    this.accountNonExpired = accountNonExpired;
  }
  public boolean isAccountNonLocked() {
    return accountNonLocked;
  }
  public void setAccountNonLocked(boolean accountNonLocked) {
    this.accountNonLocked = accountNonLocked;
  }
  public boolean isCredentialsNonExpired() {
    return credentialsNonExpired;
  }
  public void setCredentialsNonExpired(boolean credentialsNonExpired) {
    this.credentialsNonExpired = credentialsNonExpired;
  }
  public static long getSerialversionuid() {
    return serialVersionUID;
  }
  
  public void setRole(int role) {
    this.role = role;
  }
  
  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    Collection<Role> auth = new ArrayList<Role>();
    if(role == 0)
      auth.add(new Role("ROLE_USER"));
    if(role == 1)
      auth.add(new Role("ROLE_ADMIN"));
    return auth;
  }
  
  private class Role implements GrantedAuthority{

    private static final long serialVersionUID = 1L;
    String authority;
    
    
    public Role(String authority) {
      this.authority = authority;
    }

    public String getAuthority() {
      return authority;
    }
    
  }
}
