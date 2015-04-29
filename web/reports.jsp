
<%@include file="./header.jsp" %>


<%@page import="model.Instances"%>
<%@page import="model.Classes"%>
<%@page import="model.InstanceTeams"%>

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
                <div class="col s6">
                    <h4>POINTS PER STUDENT</h4>
                    <ul>
                    <%

                            ArrayList teams = (ArrayList)request.getAttribute("teams");
                            int i;
                            InstanceTeams tm;

                            if(teams!=null)
                            for (i = 0; i < teams.size(); i++) {
                                tm = (InstanceTeams) teams.get(i);
                        %>
                        <li>Student: <%= tm.getMatricula() %> - Points: <%= tm.getPoints() %></li>
                        <% } %>
                    </ul>
                </div>
                <div class="col s6">
                    <h4>GAMES IN LAST SEMESTER</h4>
                    <ul>
                    <%

                            ArrayList instances = (ArrayList)request.getAttribute("instances");
                            Instances ins;

                            if(instances!=null)
                            for (i = 0; i < instances.size(); i++) {
                                ins = (Instances) instances.get(i);
                        %>
                        <li>Class: <%= ins.getClassName() %> - Date: <%= ins.getDateEdited() %></li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </div>
                 

<%@include file="./footer.jsp" %>
