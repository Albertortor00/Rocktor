package clases;

/**
 *
 * @author alber
 */
public class User {
    private String name, surnames, email, user, pass;
    private boolean admin;

    public User() {
    }

    public User(String name, String surnames, String email, String user, String pass) {
        this.name = name;
        this.surnames = surnames;
        this.email = email;
        this.user = user;
        this.pass = pass;
        
        // De manera predeterminada, los usuarios no serán administradores
        this.admin = false;
    }
    
    public User(String name, String surnames, String email, String user, String pass, boolean admin) {
        this.name = name;
        this.surnames = surnames;
        this.email = email;
        this.user = user;
        this.pass = pass;
        this.admin = admin;
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

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    @Override
    public String toString() {
        return "User{" + "name=" + name + ", surnames=" + surnames + ", email=" + email + ", user=" + user + ", pass=" + pass + ", admin=" + admin + '}';
    }
    
    
}
