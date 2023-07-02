//questa funzione nasconde la barra di navigazione per gli schermi piccoli qunado si ridimensiona la pagina
$(function(){
    $(window).resize(function (){
        $("#responsive").hide()
    });
})

//questa funzione permette di far comparire la barra di navigazione per gli schermi piccoli
$(function (){
    $(".icon").click(function (){
        $("#responsive").toggle()
    })
})

//questa funzione fa apparire il bottone per tornare in cima dopo aver scrollato 400px
$(function (){
    window.onscroll= function (){
        if(document.documentElement.scrollTop > 400){
            $("#scrollToTop").show()
        }else {
            $("#scrollToTop").hide()
        }
    }
})

//questa funzione permette di ritornare in cima alla pagina quando si clicca il bottone
$(function (){
    $("#scrollToTop").click(function (){
        $("html, body").animate({scrollTop:0},700)
    })
})


//Funzioni per validare la registrazione

//questa funzione valida le email e le password tramite dei pattern
function validateForm(){
    let email = document.getElementById("email").value;
    let password = document.getElementById("password").value;
    let emailPattern = /^([a-z0-9_\.-]+@[a-z\d\.-]+\.[a-z\.]{2,6})$/;
    let passwordPattern = /^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[^\w\d\s:])([^\s]){8,16}$/;

    if (!emailPattern.test(email)) {
        $(function(){
            $(" #email").css("border-bottom","2px solid #ff0000")
            alert("Email non valida")
        })
        return false;
    }

    if (!passwordPattern.test(password)) {
        $(function (){
            $("#password").css("border-bottom","2px solid #ff0000")
            alert("La password deve contenere almeno 1 numero, 1 carattere maiuscolo, 1 minuscolo, 1 carattere non alfanumerico e non deve contenere spazi");
        })
        return false;
    }

    return true;
}

//questa funzione chiama la funzione ajax quando il campo email perde il focus
$(function (){
    $("#email").blur(function (){
        ajaxValidate();
    })
})

//questa funzione ajax permette di controllare se l'email con cui ci si prova a registrare è gia presente nel db
function ajaxValidate(){
    let email = document.getElementById("email").value;
    let xml = new XMLHttpRequest();
    xml.onreadystatechange = function(){
        if(this.readyState == 4 && this.status==200){
            if(this.responseText ==="invalid"){
                $(function(){
                    $(".input-box-registration #email").css("border-bottom","2px solid #ff0000")
                    alert("L'email \u00E8 gi\u00E0 associata ad un account")
                })
                return false
            }else {
                return true;
            }
        }
    }
    xml.open("POST","check?email="+email,true);
    xml.send();
}

//questa funzione permette di visualizzare la password quando si clicca sull'icona
function passwordToggle(){
    let password = document.getElementById("password");
    let icon = document.getElementById("showpassword");
    if(password.type==="password"){
        password.type="text";
        icon.className = "fa-regular fa-eye";
    }else{
        password.type="password";
        icon.className = "fa-regular fa-eye-slash";
    }
}