/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author JLo
 */
public class Instances {
    
    int id;
    int classId;
    String dateCreated;
    String dateEdited;
    int editedBy;
    
    ArrayList categories;
    ArrayList teams;

    public Instances(int id, int classId, String dateCreated, String dateEdited, int editedBy, ArrayList categories, ArrayList teams) {
        this.id = id;
        this.classId = classId;
        this.dateCreated = dateCreated;
        this.dateEdited = dateEdited;
        this.editedBy = editedBy;
        this.categories = categories;
        this.teams = teams;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getEditedBy() {
        return editedBy;
    }

    public void setEditedBy(int editedBy) {
        this.editedBy = editedBy;
    }

    public ArrayList getCategories() {
        return categories;
    }

    public void setCategories(ArrayList categories) {
        this.categories = categories;
    }

    public ArrayList getTeams() {
        return teams;
    }

    public void setTeams(ArrayList teams) {
        this.teams = teams;
    }
    
    
    
}
