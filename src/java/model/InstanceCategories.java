/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import data.DBhandler;
import model.Clues;
import model.Categories;

/**
 *
 * @author JLo
 */
public class InstanceCategories {
    
    int id;
    int instanceId;
    int categoryId;
    int clue100;
    int clue200;
    int clue300;
    int clue400;
    int clue500;

    public InstanceCategories(int id, int instanceId, int categoryId, int clue100, int clue200, int clue300, int clue400, int clue500) {
        this.id = id;
        this.instanceId = instanceId;
        this.categoryId = categoryId;
        this.clue100 = clue100;
        this.clue200 = clue200;
        this.clue300 = clue300;
        this.clue400 = clue400;
        this.clue500 = clue500;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getInstanceId() {
        return instanceId;
    }

    public void setInstanceId(int instanceId) {
        this.instanceId = instanceId;
    }
    
    public String getCategory() {
        return DBhandler.getCategory(this.categoryId).getName();
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public Clues getClue100() {
        return DBhandler.getClue(this.clue100);
    }

    public void setClue100(int clue100) {
        this.clue100 = clue100;
    }

    public Clues getClue200() {
        return DBhandler.getClue(this.clue200);
    }

    public void setClue200(int clue200) {
        this.clue200 = clue200;
    }

    public Clues getClue300() {
        return DBhandler.getClue(this.clue300);
    }

    public void setClue300(int clue300) {
        this.clue300 = clue300;
    }

    public Clues getClue400() {
        return DBhandler.getClue(this.clue400);
    }

    public void setClue400(int clue400) {
        this.clue400 = clue400;
    }

    public Clues getClue500() {
        return DBhandler.getClue(this.clue500);
    }

    public void setClue500(int clue500) {
        this.clue500 = clue500;
    }
    
    
    
}
