
<%@include file="./header.jsp" %>
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
                    <div class="col s12 m12 l12">
                        <div class="card-panel red lighten-1 input-field white-text">
                            <input id="search" placeholder="Search..." type="search" required> 
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col s12 m6 l4">
                      <div class="card light-blue darken-3">
                        <div class="card-content white-text">
                          <span class="card-title">Class Title</span>
                          <p class="center-align">12/12/2015</p>
                          <ul>
                              <li><i class="mdi-image-adjust"></i> Tema 1</li>
                              <li><i class="mdi-image-adjust"></i> Tema 2</li>
                              <li><i class="mdi-image-adjust"></i> Tema 3</li>
                              <li><i class="mdi-image-adjust"></i> Tema 4</li>
                              <li><i class="mdi-image-adjust"></i> Tema 5</li>
                          </ul>
                        </div>
                        <div class="card-action" style="font-size: 24px;">
                          <a href="#">PLAY</a>
                          <a href='#'><i class="mdi-editor-mode-edit"></i></a>
                          <a href='#'><i class="mdi-action-delete"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
            </div>
            <div class="fixed-action-btn" style="bottom: 45px; right: 24px;">
                <a class="btn-floating btn-large red">
                  <i class="large mdi-navigation-menu"></i>
                </a>
                <ul>
                    <li><a href="./Controlador?model=class&action=read" class="btn-floating deep-purple lighten-1 tooltipped" data-position="left" data-delay="50" data-tooltip="Users">
                          <i class="large mdi-social-people"></i>
                      </a></li>
                    <li><a href="./Controlador?model=class&action=read" class="btn-floating yellow darken-1 tooltipped" data-position="left" data-delay="50" data-tooltip="Classes">
                            <i class="large mdi-action-class"></i>
                        </a></li>
                    <li><a href="./rerports.jsp" class="btn-floating green tooltipped" data-position="left" data-delay="50" data-tooltip="Reports">
                            <i class="large mdi-editor-insert-chart"></i>
                        </a></li>
                    <li><a href="./instances.jsp" class="btn-floating blue tooltipped" data-position="left" data-delay="50" data-tooltip="Create Instance">
                            <i class="large mdi-action-note-add"></i>
                        </a></li>
                </ul>
            </div>
        </div>

<%@include file="./footer.jsp" %>
