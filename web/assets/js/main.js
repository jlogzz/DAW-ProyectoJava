/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    
    //**********************************************************
    //
    // Login JS
    //
    //**********************************************************
    $(".login-spinner").hide();
    $(".login-error").hide();
    
    $("#login-btn").click(function(){
        if($(this).hasClass("disbled")){
            
        }else{
            $(this).addClass("disabled").html("Loggin In...");
            $(".login-inputs").fadeOut("fast", function(){
                $(".login-spinner").fadeIn();
                setTimeout(function(){
                    $.ajax({
                        method: "POST",
                        url: "./SessionManager?action=login",
                        data: {username: $("#username").val(), password: $("#password").val()},
                        dataType: "json"
                    }).done(function(data){
                        if(data.status){
                            window.location = "./Controlador?model=instance&action=read";
                        }else{
                            if(data.tries<=0){
                                $(".login-error").html("<h4 class=\"center white-text\">Account blocked, try again in 30 minutes.</h4>");
                            }else{
                                $(".login-error").html("<h4 class=\"center white-text\">Login error, check username/password. "+data.tries+" tries remaining before account is blocked.</h4>");
                            }
                            $(".login-error").fadeIn();
                            $(".login-spinner").hide();
                            $(".login-inputs").fadeIn();
                            $("#login-btn").removeClass("disabled").html("Login <i class='mdi-content-send right'></i>");
                        }
                    });
                }, 1500);
            });
        }
        
    });
    
    //**********************************************************
    //
    // APP JS
    //
    //**********************************************************
    
    $('.newClassModal-trigger').leanModal();
    
    $("#createClass").click(function(){
        $.ajax({
            method: "POST",
            url: "./Controlador?model=class&action=create",
            data: {name: $("#className").val()}
            //dataType: "json"
        }).done(function(){
            window.location = "./Controlador?model=class&action=read";
        });
    });
    
    $(".classDelete").click(function(){
        if(confirm("Are you sure you want to delete " + $(this).data("name") + "?")){
            $.ajax({
                method: "POST",
                url: "./Controlador?model=class&action=delete",
                data: {id: $(this).data("id")}
                //dataType: "json"
            }).done(function(){
                window.location = "./Controlador?model=class&action=read";
            });
        }
    });
    
    $(".classUpdate").click(function(){
        $("#updateClassName").val($(this).data("name"));
        var id = $(this).data("id");
        $("#updateClassId").val(id);
        $("#updateClassLabel").addClass("active");
        $("#updateClassModal").openModal();
    });
    
    $("#updateClass").click(function(){
       var vname = $("#updateClassName").val();
       var vid = $("#updateClassId").val();
       
       $.ajax({
            method: "POST",
            url: "./Controlador?model=class&action=update",
            data: {id: vid, name: vname}
            //dataType: "json"
        }).done(function(){
            window.location = "./Controlador?model=class&action=read";
        });
    });
});
