/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author alber
 */
public class ConnectDB {
//    #############################################################################
//    ############################ CONFIGURACIÓN LOCAL ############################
//    #############################################################################
    
    private final String databaseName = "rocktorDB";
    private final String user = "rocktorUser";
    private final String password = "uPY4wZ8]tWbc1wr3";
    private final String host = "localhost:3306";
    
    // No es necesario a partir de la versión mysql-connector-java 5.1.39 en adelante, sin incluir la misma.
    private final String timeSolution = "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    
    private final String url = "jdbc:mysql://" + host + "/" + databaseName + timeSolution;

//    #############################################################################
//    #############################################################################
//    #############################################################################

// Configuración para la conexión remota desde Sobremesa de casa.    
//    private final String databaseName = "rocktorDB";
//    private final String user = "admin";
//    private final String password = "admin";
//    private final String host = "192.168.0.222:3306";
//    private final String url = "jdbc:mysql://" + host + "/" + databaseName;
    
    private Connection con = null;

    public Connection getConection() {
        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            con = DriverManager.getConnection(this.url, this.user, this.password);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return con;
    }
}
