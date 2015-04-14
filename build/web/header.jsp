<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Proyecto Final JAVA</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
        <link rel="stylesheet" href="assets/css/materialize.min.css" media="screen,projection"/>
        <link rel="stylesheet" href="assets/css/main.css"/>
    </head>
    <%
        boolean login = false;
        %>
    <body>
        <nav class="red lighten-1">
            <div class="nav-wrapper">
                <div class="col s12">
                    <a href="./Controlador?model=instance&action=read" class="brand-logo">&nbsp;JEOPARDY</a>
                    <ul id="nav-mobile" class="right hide-on-med-and-down">
                        <% if(session.getAttribute("estatus")!=null){ %>
                        <li><a href="./SessionManager?action=logout">LOGOUT</a></li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </nav>