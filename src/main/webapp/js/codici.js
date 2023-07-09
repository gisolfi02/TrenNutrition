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

function css(){
    $(".aggiungi").css("border","none");
    $(".aggiungi").css("line-height","30px");
    $(".dati").css("text-align","center");
}

//funzione che effettua il controllo dei dati della carta di credito
function validateCard(){
    let card = document.getElementById("card").value
    let pattern = /(\d{4}[-\s]?){3}\d{4}/
    if(!pattern.test(card)){
        alert("Inserire una carta valida")
        $("#card").css("border-color","red")
        return false
    }else {
        $("#card").css("border-color","green")
    }

    let cvc = document.getElementById("cvc").value
    if(cvc.length!=3){
        alert("CVC invalido")
        $("#cvc").css("border-color","red")
        return false
    }else {
        $("#cvc").css("border-color","green")
    }

    let scadenza = document.getElementById("scadenza").value
    if(!scadenza.includes("/")){
        alert("Scadenza non valida")
        $("#scadenza").css("border-color","red")
        return false
    }else{
        let split = scadenza.split("/");
        let uno = split[0];
        let due = split[1];
        if(uno.length!=2 || due.length!=2){
            alert("Scadenza non valida")
            $("#scadenza").css("border-color","red")
            return false
        }else {
            $("#scadenza").css("border-color","green")
        }
    }
    return true
}

//funzione che consente di visualizzare la preview di una foto del prodotto
function photoPreview() {
    let img = document.getElementById("preview");
    let file = document.getElementById("file");
    if (file.files[0]) {
        img.src = URL.createObjectURL(file.files[0])
    }
}
