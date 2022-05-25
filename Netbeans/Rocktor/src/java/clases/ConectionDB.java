package clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author alber
 */
public class ConectionDB {

    private final String databaseName = "rocktorDB";
//    Configuración local
//    private final String user = "rocktorUser";
//    private final String password = "uPY4wZ8]tWbc1wr3";
    private final String user = "admin";
    private final String password = "admin";
    private final String host = "192.168.0.222:3306";
    private final String url = "jdbc:mysql://" + host + "/" + databaseName;
    private Connection con = null;

    public Connection getConection() {
        try {
            DriverManager.registerDriver(new org.mariadb.jdbc.Driver());
            con = DriverManager.getConnection(this.url, this.user, this.password);
            System.out.println("Conexion establecida con exito");
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la conexion");
            System.out.println(e);
        }
        return con;
    }
    
    public List<User> takeUsers() {
        List<User> usuarios = new LinkedList();
        PreparedStatement ps;
        ResultSet rs;
        Connection con = new ConectionDB().getConection();

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
                String administrador = rs.getString("administrador");
                boolean administradorBoolean = administrador.equals("si");

                User u = new User(nombre, apellidos, email, usuario, contrasena, administradorBoolean);
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
}
