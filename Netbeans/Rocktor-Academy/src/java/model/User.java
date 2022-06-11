package model;

/**
 *
 * @author alber
 */
public class User {

    private String name, surnames, email, user, pass, role;
    private String birthday;

    public User() {
    }

    public User(String name, String surnames, String email, String user, String pass, String birthday) {
        this.name = name;
        this.surnames = surnames;
        this.email = email;
        this.user = user;
        this.pass = pass;
        this.birthday = birthday;
        this.role = "Alumno";
    }

    public User(String name, String surnames, String email, String user, String pass, String role, String birthday) {
        this.name = name;
        this.surnames = surnames;
        this.email = email;
        this.user = user;
        this.pass = pass;
        this.role = role;
        this.birthday = birthday;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurnames() {
        return surnames;
    }

    public void setSurnames(String surnames) {
        this.surnames = surnames;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

}
