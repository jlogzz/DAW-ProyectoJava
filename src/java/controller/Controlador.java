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
import data.DBhandler;
import java.util.ArrayList;
import static java.util.Collections.list;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

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
                
            }else if(action.equals("read")){
                
                int cid = Integer.parseInt(request.getParameter("classId"));
                Classes cl = DBhandler.getClass(cid);
                
                request.setAttribute("class", cl);
                url = "/categories.jsp";
            }else if(action.equals("update")){
                
            }else if(action.equals("delete")){
                
            }
            
        }else if(model.equals("clue")){
            //CRUD
            if(action.equals("create")){
                
            }else if(action.equals("read")){
                
            }else if(action.equals("update")){
                
            }else if(action.equals("delete")){
                
            }
            
        }else if(model.equals("instance")){
            //CRUD
            if(action.equals("create")){
                
            }else if(action.equals("read")){
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
