<%@include file="./header.jsp" %>

<%@page import="model.Classes"%>
<%@page import="model.Usuario"%>
<%@page import="java.util.ArrayList"%>
        <%
            //Si ya inicio sesion mandalo a index
            if((session.getAttribute("estatus")==null) || session == null){
                    String url = "./login.jsp";
                    response.sendRedirect(url);
            }
            
        %>
        <div class="container">
            <div class="row" style="margin-top: 50px;">
                <div class="row">
                    <button data-target="newClassModal" class="newClassModal-trigger col s12 m8 offset-m2 l6 offset-l3 red lighten-1 white-text waves-effect waves-light btn-large">
                        <h5 class="center-align">NEW USER</h5>
                    </button>
                </div>
                
                <div class="row" id="classesCollection">
                    <%

                        ArrayList users = (ArrayList)request.getAttribute("users");

                        for (int i = 0; i < users.size(); i++) {
                            Usuario us = (Usuario) users.get(i);
                    %>
                    <div class="col s12 m6 l4">
                      <div class="card light-blue darken-3">
                        <div class="card-content white-text">
                          <span class="card-title"><%= us.getUsername() %></span>
                        </div>
                        <div class="card-action" style="font-size: 24px;">
                          <a href='#' class="classDelete" data-id="<%= us.getId() %>" data-name="<%= us.getUsername() %>"><i class="mdi-action-delete"></i></a>
                        </div>
                      </div>
                    </div>
                    <% } %>
                  </div>
            </div>
        </div>
        
        <!-- Modal Structure -->
        <div id="newClassModal" class="modal">
          <div class="modal-content">
            <h4>New User</h4>
            <div class="row">
                <div class="input-field col s12 black-text">
                  <input id="userName" type="text" class="validate">
                  <label for="userName" class="black-text">UserName</label>
                </div>
                <div class="input-field col s12 black-text">
                  <input id="userEmail" type="text" class="validate">
                  <label for="userEmail" class="black-text">Email</label>
                </div>
            </div>
          </div>
          <div class="modal-footer">
            <button id="createUser" class=" modal-action modal-close waves-effect waves-green btn-large">Submit</button>
          </div>
        </div>
        
        <!-- Modal Structure -->
        <div id="updateClassModal" class="modal">
          <div class="modal-content">
            <h4>Update Class</h4>
            <div class="row">
                <div class="input-field col s12 black-text">
                    <input type="hidden" id="updateClassId">
                    <input id="updateClassName" type="text" class="validate">
                    <label for="updateClassName" id="updateClassLabel" class="black-text">Class Name</label>
                </div>
            </div>
          </div>
          <div class="modal-footer">
            <button id="updateClass" class=" modal-action modal-close waves-effect waves-green btn-large">Update</button>
          </div>
        </div>

<%@include file="./footer.jsp" %>