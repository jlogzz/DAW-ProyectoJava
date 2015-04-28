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
import model.Clues;
import model.Instances;
import model.InstanceCategories;
import model.InstanceTeams;

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
    
    public static ArrayList getCategories(int cid){
        ArrayList list = new ArrayList();
        try {            
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT * FROM category WHERE classId = '"+cid+"' ORDER BY id DESC");
            while (results.next()) {
                int id = Integer.parseInt(results.getString(1));
                String name = results.getString(2);
                String dateCreated = results.getString(4);
                String dateEdited = results.getString(5);
                int editedBy = Integer.parseInt(results.getString(6));
                Categories cat = new Categories(id, name, cid, dateCreated, dateEdited, editedBy);
                list.add(cat);
            }
            statement.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public static Categories getCategory(int cid){
        Categories cat = null;
        try {            
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT * FROM category WHERE id = '"+cid+"'");
            while (results.next()) {
                int id = Integer.parseInt(results.getString(1));
                String name = results.getString(2);
                String dateCreated = results.getString(4);
                String dateEdited = results.getString(5);
                int editedBy = Integer.parseInt(results.getString(6));
                cat = new Categories(id, name, cid, dateCreated, dateEdited, editedBy);
            }
            statement.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cat;
    }
    
    public static void newCategory(String name, int by, int cid){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("INSERT into category (name, classId, dateCreated, dateEdited, editedBy) VALUES('"+name+"', '"+cid+"', '"+getFechaActual()+"', '"+getFechaActual()+"', '"+by+"')");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void deleteCategory(int id){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("DELETE FROM category WHERE id='"+id+"'");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void updateCategory(int id, String name, int by){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("UPDATE category SET name='"+name+"', dateEdited='"+getFechaActual()+"', editedBy='"+by+"' WHERE id='"+id+"'");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    //**************************************//
    // Clues
    //**************************************//
    
    public static ArrayList getClues(int cid){
        ArrayList list = new ArrayList();
        try {            
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT * FROM clue WHERE categoryId = '"+cid+"' ORDER BY id DESC");
            while (results.next()) {
                int id = Integer.parseInt(results.getString(1));
                int catId = Integer.parseInt(results.getString(2));
                String text = results.getString(3);
                int points = Integer.parseInt(results.getString(4));
                String dateCreated = results.getString(5);
                String dateEdited = results.getString(6);
                int editedBy = Integer.parseInt(results.getString(7));
                Clues cl = new Clues(id, catId, text, points, dateCreated, dateEdited, editedBy);
                list.add(cl);
            }
            statement.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public static Clues getClue(int cid){
        Clues cl = null;
        try {            
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT * FROM clue WHERE id = '"+cid+"'");
            while (results.next()) {
                int id = Integer.parseInt(results.getString(1));
                int catId = Integer.parseInt(results.getString(2));
                String text = results.getString(3);
                int points = Integer.parseInt(results.getString(4));
                String dateCreated = results.getString(5);
                String dateEdited = results.getString(6);
                int editedBy = Integer.parseInt(results.getString(7));
                cl = new Clues(id, catId, text, points, dateCreated, dateEdited, editedBy);
            }
            statement.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cl;
    }
    
    public static void newClue(String text, int points, int by, int cid){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("INSERT into clue (categoryId, text, points, dateCreated, dateEdited, editedBy) VALUES('"+cid+"', '"+text+"', '"+points+"', '"+getFechaActual()+"', '"+getFechaActual()+"', '"+by+"')");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void deleteClue(int id){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("DELETE FROM clue WHERE id='"+id+"'");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void updateClue(int id, String text, int points, int by){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("UPDATE clue SET text='"+text+"', points='"+points+"', dateEdited='"+getFechaActual()+"', editedBy='"+by+"' WHERE id='"+id+"'");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
    //**************************************//
    // Instances
    //**************************************//
    
    public static ArrayList getInstances(){
        ArrayList list = new ArrayList();
        try {            
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT * FROM instancia ORDER BY id DESC");
            while (results.next()) {
                int id = Integer.parseInt(results.getString(1));
                int classId = Integer.parseInt(results.getString(2));
                String dateCreated = results.getString(3);
                String dateEdited = results.getString(4);
                int editedBy = Integer.parseInt(results.getString(5));
                Instances in = new Instances(id, classId, dateCreated, dateEdited, editedBy, getInstanceCategories(id), getInstanceTeams(id));
                list.add(in);
            }
            statement.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public static Instances getInstance(int vid){
        Instances in = null;
        try {            
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT * FROM instancia WHERE id = '"+vid+"'");
            while (results.next()) {
                int id = Integer.parseInt(results.getString(1));
                int classId = Integer.parseInt(results.getString(2));
                String dateCreated = results.getString(3);
                String dateEdited = results.getString(4);
                int editedBy = Integer.parseInt(results.getString(5));
                in = new Instances(id, classId, dateCreated, dateEdited, editedBy, getInstanceCategories(id), getInstanceTeams(id));
            }
            statement.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return in;
    }
    
    public static void newInstance(int by, int cid){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("INSERT into instancia (classId, dateCreated, dateEdited, editedBy) VALUES('"+cid+"', '"+getFechaActual()+"', '"+getFechaActual()+"', '"+by+"')");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void deleteInstance(int id){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("DELETE FROM instancia WHERE id='"+id+"'");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void updateInstance(int id, int cid, int by){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("UPDATE instancia SET classId='"+cid+"', dateEdited='"+getFechaActual()+"', editedBy='"+by+"' WHERE id='"+id+"'");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    //**************************************//
    // InstanceCategories
    //**************************************//
    
    public static ArrayList getInstanceCategories(int iid){
        ArrayList list = new ArrayList();
        try {            
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT * FROM categoriasinstancia WHERE instanciaId='"+iid+"' ORDER BY id DESC");
            while (results.next()) {
                int id = Integer.parseInt(results.getString(1));
                int instanceId = Integer.parseInt(results.getString(2));
                int categoryId = Integer.parseInt(results.getString(3));
                int clue100 = Integer.parseInt(results.getString(4));
                int clue200 = Integer.parseInt(results.getString(5));
                int clue300 = Integer.parseInt(results.getString(6));
                int clue400 = Integer.parseInt(results.getString(7));
                int clue500 = Integer.parseInt(results.getString(8));

                InstanceCategories ic = new InstanceCategories(id, instanceId, categoryId, clue100, clue200, clue300, clue400, clue500);
                list.add(ic);
            }
            statement.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public static void newInstanceCategory(int c100, int c200, int c300, int c400, int c500, int cid, int iid){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("INSERT into categoriasinstancia (instanciaId, categoryId, clue100, clue200, clue300, clue400, clue500) VALUES('"+iid+"', '"+cid+"', '"+c100+"', '"+c200+"', '"+c300+"', '"+c400+"', '"+c500+"')");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void deleteInstanceCategory(int id){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("DELETE FROM categoriasinstancia WHERE id='"+id+"'");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void updateInstanceCategory(int id, String text, int points, int by){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("UPDATE clue SET text='"+text+"', points='"+points+"', dateEdited='"+getFechaActual()+"', editedBy='"+by+"' WHERE id='"+id+"'");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    //**************************************//
    // InstanceTeams
    //**************************************//
    
    public static ArrayList getInstanceTeams(int iid){
        ArrayList list = new ArrayList();
        try {            
            Statement statement = connection.createStatement();
            ResultSet results = statement.executeQuery("SELECT * FROM equiposinstancia WHERE instanciaId='"+iid+"' ORDER BY id DESC");
            while (results.next()) {
                int id = Integer.parseInt(results.getString(1));
                int instanceId = Integer.parseInt(results.getString(2));
                int team = Integer.parseInt(results.getString(3));
                String matricula = results.getString(4);
                int points = Integer.parseInt(results.getString(5));

                InstanceTeams it = new InstanceTeams(id, instanceId, team, matricula, points);
                list.add(it);
            }
            statement.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public static void newInstanceTeam(String matricula, int points, int equipo, int iid){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("INSERT into equiposinstancia (instanciaId, equipo, matricula, points) VALUES('"+iid+"', '"+equipo+"', '"+matricula+"', '"+points+"')");

            statement.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void deleteInstanceTeam(int id){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("DELETE FROM equiposinstancia WHERE id='"+id+"'");

            statement.close();    
        } catch (SQLException ex) {
            Logger.getLogger(DBhandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void updateInstanceTeam(int id, String text, int points, int by){
        try {            
            Statement statement = connection.createStatement();
            statement.executeUpdate("UPDATE clue SET text='"+text+"', points='"+points+"', dateEdited='"+getFechaActual()+"', editedBy='"+by+"' WHERE id='"+id+"'");

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
