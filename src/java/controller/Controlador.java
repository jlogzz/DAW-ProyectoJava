/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Usuario;
import model.Classes;
import model.Categories;
import data.DBhandler;
import java.util.ArrayList;
import static java.util.Collections.list;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.Instances;

/**
 *
 * @author JLo
 */
public class Controlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String model = request.getParameter("model");
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
        
        String url = "./app.jsp";
        
        if(model.equals("class")){
            //CRUD
            if(action.equals("create")){
                
                String name = request.getParameter("name");
                Usuario usuario = (Usuario)session.getAttribute("usuario");
                int by = usuario.getId();
                DBhandler.newClass(name, by);
            }else if(action.equals("read")){
                
                url = "/classes.jsp";
                ArrayList list = DBhandler.getClasses();
                request.setAttribute("classes", list);
            }else if(action.equals("update")){
                
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                Usuario usuario = (Usuario)session.getAttribute("usuario");
                int by = usuario.getId();
                DBhandler.updateClass(id, name, by);
            }else if(action.equals("delete")){
                
                int id = Integer.parseInt(request.getParameter("id"));
                DBhandler.deleteClass(id);
            }
            
        }else if(model.equals("category")){
            //CRUD
            if(action.equals("create")){
                String name = request.getParameter("name");
                Usuario usuario = (Usuario)session.getAttribute("usuario");
                int by = usuario.getId();
                int cid = Integer.parseInt(request.getParameter("cid"));
                DBhandler.newCategory(name, by, cid);
            }else if(action.equals("read")){
                
                int cid = Integer.parseInt(request.getParameter("classId"));
                ArrayList list = DBhandler.getCategories(cid);
                Classes cl = DBhandler.getClass(cid);
                
                request.setAttribute("class", cl);
                request.setAttribute("categories", list);
                request.setAttribute("cid", cid);
                
                url = "/categories.jsp";
            }else if(action.equals("update")){
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                Usuario usuario = (Usuario)session.getAttribute("usuario");
                int by = usuario.getId();
                DBhandler.updateCategory(id, name, by);
            }else if(action.equals("delete")){
                int id = Integer.parseInt(request.getParameter("id"));
                DBhandler.deleteCategory(id);
            }
            
        }else if(model.equals("clue")){
            //CRUD
            if(action.equals("create")){
                String text = request.getParameter("text");
                int points = Integer.parseInt(request.getParameter("points"));
                Usuario usuario = (Usuario)session.getAttribute("usuario");
                int by = usuario.getId();
                int cid = Integer.parseInt(request.getParameter("cid"));
                DBhandler.newClue(text, points, by, cid);
            }else if(action.equals("read")){
                int cid = Integer.parseInt(request.getParameter("categoryId"));
                ArrayList list = DBhandler.getClues(cid);
                Categories ct = DBhandler.getCategory(cid);
                
                request.setAttribute("category", ct);
                request.setAttribute("clues", list);
                request.setAttribute("cid", cid);
                
                url = "/clues.jsp";
            }else if(action.equals("update")){
                int id = Integer.parseInt(request.getParameter("id"));
                String text = request.getParameter("text");
                int points = Integer.parseInt(request.getParameter("points"));
                Usuario usuario = (Usuario)session.getAttribute("usuario");
                int by = usuario.getId();
                DBhandler.updateClue(id, text, points, by);
            }else if(action.equals("delete")){
                int id = Integer.parseInt(request.getParameter("id"));
                DBhandler.deleteClue(id);
            }
            
        }else if(model.equals("instance")){
            //CRUD
            if(action.equals("create")){
                int cid = Integer.parseInt(request.getParameter("classId"));
                
                Usuario usuario = (Usuario)session.getAttribute("usuario");
                int by = usuario.getId();
                
                DBhandler.newInstance(by, cid);
            }else if(action.equals("read")){
                ArrayList list = DBhandler.getInstances();
                ArrayList classes = DBhandler.getClasses();
                
                request.setAttribute("instances", list);
                request.setAttribute("classes", classes);
                url = "/app.jsp";
            }else if(action.equals("update")){
                
            }else if(action.equals("delete")){
                
            }
            
        }else if(model.equals("report")){
            //CRUD
            if(action.equals("create")){
                
            }else if(action.equals("read")){
                
            }else if(action.equals("update")){
                
            }else if(action.equals("delete")){
                
            }
            
        }else if(model.equals("play")){
            //CRUD
            if(action.equals("read")){
                int vid = Integer.parseInt(request.getParameter("instance"));
                Instances ins = DBhandler.getInstance(vid);
                System.out.println(ins.getClassId());
                ArrayList cat = DBhandler.getCategories(ins.getClassId());
                if(cat!=null)
                request.setAttribute("categories", cat);
                request.setAttribute("instance", ins.getId());
                url = "/play.jsp";
            }else if(action.equals("step1")){
                int id = Integer.parseInt(request.getParameter("id"));
                int cat1, cat2, cat3, cat4;
                
                int cl11=0, cl21=0, cl31=0, cl41=0;
                int cl12=0, cl22=0, cl32=0, cl42=0;
                int cl13=0, cl23=0, cl33=0, cl43=0;
                int cl14=0, cl24=0, cl34=0, cl44=0;
                int cl15=0, cl25=0, cl35=0, cl45=0;
                
                if(!request.getParameter("c11").equals(""))
                cl11 = Integer.parseInt(request.getParameter("c11"));
                if(!request.getParameter("c12").equals(""))
                cl12 = Integer.parseInt(request.getParameter("c12"));
                if(!request.getParameter("c13").equals(""))
                cl13 = Integer.parseInt(request.getParameter("c13"));
                if(!request.getParameter("c14").equals(""))
                cl14 = Integer.parseInt(request.getParameter("c14"));
                if(!request.getParameter("c15").equals(""))
                cl15 = Integer.parseInt(request.getParameter("c15"));
                
                if(!request.getParameter("c21").equals(""))
                cl21 = Integer.parseInt(request.getParameter("c21"));
                if(!request.getParameter("c22").equals(""))
                cl22 = Integer.parseInt(request.getParameter("c22"));
                if(!request.getParameter("c23").equals(""))
                cl23 = Integer.parseInt(request.getParameter("c23"));
                if(!request.getParameter("c24").equals(""))
                cl24 = Integer.parseInt(request.getParameter("c24"));
                if(!request.getParameter("c25").equals(""))
                cl25 = Integer.parseInt(request.getParameter("c25"));
                    
                if(!request.getParameter("c31").equals(""))
                cl31 = Integer.parseInt(request.getParameter("c31"));
                if(!request.getParameter("c32").equals(""))
                cl32 = Integer.parseInt(request.getParameter("c32"));
                if(!request.getParameter("c33").equals(""))
                cl33 = Integer.parseInt(request.getParameter("c33"));
                if(!request.getParameter("c34").equals(""))
                cl34 = Integer.parseInt(request.getParameter("c34"));
                if(!request.getParameter("c35").equals(""))
                cl35 = Integer.parseInt(request.getParameter("c35"));
                
                if(!request.getParameter("c41").equals(""))
                cl41 = Integer.parseInt(request.getParameter("c41"));
                if(!request.getParameter("c42").equals(""))
                cl42 = Integer.parseInt(request.getParameter("c42"));
                if(!request.getParameter("c43").equals(""))
                cl43 = Integer.parseInt(request.getParameter("c43"));
                if(!request.getParameter("c44").equals(""))
                cl44 = Integer.parseInt(request.getParameter("c44"));
                if(!request.getParameter("c45").equals(""))
                cl45 = Integer.parseInt(request.getParameter("c45"));
                
                String s1, s2, s3, s4, s5, s6, s7, s8;
                
                cat1 = Integer.parseInt(request.getParameter("vcat1"));
                cat2 = Integer.parseInt(request.getParameter("vcat2"));
                cat3 = Integer.parseInt(request.getParameter("vcat3"));
                cat4 = Integer.parseInt(request.getParameter("vcat4"));
                
                s1 = request.getParameter("stud1");
                s2 = request.getParameter("stud2");
                s3 = request.getParameter("stud3");
                s4 = request.getParameter("stud4");
                
                s5 = request.getParameter("stud5");
                s6 = request.getParameter("stud6");
                s7 = request.getParameter("stud7");
                s8 = request.getParameter("stud8");
                
                
                
                DBhandler.newInstanceCategory(cl11, cl12, cl13, cl14, cl15, cat1, id);
                DBhandler.newInstanceCategory(cl21, cl22, cl23, cl24, cl25, cat2, id);
                DBhandler.newInstanceCategory(cl31, cl32, cl33, cl34, cl35, cat3, id);
                DBhandler.newInstanceCategory(cl41, cl42, cl43, cl44, cl45, cat4, id);
                
                System.out.println(s1);
                
                if(!s1.equals(""))
                    DBhandler.newInstanceTeam(s1, 0, 1, id);
                if(!s2.equals(""))
                    DBhandler.newInstanceTeam(s2, 0, 1, id);
                if(!s3.equals(""))
                    DBhandler.newInstanceTeam(s3, 0, 1, id);
                if(!s4.equals(""))
                    DBhandler.newInstanceTeam(s4, 0, 1, id);
                
                if(!s5.equals(""))
                    DBhandler.newInstanceTeam(s5, 0, 2, id);
                if(!s6.equals(""))
                    DBhandler.newInstanceTeam(s6, 0, 2, id);
                if(!s7.equals(""))
                    DBhandler.newInstanceTeam(s7, 0, 2, id);
                if(!s8.equals(""))
                    DBhandler.newInstanceTeam(s8, 0, 2, id);
                
            }else if(action.equals("step2")){
                
            }
            
        }
        
        if(action.equals("read")){
            ServletContext sc=this.getServletContext();
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
