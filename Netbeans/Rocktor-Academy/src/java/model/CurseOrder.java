/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author albertortor00
 */
public class CurseOrder {
    private int idCurse;
    private String user, orderDate;

    public CurseOrder() {
    }

    public CurseOrder(int idCurse, String user, String orderDate) {
        this.idCurse = idCurse;
        this.user = user;
        this.orderDate = orderDate;
    }

    public int getIdCurse() {
        return idCurse;
    }

    public void setIdCurse(int idCurse) {
        this.idCurse = idCurse;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }
    
    
}
