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
import model.Message;
import model.User;

/**
 *
 * @author albertortor00
 */
public class DAOAdmin {

    public List<Message> getMessages() {
        List<Message> messages = new ArrayList();
        PreparedStatement ps;
        ResultSet rs;
        Connection con = new ConnectDB().getConection();

        String query = "select * from Mensaje_Contacto";

        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("nombre");
                String surnames = rs.getString("apellidos");
                String email = rs.getString("email");
                String message = rs.getString("mensaje");

                Message m = new Message(id, name, surnames, email, message);
                messages.add(m);
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

        return messages;
    }

    public int getMessagesNum() {
        int num = 0;
        PreparedStatement ps;
        ResultSet rs;
        Connection con = new ConnectDB().getConection();

        String query = "select count(*) from Mensaje_Contacto";

        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                num = rs.getInt("count(*)");
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

        return num;
    }
    
    public boolean deleteMessage(int messageId) {
        PreparedStatement ps;
        Connection con = new ConnectDB().getConection();

        String query = "delete from Mensaje_Contacto where id=?";

        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, messageId);
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
}
