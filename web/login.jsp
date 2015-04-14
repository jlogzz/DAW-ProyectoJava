<%@include file="./header.jsp" %>
    <jsp:useBean id = "datos" scope= "session" class = "data.DBhandler" />
        
        <div class="container">
            <div class="row">
                <div class="col sm12 m10 offset-m1 card-panel red darken-2 login-error">
                    <h4 class="center white-text">Error en login, favor de revisar username/password.</h4>
                </div>
            </div>
            <div class="row" style="margin-top: 50px;">
                <div class="col s12 m6 offset-m3">
                    <div class="card">
                        <div class="card-content">
                            <form action="./SessionManager?action=login" method="POST" class="login-inputs">
                                <div class="input-field">
                                    <i class="mdi-action-account-circle prefix"></i>
                                    <input id="username" type="email" name="username" class="validate" required="required">
                                    <label for="username">E-Mail</label>
                                </div>
                                <div class="input-field">
                                    <i class="mdi-action-lock prefix"></i>
                                    <input id="password" type="password" name="password" class="validate" required="required">
                                    <label for="password">Password</label>
                                </div>
                            </form>
                            <div class="login-spinner">
                                <div class="preloader-wrapper big active" style="width: 128px; height: 128px;">
                                    <div class="spinner-layer spinner-blue">
                                      <div class="circle-clipper left">
                                        <div class="circle"></div>
                                      </div><div class="gap-patch">
                                        <div class="circle"></div>
                                      </div><div class="circle-clipper right">
                                        <div class="circle"></div>
                                      </div>
                                    </div>

                                    <div class="spinner-layer spinner-red">
                                      <div class="circle-clipper left">
                                        <div class="circle"></div>
                                      </div><div class="gap-patch">
                                        <div class="circle"></div>
                                      </div><div class="circle-clipper right">
                                        <div class="circle"></div>
                                      </div>
                                    </div>

                                    <div class="spinner-layer spinner-yellow">
                                      <div class="circle-clipper left">
                                        <div class="circle"></div>
                                      </div><div class="gap-patch">
                                        <div class="circle"></div>
                                      </div><div class="circle-clipper right">
                                        <div class="circle"></div>
                                      </div>
                                    </div>

                                    <div class="spinner-layer spinner-green">
                                      <div class="circle-clipper left">
                                        <div class="circle"></div>
                                      </div><div class="gap-patch">
                                        <div class="circle"></div>
                                      </div><div class="circle-clipper right">
                                        <div class="circle"></div>
                                      </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-action">
                            <button class="btn waves-effect waves-light" id="login-btn" type="submit" name="action">Login
                                <i class="mdi-content-send right"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<%@include file="./footer.jsp" %>
