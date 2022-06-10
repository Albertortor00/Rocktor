package test;

import java.util.List;
import model.DAO.DAOUser;
import model.User;

/**
 *
 * @author alber
 */
public class testConnection {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // Prueba de conexión a base de datos extrallendo todos los usuarios.
        List<User> usuarios = new DAOUser().takeUsers();
        
        for (User usuario : usuarios) {
            System.out.println(usuario.toString());
        }
    }
    
}
