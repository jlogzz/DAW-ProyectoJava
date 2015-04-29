
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
            <div class="row" style="margin-top: 10px;"> 
                <div class="row" style="position: fixed; z-index: 3000; width: 70%;">
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-content">
                                <h5 class="activator yellow-text text-darken-1 center-align">Categoria</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-content">
                                <h5 class="activator yellow-text text-darken-1 center-align">Categoria</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-content">
                                <h5 class="activator yellow-text text-darken-1 center-align">Categoria</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-content">
                                <h5 class="activator yellow-text text-darken-1 center-align">Categoria</h5>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="padding-top: 110px;">                    
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator">
                                <h1 class="center-align activator yellow-text text-darken-1">100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text">Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                  
        <!-- Modal Structure -->
        <div id="newClassModal" class="modal" style="height: 900px;">
          <div class="modal-content">
            <h4>New Instance</h4>
            <div class="row">
                <div class="input-field col s12">
                    <select>
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
                    <label>Select Class</label>
                </div>
            </div>
          </div>
          <div class="modal-footer">
              <button id="createCategory" data-cid="<%= request.getAttribute("cid") %>" class=" modal-action modal-close waves-effect waves-green btn-large">Submit</button>
          </div>
        </div>

<%@include file="./footer.jsp" %>
