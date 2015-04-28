<%@include file="./header.jsp" %>

<%@page import="model.Categories"%>
<%@page import="model.Classes"%>
<%@page import="model.Clues"%>
<%@page import="java.util.ArrayList"%>
        <%
            //Si ya inicio sesion mandalo a index
            if((session.getAttribute("estatus")==null) || session == null){
                    String url = "./login.jsp";
                    response.sendRedirect(url);
            }
            
            Categories ct = (Categories)request.getAttribute("category");
            
        %>
        <div class="container">
            <div class="row" style="margin-top: 50px;">
                <div class="row">
                    <h1 class="center-align">Category: <%= ct.getName() %></h1>
                </div>
                <div class="row">
                    <button data-target="newClueModal" class="newClassModal-trigger col s12 m8 offset-m2 l6 offset-l3 red lighten-1 white-text waves-effect waves-light btn-large">
                        <h5 class="center-align">NEW CLUE</h5>
                    </button>
                </div>
                
                <div class="row" id="classesCollection">
                    <%

                        ArrayList clues = (ArrayList)request.getAttribute("clues");

                        if(clues!=null)
                        for (int i = 0; i < clues.size(); i++) {
                            Clues cl = (Clues) clues.get(i);
                    %>
                    <div class="col s12 m6 l4">
                      <div class="card light-blue darken-3">
                        <div class="card-content white-text">
                          <span class="card-title"><%= cl.getText() %></span>
                          <p class="center-align">Points: <%= cl.getPoints() %></p>
                          <p class="center-align"><%= cl.getDateCreated() %></p>
                          <p class="center-align"><%= cl.getDateEdited() %></p>
                          <p class="center-align">Edited By: <%= cl.getEditedBy() %></p>
                        </div>
                        <div class="card-action" style="font-size: 24px;">
                          <a href='#' class="clueUpdate" data-cid="<%= cl.getCategoryId() %>" data-id="<%= cl.getId() %>" data-text="<%= cl.getText() %>"  data-points="<%= cl.getPoints() %>"><i class="mdi-editor-mode-edit"></i></a>
                          <a href='#' class="clueDelete" data-cid="<%= cl.getCategoryId() %>" data-id="<%= cl.getId() %>" data-text="<%= cl.getText() %>"><i class="mdi-action-delete"></i></a>
                        </div>
                      </div>
                    </div>
                    <% } %>
                  </div>
            </div>
        </div>
        
        <!-- Modal Structure -->
        <div id="newClueModal" class="modal" style="height: 550px;">
          <div class="modal-content">
            <h4>New Clue</h4>
            <div class="row">
                <div class="input-field col s12 black-text">
                  <input id="clueText" type="text" class="validate">
                  <label for="clueText" class="black-text">Clue Text</label>
                </div>
                <div class="input-field col s12 black-text">
                    <select id="cluePoints">
                        <option value="" disabled selected>Choose your option</option>
                        <option value="100">100</option>
                        <option value="200">200</option>
                        <option value="300">300</option>
                        <option value="400">400</option>
                        <option value="500">500</option>
                    </select>
                    <label for="cluePoints" class="black-text">Points</label>
                </div>
            </div>
          </div>
          <div class="modal-footer">
              <button id="createClue" data-cid="<%= request.getAttribute("cid") %>" class=" modal-action modal-close waves-effect waves-green btn-large">Submit</button>
          </div>
        </div>
        
        <!-- Modal Structure -->
        <div id="updateClueModal" class="modal" style="height: 550px;">
          <div class="modal-content">
            <h4>Update Clue</h4>
            <div class="row">
                <div class="input-field col s12 black-text">
                  <input type="hidden" id="updateClueId" >
                  <input id="updateClueText" type="text" class="validate">
                  <label for="updateClueText" class="black-text">Clue Text</label>
                </div>
                <div class="input-field col s12 black-text point-select">
                    <select id="updateCluePoints">
                        <option value="" disabled selected>Choose your option</option>
                        <option id="p100" value="100">100</option>
                        <option id="p200" value="200">200</option>
                        <option id="p300" value="300">300</option>
                        <option id="p400" value="400">400</option>
                        <option id="p500" value="500">500</option>
                    </select>
                    <label for="updateCluePoints" class="black-text">Points</label>
                </div>
            </div>
          </div>
          <div class="modal-footer">
            <button id="updatesClue" data-cid="<%= request.getAttribute("cid") %>" class=" modal-action modal-close waves-effect waves-green btn-large">Update</button>
          </div>
        </div>

<%@include file="./footer.jsp" %>