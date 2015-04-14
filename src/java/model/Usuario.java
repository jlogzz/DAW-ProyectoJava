/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

/**
 *
 * @author JLo
 */
public class Usuario {
    
    int id;
    String username;
    String password;
    int salt;
    
    public Usuario(String u, String p){
        username = u;
        
        Random randomGenerator = new Random();
        salt = randomGenerator.nextInt(1000);
        
        password = md5(p+salt);
    }
    
    public Usuario(String u, String p, int i){
        id = i;
        username = u;
        
        Random randomGenerator = new Random();
        salt = randomGenerator.nextInt(1000);
        
        password = md5(p+salt);
    }
    
    public Usuario(String u){
        username = u;
    }
    
    public String getUsername(){
        return username;
    }
    
    private String getPassword(){
        return password;
    }
    
    public int getId(){
        return id;
    }
    
    public void setId(int i){
        id = i;
    }
    
    public String getTempPassword(String u){
        return md5(u).substring(0, 8);
    }
    
    public void setPassword(String p, int s){
        password = p;
        salt = s;
    }
    
    private int getSalt(){
        return salt;
    }
    
    public boolean validarUsuario(String p){
        if(this.getPassword().equals(md5(p+this.getSalt()))){
            return true;
        }else{
            return false;
        }
    }
    
    public static String md5(String input) {
         
        String md5 = null;
         
        if(null == input) return null;
         
        try {
             
        //Create MessageDigest object for MD5
        MessageDigest digest = MessageDigest.getInstance("MD5");
         
        //Update input string in message digest
        digest.update(input.getBytes(), 0, input.length());
 
        //Converts message digest value in base 16 (hex) 
        md5 = new BigInteger(1, digest.digest()).toString(16);
 
        } catch (NoSuchAlgorithmException e) {
 
            e.printStackTrace();
        }
        return md5;
    }
    
}
