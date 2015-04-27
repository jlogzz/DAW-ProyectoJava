/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import model.Usuario;
import data.DBhandler;

/**
 *
 * @author JLo
 */
public class Clues {
    
    int id;
    int categoryId;
    String text;
    int points;
    String dateCreated;
    String dateEdited;
    int editedBy;

    public Clues(int id, int categoryId, String text, int points, String dateCreated, String dateEdited, int editedBy) {
        this.id = id;
        this.categoryId = categoryId;
        this.text = text;
        this.points = points;
        this.dateCreated = dateCreated;
        this.dateEdited = dateEdited;
        this.editedBy = editedBy;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getDateEdited() {
        return dateEdited;
    }

    public void setDateEdited(String dateEdited) {
        this.dateEdited = dateEdited;
    }

    public String getEditedBy() {
        Usuario usuario = DBhandler.getUsuario(this.editedBy);
        
        return usuario.getUsername();
    }

    public void setEditedBy(int editedBy) {
        this.editedBy = editedBy;
    }
    
    
    
}
