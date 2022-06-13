/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author albertortor00
 */
public class MerchandisingOrder {
    private String user, idMerchandising, orderDate;

    public MerchandisingOrder() {
    }

    public MerchandisingOrder(String user, String idMerchandising, String orderDate) {
        this.user = user;
        this.idMerchandising = idMerchandising;
        this.orderDate = orderDate;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getIdMerchandising() {
        return idMerchandising;
    }

    public void setIdMerchandising(String idMerchandising) {
        this.idMerchandising = idMerchandising;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    @Override
    public String toString() {
        return "MerchandisingOrder{" + "user=" + user + ", idMerchandising=" + idMerchandising + ", orderDate=" + orderDate + '}';
    }
    
    
}
