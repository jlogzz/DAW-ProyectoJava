
<%@include file="./header.jsp" %>


<%@page import="model.Instances"%>
<%@page import="model.Classes"%>
<%@page import="model.Categories"%>
<%@page import="model.InstanceCategories"%>
<%@page import="model.InstanceTeams"%>
<%@page import="model.Clues"%>

<%@page import="java.util.ArrayList"%>
        <%
            //Si ya inicio sesion mandalo a index
            if((session.getAttribute("estatus")==null) || session == null){
                    String url = "./login.jsp";
                    response.sendRedirect(url);
            }
        %>
        <div class="row" style="position: fixed; width: 100%;">
            <div class="col s2">
                <div class="card indigo">
                    <div class="card-content">
                        <span class="card-title">Team 1</span>
                        <%

                            ArrayList teams = (ArrayList)request.getAttribute("teams");
                            int i;
                            InstanceTeams tm;

                            if(teams!=null)
                            for (i = 0; i < teams.size(); i++) {
                                tm = (InstanceTeams) teams.get(i);
                                if(tm.getTeam()==1){
                        %>
                        <a href="#"><h5 class="yellow-text text-darken-1 center-align student" data-team='1' data-id='<%= tm.getId() %>'><%= tm.getMatricula() %></h5></a>
                        <%      }
                            } %>
                    </div>
                    <div class="card-action">
                        <a href="#">Score:</a>
                        <a href='#' id="team1-score">0</a>
                    </div>
                </div>
            </div>
            <div class="col s2 offset-s8">
                <div class="card indigo">
                    <div class="card-content">
                        <span class="card-title">Team 2</span>
                        <%
                            if(teams!=null)
                            for (i = 0; i < teams.size(); i++) {
                                tm = (InstanceTeams) teams.get(i);
                                if(tm.getTeam()==2){
                        %>
                        <a href="#"><h5 class="yellow-text text-darken-1 center-align student" data-team='2' data-id='<%= tm.getId() %>'><%= tm.getMatricula() %></h5></a>
                        <%      }
                            } %>
                    </div>
                    <div class="card-action">
                        <a href="#">Score:</a>
                        <a href='#' id="team2-score">0</a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container">
            <div class="row" style="margin-top: 10px;"> 
                <div class="row" style="position: fixed; z-index: 3000; width: 70%;">
                    <%

                        ArrayList categories = (ArrayList)request.getAttribute("categories");
                        InstanceCategories cat;
                        Clues[][] clues = new Clues[4][5];

                        if(categories!=null)
                        for (i = 0; i < categories.size(); i++) {
                            cat = (InstanceCategories) categories.get(i);
                            clues[i][0] = cat.getClue100();
                            clues[i][1] = cat.getClue200();
                            clues[i][2] = cat.getClue300();
                            clues[i][3] = cat.getClue400();
                            clues[i][4] = cat.getClue500();
                    %>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-content">
                                <h5 class="activator yellow-text text-darken-1 center-align"><%= cat.getCategory() %></h5>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
                <div class="row" style="padding-top: 110px;">                    
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='100'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='100'>100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[0][0].getText() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='100'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='100'>100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[1][0].getText() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='100'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='100'>100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[2][0].getText() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='100'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='100'>100</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[3][0].getText() %></p>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='200'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='200'>200</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[0][1].getText() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='200'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='200'>200</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[1][1].getText() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='200'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='200'>200</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[2][1].getText() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='200'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='200'>200</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[3][1].getText() %></p>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    
                    
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='300'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='300'>300</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[0][2].getText() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='300'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='300'>300</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[1][2].getText() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='300'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='300'>300</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[2][2].getText() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='300'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='300'>300</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[3][2].getText() %></p>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='400'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='400'>400</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[0][3].getText() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='400'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='400'>400</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[1][3].getText() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='400'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='400'>400</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[2][3].getText() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='400'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='400'>400</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[3][3].getText() %></p>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    
                    
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='500'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='500'>500</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[0][4].getText() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='500'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='500'>500</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[1][4].getText() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='500'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='500'>500</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[2][4].getText() %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
                        <div class="card blue">
                            <div class="card-image waves-effect waves-block waves-light activator" data-points='500'>
                                <h1 class="center-align activator yellow-text text-darken-1" data-points='500'>500</h1>
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4"></span>
                            </div>
                            <div class="card-reveal blue">
                              <p class="white-text center-align"><%= clues[3][4].getText() %></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<%@include file="./footer.jsp" %>
