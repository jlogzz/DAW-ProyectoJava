/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

//import model.Mensaje;
import model.Usuario;
import model.Classes;
import model.Categories;

/**
 *
 * @author JLo
 */
public class DBhandler {

    private static Connection connection;

    public DBhandler() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost/jeopardy", "root", "wazabe123");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    public static void storeMessage(Mensaje mensaje) {
//        try {
//            Statement statement = connection.createStatement();
//            String de = mensaje.getDe();
//            String para = mensaje.getPara();
//            String contenido = mensaje.getContenido();
//            String query = "insert into mensajes (de, para, contenido) values ('" + de + "','" + para + "','" + contenido + "')";
//            statement.executeUpdate(query);
//            statement.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//    }
//
//    public static ArrayList getMessages(String para) {
//        ArrayList list = new ArrayList();
//        try {            
//            Statement statement = connection.createStatement();
//            ResultSet results = statement.executeQuery("SELECT de, para, contenido FROM mensajes where para='"+para+"'");
//            while (results.next()) {
//                String de=results.getString(1);
//                String contenido=results.getString(3);
//                Mensaje mensaje = new Mensaje(de, para, contenido);
//                list.add(mensaje);
//            }
//            statement.close();
//            
//        } catch (SQLException ex) {
//            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }
    
    public static void newUsuario(String username, String password, int salt){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("INSERT into usuario (user, password, salt) VALUES('"+username+"', '"+password+"', '"+salt+"')");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static Usuario getUsuario(String username){
        Usuario usuario;
        try {            
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT username, password, salt, id FROM usuario where username='"+username+"'");
            while (results.next()) {
                usuario = new Usuario(results.getString(1));
                usuario.setPassword(results.getString(2), Integer.parseInt(results.getString(3)));
                usuario.setId(Integer.parseInt(results.getString(4)));
                return usuario;
            }
            statement.close();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
    
    public static Usuario getUsuario(int id){
        Usuario usuario;
        try {            
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT username, password, salt, id FROM usuario where id='"+id+"'");
            while (results.next()) {
                usuario = new Usuario(results.getString(1));
                usuario.setPassword(results.getString(2), Integer.parseInt(results.getString(3)));
                usuario.setId(Integer.parseInt(results.getString(4)));
                return usuario;
            }
            statement.close();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
    
    public static ArrayList getClasses(){
        ArrayList list = new ArrayList();
        try {            
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT * FROM class ORDER BY id DESC");
            while (results.next()) {
                int id = Integer.parseInt(results.getString(1));
                String name = results.getString(2);
                String dateCreated = results.getString(3);
                String dateEdited = results.getString(4);
                int editedBy = Integer.parseInt(results.getString(5));
                Classes cl = new Classes(id, name, dateCreated, dateEdited, editedBy);
                list.add(cl);
            }
            statement.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public static Classes getClass(int cid){
        Classes cl = null;
        try {            
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT * FROM class WHERE id = '"+cid+"'");
            while (results.next()) {
                int id = Integer.parseInt(results.getString(1));
                String name = results.getString(2);
                String dateCreated = results.getString(3);
                String dateEdited = results.getString(4);
                int editedBy = Integer.parseInt(results.getString(5));
                cl = new Classes(id, name, dateCreated, dateEdited, editedBy);
            }
            statement.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cl;
    }
    
    public static void newClass(String name, int by){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("INSERT into class (name, dateCreated, dateEdited, editedBy) VALUES('"+name+"', '"+getFechaActual()+"', '"+getFechaActual()+"', '"+by+"')");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void deleteClass(int id){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("DELETE FROM class WHERE id='"+id+"'");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void updateClass(int id, String name, int by){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("UPDATE class SET name='"+name+"', dateEdited='"+getFechaActual()+"', editedBy='"+by+"' WHERE id='"+id+"'");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    //**************************************//
    // Categories
    //**************************************//
    public static Categories getCategory(int cid){
        Categories cl = null;
        try {            
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT * FROM class WHERE id = '"+cid+"'");
            while (results.next()) {
                int id = Integer.parseInt(results.getString(1));
                String name = results.getString(2);
                String dateCreated = results.getString(3);
                String dateEdited = results.getString(4);
                int editedBy = Integer.parseInt(results.getString(5));
                cl = new Classes(id, name, dateCreated, dateEdited, editedBy);
            }
            statement.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cl;
    }
    
    public static void newCategory(String name, int by){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("INSERT into class (name, dateCreated, dateEdited, editedBy) VALUES('"+name+"', '"+getFechaActual()+"', '"+getFechaActual()+"', '"+by+"')");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void deleteCategory(int id){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("DELETE FROM class WHERE id='"+id+"'");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void updateCategory(int id, String name, int by){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("UPDATE class SET name='"+name+"', dateEdited='"+getFechaActual()+"', editedBy='"+by+"' WHERE id='"+id+"'");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
    private static String getFechaActual() {
        Date ahora = new Date();
        SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy");
        return formateador.format(ahora);
    }
    
}
