/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import data.DBhandler;
import java.util.ArrayList;
import model.Classes;

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
    int step1;
    
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
        step1 = 0;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public int getClassId(){
        return this.classId;
    }

    public String getClassName() {
        return DBhandler.getClass(this.classId).getName();
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

    public int getStep1() {
        return step1;
    }

    public void setStep1(int step1) {
        this.step1 = step1;
    }
    
    
    
}
