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
    
    $("#createInstance").click(function(){
        var selected = $("select").val();
        
        $.ajax({
            method: "POST",
            url: "./Controlador?model=instance&action=create",
            data: {classId:selected}
            //dataType: "json"
        }).done(function(){
            window.location = "./Controlador?model=instance&action=read";
        });
    });
    
    $("#next").click(function(){
        var iid = $("#instance").val();
        var cat1 = $("#cat1").val();
        var cat2 = $("#cat2").val();
        var cat3 = $("#cat3").val();
        var cat4 = $("#cat4").val();
        
        var cl11 = $("#cl11").val();
        var cl12 = $("#cl12").val();
        var cl13 = $("#cl13").val();
        var cl14 = $("#cl14").val();
        var cl15 = $("#cl15").val();
        
        var cl21 = $("#cl21").val();
        var cl22 = $("#cl22").val();
        var cl23 = $("#cl23").val();
        var cl24 = $("#cl24").val();
        var cl25 = $("#cl25").val();
        
        var cl31 = $("#cl31").val();
        var cl32 = $("#cl32").val();
        var cl33 = $("#cl33").val();
        var cl34 = $("#cl34").val();
        var cl35 = $("#cl35").val();
        
        var cl41 = $("#cl41").val();
        var cl42 = $("#cl42").val();
        var cl43 = $("#cl43").val();
        var cl44 = $("#cl44").val();
        var cl45 = $("#cl45").val();
        
        var studs = [];
        
        for(var i=1; i<=8; i++)
            studs[i] = $("#stud"+i).val();
        
        if(cat1===""||cat2===""||cat3===""||cat4===""){
            alert("Please select all categories");
        }else if(cat1===cat2||cat1===cat3||cat1===cat4||cat2===cat3||cat2===cat4||cat3===cat4){
            alert("Categories can't be repeated");
        }else if(studs[1]===""||studs[5]===""){
            alert("You must select at least 2 students to play");
        }else{
            $.ajax({
            method: "POST",
            url: "./Controlador?model=play&action=step1",
            data: {id:iid,vcat1:cat1, vcat2:cat2, vcat3:cat3, vcat4:cat4, 
                stud1: studs[1], stud2: studs[2], stud3: studs[3], stud4: studs[4], stud5: studs[5], stud6: studs[6], stud7: studs[7], stud8: studs[8],
                c11:cl11, c21:cl21, c31:cl31, c41:cl41,
                c12:cl12, c22:cl22, c32:cl32, c42:cl42,
                c13:cl13, c23:cl23, c33:cl33, c43:cl43,
                c14:cl14, c24:cl24, c34:cl34, c44:cl44,
                c15:cl15, c25:cl25, c35:cl35, c45:cl45
                }
            //dataType: "json"
            }).done(function(){
                window.location = "./Controlador?model=play&action=play";
            });
        }
    });
    
    for(var i=1; i<=4; i++){
        for(var j=1; j<=5; j++)
            $("#cl"+i+j).hide();
    }
    
    
    $(".cat-select").on("change",function(){
       var num = $(this).data("num");
       var cat = $(this).val();
       $("#cl"+num+"1").show().children(".clues").each(function(){
           $(this).hide();
           if($(this).data("cat")==cat){
               $(this).show();
           }
       });
       $("#cl"+num+"2").show().children(".clues").each(function(){
           $(this).hide();
           if($(this).data("cat")==cat){
               $(this).show();
           }
       });
       $("#cl"+num+"3").show().children(".clues").each(function(){
           $(this).hide();
           if($(this).data("cat")==cat){
               $(this).show();
           }
       });
       $("#cl"+num+"4").show().children(".clues").each(function(){
           $(this).hide();
           if($(this).data("cat")==cat){
               $(this).show();
           }
       });
       $("#cl"+num+"5").show().children(".clues").each(function(){
           $(this).hide();
           if($(this).data("cat")==cat){
               $(this).show();
           }
       });
    });
    
    
    var points = 0;
    //GAME!!!
    $(".activator").click(function(){
        points = $(this).data("points");
    });
    
    $(".student").click(function(){
        var vid = $(this).data("id");
        var vpoints = points;
        if($(this).data("team")==1){
            var score = parseInt($("#team1-score").html());
            score+=points;
            points=0;
            $("#team1-score").html(score);
        }else{
            var score = parseInt($("#team2-score").html());
            score+=points;
            points=0;
            $("#team2-score").html(score);
        }
        
        $.ajax({
            method: "POST",
            url: "./Controlador?model=play&action=points",
            data: {id:vid, points:vpoints}
            //dataType: "json"
        });
    });
    
});
