
<%@include file="./header.jsp" %>


<%@page import="model.Instances"%>
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
<!--                <div class="row">
                    <div class="col s12 m12 l12">
                        <div class="card-panel red lighten-1 input-field white-text">
                            <input id="search" placeholder="Search..." type="search" required> 
                        </div>
                    </div>
                </div>-->
                
                <div class="row">
                    <%

                        ArrayList instances = (ArrayList)request.getAttribute("instances");

                        if(instances!=null)
                        for (int i = 0; i < instances.size(); i++) {
                            Instances ins = (Instances) instances.get(i);
                    %>
                    <div class="col s12 m6 l4">
                      <div class="card light-blue darken-3">
                        <div class="card-content white-text">
                          <span class="card-title"><%= ins.getClassName() %></span>
                          <p class="center-align"><%= ins.getDateCreated() %></p>
                        </div>
                        <div class="card-action" style="font-size: 24px;">
                          <a href="./Controlador?model=play&action=read&instance=<%= ins.getId() %>">PLAY</a>
                          <a href='#'><i class="mdi-editor-mode-edit"></i></a>
                          <a href='#'><i class="mdi-action-delete"></i></a>
                        </div>
                      </div>
                    </div>
                    <% } %>
                  </div>
            </div>
            <div class="fixed-action-btn" style="bottom: 45px; right: 24px;">
                <a class="btn-floating btn-large red">
                  <i class="large mdi-navigation-menu"></i>
                </a>
                <ul>
                    <li><a href="./Controlador?model=users&action=read" class="btn-floating deep-purple lighten-1 tooltipped" data-position="left" data-delay="50" data-tooltip="Users">
                          <i class="large mdi-social-people"></i>
                      </a></li>
                    <li><a href="./Controlador?model=class&action=read" class="btn-floating yellow darken-1 tooltipped" data-position="left" data-delay="50" data-tooltip="Classes">
                            <i class="large mdi-action-class"></i>
                        </a></li>
                    <li><a href="./Controlador?model=reports&action=read" class="btn-floating green tooltipped" data-position="left" data-delay="50" data-tooltip="Reports">
                            <i class="large mdi-editor-insert-chart"></i>
                        </a></li>
                    <li><a href="#newClassModal" data-target="newClassModal" class="newClassModal-trigger btn-floating blue tooltipped" data-position="left" data-delay="50" data-tooltip="Create Instance">
                            <i class="large mdi-action-note-add"></i>
                        </a></li>
                </ul>
            </div>
        </div>
                  
        <!-- Modal Structure -->
        <div id="newClassModal" class="modal" style="height: 900px;">
          <div class="modal-content">
            <h4>New Instance</h4>
            <div class="row">
                <div class="input-field col s12">
                    <select class="browser-default">
                      <option value="" disabled selected>Choose your option</option>
                      <%

                        ArrayList classes = (ArrayList)request.getAttribute("classes");

                        if(classes!=null)
                        for (int i = 0; i < classes.size(); i++) {
                            Classes cl = (Classes) classes.get(i);
                    %>
                      <option value="<%= cl.getId() %>"><%= cl.getName() %></option>
                      <% } %>
                    </select>
                    
                </div>
            </div>
          </div>
          <div class="modal-footer">
              <button id="createInstance" class=" modal-action modal-close waves-effect waves-green btn-large">Submit</button>
          </div>
        </div>

<%@include file="./footer.jsp" %>
