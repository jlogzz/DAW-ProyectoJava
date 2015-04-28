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
    
    
    $('select').material_select();
    
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
    
    
    $("#createCategory").click(function(){
        var vcid = $(this).data("cid");
        $.ajax({
            method: "POST",
            url: "./Controlador?model=category&action=create",
            data: {name:$("#categoryName").val(), cid:vcid}
            //dataType: "json"
        }).done(function(){
            window.location = "./Controlador?model=category&action=read&classId="+vcid;
        });
    });
    
    $("#updateCategory").click(function(){
       var vname = $("#updateClassName").val();
       var vid = $("#updateClassId").val();
       var cid = $(this).data("cid");
       
       $.ajax({
            method: "POST",
            url: "./Controlador?model=category&action=update",
            data: {id: vid, name: vname}
            //dataType: "json"
        }).done(function(){
            window.location = "./Controlador?model=category&action=read&classId="+cid;
        });
    });
    
    $(".categoryDelete").click(function(){
        if(confirm("Are you sure you want to delete " + $(this).data("name") + "?")){
            var cid = $("#updateCategory").data("cid");
            $.ajax({
                method: "POST",
                url: "./Controlador?model=category&action=delete",
                data: {id: $(this).data("id")}
                //dataType: "json"
            }).done(function(){
                window.location = "./Controlador?model=category&action=read&classId="+cid;
            });
        }
    });
    
    $("#createClue").click(function(){
        var vcid = $(this).data("cid");
        var vtext = $("#clueText").val();
        var vpoints = $("#cluePoints").val();
        $.ajax({
            method: "POST",
            url: "./Controlador?model=clue&action=create",
            data: {text:vtext, points:vpoints, cid:vcid}
            //dataType: "json"
        }).done(function(){
            window.location = "./Controlador?model=clue&action=read&categoryId="+vcid;
        });
    });
    
    $(".clueDelete").click(function(){
        if(confirm("Are you sure you want to delete " + $(this).data("text") + "?")){
            var vcid = $(this).data("cid");
            $.ajax({
                method: "POST",
                url: "./Controlador?model=clue&action=delete",
                data: {id: $(this).data("id")}
                //dataType: "json"
            }).done(function(){
                window.location = "./Controlador?model=clue&action=read&categoryId="+vcid;
            });
        }
    });
    
    $("#updatesClue").click(function(){
       var vtext = $("#updateClueText").val();
       var vpoints = $(this).parent().parent().children(".modal-content").children(".row").children(".point-select").children(".select-wrapper").children("input").val();
       var vid = $("#updateClueId").val();
       
//       alert(vtext+"-"+vpoints+"-"+vid);
       var cid = $(this).data("cid");
       
       $.ajax({
            method: "POST",
            url: "./Controlador?model=clue&action=update",
            data: {id: vid, text: vtext, points:vpoints}
            //dataType: "json"
        }).done(function(){
            window.location = "./Controlador?model=clue&action=read&categoryId="+cid;
        });
    });
    
    $(".clueUpdate").click(function(){
        $("#updateClueText").val($(this).data("text"));
        var points = $(this).data("points");
        $(".select-dropdown").val(points);
        var id = $(this).data("id");
        $("#updateClueId").val(id);
        $("#updateClueLabel").addClass("active");
        $("#updateClueModal").openModal();
    });
    
});
