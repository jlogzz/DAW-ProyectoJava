/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuario;
import data.DBhandler;

/**
 *
 * @author JLo
 */
public class SessionManager extends HttpServlet {

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
        
        String ac = request.getParameter("action");
        String url = "/login.jsp";
        
        if(ac!=null && ac.equals("login")){
            HttpSession session = request.getSession();
            if(session.getAttribute("tries")==null){
                session.setAttribute("tries", 3);
            }
            
            int tries = Integer.parseInt(session.getAttribute("tries").toString());
            
            System.out.println(tries);

            String username = request.getParameter("username");
            String password = request.getParameter("password"); 

            Usuario usuario = DBhandler.getUsuario(username);

            if(usuario!=null){
                if(usuario.validarUsuario(password) && tries > 0){
                    url = "/app.jsp";
                    session.setAttribute("usuario", usuario);
                    session.setAttribute("estatus", true);
                    session.setAttribute("tries", 3);
                    

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    String json = "{\"username\": \""+usuario.getUsername()+"\", \"status\": true}";
                    response.getWriter().write(json);
                }else{
                    session.setAttribute("tries", Integer.parseInt(session.getAttribute("tries").toString())-1);
                    tries = Integer.parseInt(session.getAttribute("tries").toString());
                    System.out.println(tries);
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    String json = "{\"status\": false, \"tries\": "+tries+"}";
                    response.getWriter().write(json);
                }
            }
        }else if(ac!=null && ac.equals("logout")){
            HttpSession session = request.getSession(false);
            if(session != null){
                session.setAttribute("estatus", false);
                session.invalidate();
            }
            
            ServletContext sc=this.getServletContext();
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } 
        else{
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
