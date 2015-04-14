<%@include file="./header.jsp" %>

<%@page import="model.Classes"%>
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
                        <h5 class="center-align">NEW CLASS</h5>
                    </button>
                </div>
                
                <div class="row" id="classesCollection">
                    <%

                        ArrayList classes = (ArrayList)request.getAttribute("classes");

                        for (int i = 0; i < classes.size(); i++) {
                            Classes cl = (Classes) classes.get(i);
                    %>
                    <div class="col s12 m6 l4">
                      <div class="card light-blue darken-3">
                        <div class="card-content white-text">
                          <span class="card-title"><%= cl.getName() %></span>
                          <p class="center-align"><%= cl.getDateCreated() %></p>
                          <p class="center-align"><%= cl.getDateEdited() %></p>
                          <p class="center-align">Edited By: <%= cl.getEditedBy() %></p>
                        </div>
                        <div class="card-action" style="font-size: 24px;">
                          <a href="#">Clues</a>
                          <a href='#' class="classUpdate" data-id="<%= cl.getId() %>" data-name="<%= cl.getName() %>"><i class="mdi-editor-mode-edit"></i></a>
                          <a href='#' class="classDelete" data-id="<%= cl.getId() %>" data-name="<%= cl.getName() %>"><i class="mdi-action-delete"></i></a>
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
            <h4>New Class</h4>
            <div class="row">
                <div class="input-field col s12 black-text">
                  <input id="className" type="text" class="validate">
                  <label for="className" class="black-text">Class Name</label>
                </div>
            </div>
          </div>
          <div class="modal-footer">
            <button id="createClass" class=" modal-action modal-close waves-effect waves-green btn-large">Submit</button>
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