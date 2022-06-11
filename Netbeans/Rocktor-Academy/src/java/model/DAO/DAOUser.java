package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.ConnectDB;
import model.User;

/**
 *
 * @author alber
 */
public class DAOUser {

    public List<User> takeUsers() {
        List<User> usuarios = new ArrayList();
        PreparedStatement ps;
        ResultSet rs;
        Connection con = new ConnectDB().getConection();

        String query = "select * from Usuario";

        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                String usuario = rs.getString("usuario");
                String contrasena = rs.getString("contraseña");
                String nombre = rs.getString("nombre");
                String apellidos = rs.getString("apellidos");
                String email = rs.getString("email");
                String rol = rs.getString("rol");
                String birthday = rs.getString("fecha_nacimiento");

                User u = new User(nombre, apellidos, email, usuario, contrasena, rol, birthday);
                usuarios.add(u);
            }

        } catch (SQLException e) {
            System.out.println(e);

        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }

        return usuarios;
    }

    public User search(String usu) {
        PreparedStatement ps;
        ResultSet rs;
        Connection con = new ConnectDB().getConection();
        User u = new User();

        String query = "select * from Usuario where usuario=?";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, usu);
            rs = ps.executeQuery();

            if (rs.next()) {
                String usuario = rs.getString("usuario");
                String contrasena = rs.getString("contraseña");
                String nombre = rs.getString("nombre");
                String apellidos = rs.getString("apellidos");
                String email = rs.getString("email");
                String rol = rs.getString("rol");
                String birthday = rs.getString("fecha_nacimiento");

                u = new User(nombre, apellidos, email, usuario, contrasena, rol, birthday);
            }

        } catch (SQLException e) {
            System.out.println(e);

        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }

        return u;

    }

    public boolean signIn(String usuario, String contrasena) {
        PreparedStatement ps;
        ResultSet rs;
        Connection con = new ConnectDB().getConection();

        String query = "select * from Usuario where usuario=? and contraseña=?";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, usuario);
            ps.setString(2, contrasena);
            rs = ps.executeQuery();
            return rs.next();

        } catch (SQLException e) {
            System.out.println(e);
            return false;

        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }

    public boolean signUp(User u) {
        PreparedStatement ps;
        Connection con = new ConnectDB().getConection();

        String query = "insert into Usuario "
                + "(nombre, apellidos, email, usuario, contraseña, fecha_nacimiento, rol) "
                + "values(?,?,?,?,?,?,?)";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, u.getName());
            ps.setString(2, u.getSurnames());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getUser());
            ps.setString(5, u.getPass());
            ps.setString(6, u.getBirthday());
            ps.setString(7, u.getRole());
            ps.execute();
            return true;

        } catch (SQLException e) {
            System.out.println(e);
            return false;

        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }

    public boolean update(User u) {
        PreparedStatement ps;
        Connection con = new ConnectDB().getConection();

        String query = "update Usuario "
                + "set nombre=?, apellidos=?, email=?, usuario=?, contraseña=?, fecha_nacimiento=?, rol=? "
                + "where usuario=?";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, u.getName());
            ps.setString(2, u.getSurnames());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getUser());
            ps.setString(5, u.getPass());
            ps.setString(6, u.getBirthday());
            ps.setString(7, u.getRole());
            ps.setString(8, u.getName());
            ps.execute();
            return true;

        } catch (SQLException e) {
            System.out.println(e);
            return false;

        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }

    public boolean delete(User u) {
        PreparedStatement ps;
        Connection con = new ConnectDB().getConection();

        String query = "delete from Usuario where usuario=?";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, u.getUser());
            ps.execute();
            return true;

        } catch (SQLException e) {
            System.out.println(e);
            return false;

        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }

    public boolean exist(String usuario) {
        PreparedStatement ps;
        ResultSet rs;
        Connection con = new ConnectDB().getConection();

        String query = "select * from Usuario where usuario=?";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, usuario);
            rs = ps.executeQuery();
            return rs.next();

        } catch (SQLException e) {
            System.out.println(e);
            return false;

        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }
}
