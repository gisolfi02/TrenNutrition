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