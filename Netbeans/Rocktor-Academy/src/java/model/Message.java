/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author albertortor00
 */
public class Message {

    private int id;
    private String name, surnames, email, message;

    public Message() {
    }

    public Message(String name, String surnames, String email, String message) {
        this.name = name;
        this.surnames = surnames;
        this.email = email;
        this.message = message;
    }
    
    public Message(int id, String name, String surnames, String email, String message) {
        this.id = id;
        this.name = name;
        this.surnames = surnames;
        this.email = email;
        this.message = message;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurnames() {
        return surnames;
    }

    public void setSurnames(String surnames) {
        this.surnames = surnames;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
