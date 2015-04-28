
<%@include file="./header.jsp" %>


<%@page import="model.Instances"%>
<%@page import="model.Categories"%>
<%@page import="model.Clues"%>

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
                    <div class="col s6">
                        <h3 class="center-align">Categories</h3>
                        <div class="input-field col s12">
                            <input type="hidden" id="instance" value="<%= request.getParameter("instance") %>">
                            <h3>Category 1</h3>
                            <select id="cat1" class="browser-default cat-select" data-num="1">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                ArrayList categories = (ArrayList)request.getAttribute("categories");
                                int i;
                                Categories cat;

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                            %>
                              <option value="<%= cat.getId() %>"><%= cat.getName() %></option>
                              <% } %>
                            </select>

                        </div>
                            
                        <div class="input-field col s12">
                            <p>100</p>
                            <select id="cl11" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==100){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                        
                         <div class="input-field col s12">
                            <p>200</p>
                            <select id="cl12" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==200){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                            
                            <div class="input-field col s12">
                            <p>300</p>
                            <select id="cl13" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==300){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                            
                            <div class="input-field col s12">
                            <p>400</p>
                            <select id="cl14" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==400){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                            
                            <div class="input-field col s12">
                            <p>500</p>
                            <select id="cl15" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==500){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                            
                        <div class="input-field col s12">
                            <h3>Category 2</h3>
                            <select id="cat2" class="browser-default cat-select" data-num="2">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                            %>
                              <option value="<%= cat.getId() %>"><%= cat.getName() %></option>
                              <% } %>
                            </select>

                        </div>
                            
                            <div class="input-field col s12">
                            <p>100</p>
                            <select id="cl21" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==100){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                        
                         <div class="input-field col s12">
                            <p>200</p>
                            <select id="cl22" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==200){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                            
                            <div class="input-field col s12">
                            <p>300</p>
                            <select id="cl23" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==300){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                            
                            <div class="input-field col s12">
                            <p>400</p>
                            <select id="cl24" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==400){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                            
                            <div class="input-field col s12">
                            <p>500</p>
                            <select id="cl25" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==500){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                            
                        <div class="input-field col s12">
                            <h3>Category 3</h3>
                            <select id="cat3" class="browser-default cat-select" data-num="3">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                 if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                            %>
                              <option value="<%= cat.getId() %>"><%= cat.getName() %></option>
                              <% } %>
                            </select>

                        </div>
                            
                            <div class="input-field col s12">
                            <p>100</p>
                            <select id="cl31" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==100){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                        
                         <div class="input-field col s12">
                            <p>200</p>
                            <select id="cl32" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==200){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                            
                            <div class="input-field col s12">
                            <p>300</p>
                            <select id="cl33" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==300){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                            
                            <div class="input-field col s12">
                            <p>400</p>
                            <select id="cl34" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==400){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                            
                            <div class="input-field col s12">
                            <p>500</p>
                            <select id="cl35" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==500){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                            
                        <div class="input-field col s12">
                            <h3>Category 4</h3>
                            <select id="cat4" class="browser-default cat-select" data-num="4">
                                <option value="" disabled selected>Choose your option</option>
                                <%

                                   if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                              %>
                                <option value="<%= cat.getId() %>"><%= cat.getName() %></option>
                                <% } %>
                            </select>

                        </div>
                            
                            
                            <div class="input-field col s12">
                            <p>100</p>
                            <select id="cl41" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==100){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                        
                         <div class="input-field col s12">
                            <p>200</p>
                            <select id="cl42" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==200){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                            
                            <div class="input-field col s12">
                            <p>300</p>
                            <select id="cl43" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==300){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                            
                            <div class="input-field col s12">
                            <p>400</p>
                            <select id="cl44" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==400){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                            
                            <div class="input-field col s12">
                            <p>500</p>
                            <select id="cl45" class="browser-default">
                              <option value="" disabled selected>Choose your option</option>
                              <%

                                if(categories!=null)
                                for (i = 0; i < categories.size(); i++) {
                                    cat = (Categories) categories.get(i);
                                    ArrayList list = cat.getClues();
                                    if(list!=null)
                                    for (i = 0; i < list.size(); i++) {
                                        Clues cl = (Clues) list.get(i);
                                        if(cl.getPoints()==500){
                            %>
                              <option class="clues" data-cat="<%= cl.getCategoryId() %>" value="<%= cl.getId() %>"><%= cl.getText() %></option>
                              <%        }
                                    } 
                                }%>
                            </select>

                        </div>
                        <a id="next" class="waves-effect waves-light btn right" style="margin-top: 50px;">Next</a>
                    </div>
                    <div class="col s6">
                        <h3 class="center-align">Teams</h3>
                        <h4 class="center-align">Team 1</h4>
                        <div class="input-field col s12">
                            <input placeholder="A0XXXXXXX" id="stud1" data-team="1" type="text" class="validate">
                            <label for="stud1" class="black-text">Matricula</label>
                        </div>
                        <div class="input-field col s12">
                            <input placeholder="A0XXXXXXX" id="stud2" data-team="1" type="text" class="validate">
                            <label for="stud1" class="black-text">Matricula</label>
                        </div>
                        <div class="input-field col s12">
                            <input placeholder="A0XXXXXXX" id="stud3" data-team="1" type="text" class="validate">
                            <label for="stud1" class="black-text">Matricula</label>
                        </div>
                        <div class="input-field col s12">
                            <input placeholder="A0XXXXXXX" id="stud4" data-team="1" type="text" class="validate">
                            <label for="stud1" class="black-text">Matricula</label>
                        </div>
                        <h4 class="center-align">Team 2</h4>
                        <div class="input-field col s12">
                            <input placeholder="A0XXXXXXX" id="stud5" data-team="2" type="text" class="validate">
                            <label for="stud1" class="black-text">Matricula</label>
                        </div>
                        <div class="input-field col s12">
                            <input placeholder="A0XXXXXXX" id="stud6" data-team="2" type="text" class="validate">
                            <label for="stud1" class="black-text">Matricula</label>
                        </div>
                        <div class="input-field col s12">
                            <input placeholder="A0XXXXXXX" id="stud7" data-team="2" type="text" class="validate">
                            <label for="stud1" class="black-text">Matricula</label>
                        </div>
                        <div class="input-field col s12">
                            <input placeholder="A0XXXXXXX" id="stud8" data-team="2" type="text" class="validate">
                            <label for="stud1" class="black-text">Matricula</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<%@include file="./footer.jsp" %>
