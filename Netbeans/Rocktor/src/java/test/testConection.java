/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package test;

import clases.ConectionDB;
import clases.User;
import java.sql.Connection;
import java.util.List;

/**
 *
 * @author alber
 */
public class testConection {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Connection con = new ConectionDB().getConection();
        List<User> usuarios = new ConectionDB().takeUsers();
        
        for (User usuario : usuarios) {
            System.out.println(usuario.toString());
        }
    }
    
}
