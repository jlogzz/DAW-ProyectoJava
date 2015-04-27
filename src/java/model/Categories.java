/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import data.DBhandler;
import model.Classes;
import model.Usuario;

/**
 *
 * @author JLo
 */
public class Categories {
    
    int id;
    String name;
    int classId;
    String dateCreated;
    String dateEdited;
    int editedBy;
    
    public Categories(int i, String n, int cid, String dc, String de, int by){
        id = i;
        name = n;
        classId = cid;
        dateCreated = dc;
        dateEdited = de;
        editedBy = by;
    }
    
    public Classes getParent(){
        return DBhandler.getClass(classId);
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

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
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
