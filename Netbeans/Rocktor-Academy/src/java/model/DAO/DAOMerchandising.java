package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.ConnectDB;
import model.Merchandising;
import model.MerchandisingOrder;

/**
 *
 * @author albertortor00
 */
public class DAOMerchandising {
    public List<Merchandising> getMerchandisings() {
        List<Merchandising> merchandisings = new ArrayList();
        PreparedStatement ps;
        ResultSet rs;
        Connection con = new ConnectDB().getConection();

        String query = "select * from Merchandising";

        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("nombre");
                String image = rs.getString("imagen");
                double price = rs.getDouble("precio");

                Merchandising m = new Merchandising(id, name, image, price);
                merchandisings.add(m);
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

        return merchandisings;
    }

    public Merchandising search(String idSearched) {
        PreparedStatement ps;
        ResultSet rs;
        Connection con = new ConnectDB().getConection();
        Merchandising m = new Merchandising();

        String query = "select * from Merchandising where id=?";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, idSearched);
            rs = ps.executeQuery();

            if (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("nombre");
                String image = rs.getString("imagen");
                double price = rs.getDouble("precio");

                m = new Merchandising(id, name, image, price);
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


    public boolean add(Merchandising m) {
        PreparedStatement ps;
        Connection con = new ConnectDB().getConection();
        
        String query = "insert into Merchandising "
                + "(id, nombre, imagen, precio) "
                + "values(?,?,?,?)";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, m.getId());
            ps.setString(2, m.getName());
            ps.setString(3, m.getImage());
            ps.setDouble(4, m.getPrice());
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

    public boolean update(Merchandising m, String idSearched) {
        PreparedStatement ps;
        Connection con = new ConnectDB().getConection();

        String query = "update Merchandising "
                + "set id=?, nombre=?, imagen=?, precio=? "
                + "where id=?";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, m.getId());
            ps.setString(2, m.getName());
            ps.setString(3, m.getImage());
            ps.setDouble(4, m.getPrice());
            ps.setString(5, idSearched);
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

    public boolean delete(String id) {
        PreparedStatement ps;
        Connection con = new ConnectDB().getConection();

        String query = "delete from Merchandising where id=?";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, id);
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
    
    public boolean order(MerchandisingOrder mo) {
        PreparedStatement ps;
        Connection con = new ConnectDB().getConection();
        
        String query = "insert into Merchandising_Adquirido "
                + "(id_Merchandising, usuario_usuario, fecha_compra) "
                + "values(?,?,?)";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, mo.getIdMerchandising());
            ps.setString(2, mo.getUser());
            ps.setString(3, mo.getOrderDate());
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
