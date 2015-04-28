/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

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

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getClue100() {
        return clue100;
    }

    public void setClue100(int clue100) {
        this.clue100 = clue100;
    }

    public int getClue200() {
        return clue200;
    }

    public void setClue200(int clue200) {
        this.clue200 = clue200;
    }

    public int getClue300() {
        return clue300;
    }

    public void setClue300(int clue300) {
        this.clue300 = clue300;
    }

    public int getClue400() {
        return clue400;
    }

    public void setClue400(int clue400) {
        this.clue400 = clue400;
    }

    public int getClue500() {
        return clue500;
    }

    public void setClue500(int clue500) {
        this.clue500 = clue500;
    }
    
    
    
}
