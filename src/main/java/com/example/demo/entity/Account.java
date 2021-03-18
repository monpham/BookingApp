package com.example.demo.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "account")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "account_id")
    private int accountId;
    @Column(name = "username")
    private String username;
    @Column(name = "password")
    private String password;

    @Column(name = "enabled")
    private boolean enabled;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "account_role",
            joinColumns = {@JoinColumn(name = "account_id")},
            inverseJoinColumns = {@JoinColumn(name = "role_id")})
    private List<Role> roles;

    @OneToOne(mappedBy = "account")
    private Guest guest;

    public Guest getGuest() {
        return guest;
    }

    public void setGuest(Guest guest) {
        this.guest = guest;
    }

    public Account() {
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

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

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
}
