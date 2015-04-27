<%@include file="./header.jsp" %>

<%@page import="model.Categories"%>
<%@page import="model.Classes"%>
<%@page import="java.util.ArrayList"%>
        <%
            //Si ya inicio sesion mandalo a index
            if((session.getAttribute("estatus")==null) || session == null){
                    String url = "./login.jsp";
                    response.sendRedirect(url);
            }
            
            Classes cla = (Classes)request.getAttribute("class");
            
        %>
        <div class="container">
            <div class="row" style="margin-top: 50px;">
                <div class="row">
                    <h1 class="center-align">Class: <%= cla.getName() %></h1>
                </div>
                <div class="row">
                    <button data-target="newClassModal" class="newClassModal-trigger col s12 m8 offset-m2 l6 offset-l3 red lighten-1 white-text waves-effect waves-light btn-large">
                        <h5 class="center-align">NEW CATEGORY</h5>
                    </button>
                </div>
                
                <div class="row" id="classesCollection">
                    <%

                        ArrayList categories = (ArrayList)request.getAttribute("categories");

                        if(categories!=null)
                        for (int i = 0; i < categories.size(); i++) {
                            Categories cat = (Categories) categories.get(i);
                    %>
                    <div class="col s12 m6 l4">
                      <div class="card light-blue darken-3">
                        <div class="card-content white-text">
                          <span class="card-title"><%= cat.getName() %></span>
                          <p class="center-align"><%= cat.getDateCreated() %></p>
                          <p class="center-align"><%= cat.getDateEdited() %></p>
                          <p class="center-align">Edited By: <%= cat.getEditedBy() %></p>
                        </div>
                        <div class="card-action" style="font-size: 24px;">
                          <a href="./Controlador?model=clue&action=read&categoryId=<%= cat.getId() %>">Clues</a>
                          <a href='#' class="classUpdate" data-cid="<%= cat.getClassId() %>" data-id="<%= cat.getId() %>" data-name="<%= cat.getName() %>"><i class="mdi-editor-mode-edit"></i></a>
                          <a href='#' class="categoryDelete" data-cid="<%= cat.getClassId() %>" data-id="<%= cat.getId() %>" data-name="<%= cat.getName() %>"><i class="mdi-action-delete"></i></a>
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
            <h4>New Category</h4>
            <div class="row">
                <div class="input-field col s12 black-text">
                  <input id="categoryName" type="text" class="validate">
                  <label for="categoryName" class="black-text">Category Name</label>
                </div>
            </div>
          </div>
          <div class="modal-footer">
              <button id="createCategory" data-cid="<%= request.getAttribute("cid") %>" class=" modal-action modal-close waves-effect waves-green btn-large">Submit</button>
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
            <button id="updateCategory" data-cid="<%= request.getAttribute("cid") %>" class=" modal-action modal-close waves-effect waves-green btn-large">Update</button>
          </div>
        </div>

<%@include file="./footer.jsp" %>