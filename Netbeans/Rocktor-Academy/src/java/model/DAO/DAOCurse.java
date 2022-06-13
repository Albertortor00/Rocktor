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
import model.Curse;
import model.CurseOrder;

/**
 *
 * @author albertortor00
 */
public class DAOCurse {
    public List<Curse> getCurses() {
        List<Curse> curses = new ArrayList();
        PreparedStatement ps;
        ResultSet rs;
        Connection con = new ConnectDB().getConection();

        String query = "select * from Curso";

        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("titulo");
                String description = rs.getString("descripcion");
                String author = rs.getString("autor");
                String image = rs.getString("imagen");
                int duration = rs.getInt("duracion");
                double price = rs.getDouble("precio");

                Curse c = new Curse(id, title, description, author, image, duration, price);
                curses.add(c);
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

        return curses;
    }

    public Curse search(int idSearched) {
        PreparedStatement ps;
        ResultSet rs;
        Connection con = new ConnectDB().getConection();
        Curse c = new Curse();

        String query = "select * from Curso where id=?";

        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, idSearched);
            rs = ps.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("titulo");
                String description = rs.getString("descripcion");
                String author = rs.getString("autor");
                String image = rs.getString("imagen");
                int duration = rs.getInt("duracion");
                double price = rs.getDouble("precio");

                c = new Curse(id, title, description, author, image, duration, price);
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

        return c;

    }


    public boolean add(Curse c, String usuAuthor) {
        PreparedStatement ps;
        Connection con = new ConnectDB().getConection();
        
        String query = "insert into Curso "
                + "(titulo, descripcion, autor, usuario_autor, imagen, duracion, precio) "
                + "values(?,?,?,?,?,?,?)";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, c.getTitle());
            ps.setString(2, c.getDescription());
            ps.setString(3, c.getAuthor());
            ps.setString(4, usuAuthor);
            ps.setString(5, c.getImage());
            ps.setInt(6, c.getDuration());
            ps.setDouble(7, c.getPrice());
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

    public boolean update(Curse c, int idUpdated) {
        PreparedStatement ps;
        Connection con = new ConnectDB().getConection();

        String query = "update Curse "
                + "set titulo=?, descripcion=?, imagen=?, duración=?, precio=? "
                + "where id=?";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, c.getTitle());
            ps.setString(2, c.getDescription());
            ps.setString(3, c.getImage());
            ps.setInt(4, c.getDuration());
            ps.setDouble(5, c.getPrice());
            ps.setInt(6, idUpdated);
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

    public boolean delete(int id) {
        PreparedStatement ps;
        Connection con = new ConnectDB().getConection();

        String query = "delete from Curso where id=?";

        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
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
    
    public boolean order(CurseOrder co) {
        PreparedStatement ps;
        Connection con = new ConnectDB().getConection();
        
        String query = "insert into Curso_Adquirido "
                + "(id_curso, usuario_usuario, fecha_compra) "
                + "values(?,?,?)";

        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, co.getIdCurse());
            ps.setString(2, co.getUser());
            ps.setString(3, co.getOrderDate());
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
