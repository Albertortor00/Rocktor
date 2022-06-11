/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.ConnectDB;
import model.ContactMessage;

/**
 *
 * @author albertortor00
 */
public class DAOContactMessage {
    public List<ContactMessage> takeMessages() {
        List<ContactMessage> mensajes = new ArrayList();
        PreparedStatement ps;
        ResultSet rs;
        Connection con = new ConnectDB().getConection();

        String query = "select * from Mensajes_Contacto";

        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                String name = rs.getString("nombre");
                String surnames = rs.getString("apellidos");
                String email = rs.getString("email");
                String message = rs.getString("mensaje");

                ContactMessage m = new ContactMessage(name, surnames, email, message);
                mensajes.add(m);
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

        return mensajes;
    }

    public ContactMessage search(String mail) {
        PreparedStatement ps;
        ResultSet rs;
        Connection con = new ConnectDB().getConection();
        ContactMessage m = new ContactMessage();

        String query = "select * from Mensaje_Contacto where email=?";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, mail);
            rs = ps.executeQuery();

            if (rs.next()) {
                String name = rs.getString("nombre");
                String surnames = rs.getString("apellidos");
                String email = rs.getString("email");
                String message = rs.getString("mensaje");

                m = new ContactMessage(name, surnames, email, message);
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

        return m;

    }

    public boolean sendMessage(ContactMessage m) {
        PreparedStatement ps;
        Connection con = new ConnectDB().getConection();

        String query = "insert into Mensaje_Contacto "
                + "(nombre, apellidos, email, mensaje) "
                + "values(?,?,?,?)";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, m.getName());
            ps.setString(2, m.getSurnames());
            ps.setString(3, m.getEmail());
            ps.setString(4, m.getMessage());
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

    public boolean update(ContactMessage cM) {
        PreparedStatement ps;
        Connection con = new ConnectDB().getConection();

        String query = "update Mensaje_Contacto "
                + "set nombre=?, apellidos=?, email=?, mensaje=? "
                + "where email=?";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, cM.getName());
            ps.setString(2, cM.getSurnames());
            ps.setString(3, cM.getEmail());
            ps.setString(4, cM.getMessage());
            ps.setString(5, cM.getEmail());
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

    public boolean delete(String mail) {
        PreparedStatement ps;
        Connection con = new ConnectDB().getConection();

        String query = "delete from Mensaje_Contacto where email=?";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, mail);
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

    public boolean exist(String mail) {
        PreparedStatement ps;
        ResultSet rs;
        Connection con = new ConnectDB().getConection();

        String query = "select * from Mensaje_Contacto where email=?";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, mail);
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
