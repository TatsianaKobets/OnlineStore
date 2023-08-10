package by.htp.pazl.bean;

import java.io.Serializable;
import java.util.Objects;

public class User implements Serializable {
    public static final long serialVersionUID = 1L;

    private int userId;
    private String login;
    private String password;
    private String name;
    private String surname;
    private String email;
    private String phone;
    private String address;
    private String state;
    private String roleName;



    public User(int userId, String login, String password, String name, String surname, String email, String phone, String address, String state, String roleName) {
        this.userId = userId;
        this.login = login;
        this.password = password;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.state = state;
        this.roleName = roleName;
    }
    public User(){ }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return userId == user.userId && Objects.equals(login, user.login)
                && Objects.equals(password, user.password)
                && Objects.equals(name, user.name)
                && Objects.equals(surname, user.surname)
                && Objects.equals(email, user.email)
                && Objects.equals(phone, user.phone)
                && Objects.equals(address, user.address)
                && Objects.equals(state, user.state)
                && Objects.equals(roleName, user.roleName);
    }
       @Override
 public int hashCode() {
        return Objects.hash(userId, login, password, name, surname, email, phone, address, state, roleName);
     }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", login='" + login + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", state='" + state + '\'' +
                ", roleName='" + roleName + '\'' +
                '}';
    }
}





