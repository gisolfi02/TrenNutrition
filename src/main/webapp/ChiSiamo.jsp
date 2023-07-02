<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>Tren Nutrition</title>
        <script src="js/codici.js"></script>

    </head>
    <body>
        <div class="content">
            <section id="header">
                <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/"><img src="img/Logo.png" class="logo"></a>
                <div class="search-bar">
                    <form method="post" action="ricerca" autocomplete="off">
                        <input type="text" name="ricerca" placeholder="Cerca...">
                        <button type="submit"><i class="fas fa-search"></i></button>
                    </form>
                </div>
                <div>
                    <ul id="navbar" class="navbar">
                        <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/">Home</a></li>
                        <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/ChiSiamo.jsp">Chi siamo</a></li>
                        <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/categorie.jsp">Prodotti</a></li>
                        <c:choose>
                            <c:when test="${!empty utente && utente.admin}">
                                <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/utenti">Utenti</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/carrello"><i class="fas fa-shopping-cart"></i></a></li>
                            </c:otherwise>
                        </c:choose>
                        <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/account.jsp"><i class="far fa-user"></i></a></li>
                        <c:if test="${!empty utente}">
                            <li><h5>Ciao, ${utente.nome}</h5></li>
                        </c:if>
                        <li class="icon"><a href="javascript:void(0);"><i class="fa-solid fa-bars fa-xl"></i></a></li>
                    </ul>
                </div>
            </section>
            <navbar id="responsive">
                <ul class="responsive">
                    <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/">Home</a></li>
                    <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/ChiSiamo.jsp">Chi siamo</a></li>
                    <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/categorie.jsp">Prodotti</a></li>
                </ul>
            </navbar>

            <main>
                <h2 style="text-align: center">Tren Nutrition</h2>
                <p>Ciao a tutti, ci presentiamo, noi siamo Andrea e Antonio, i creatori di Tren Nutrition.<br> Siamo due studenti dell'università di Salerno che hanno
                realizzato questo sito per tutti coloro, come noi, sono appassionati di palestra e cercano i giusti integratori per poter aumentare la propria massa muscolare e forza.<br>Tren nutrition
                offre prodotti di ottima qualità provenienti dai migliori fornitori del settore come "Prozis" e "Bulk". L'idea nasce per evitare di dover perdere ore e ore a navigare sul web alla ricerca del giusto integratore.
                Qui su TrenNutrition li potrete trovare tutti, basta cercare. Quindi, cosa aspetti, corri a comprare i tuoi integratori!</p>
            </main>
            <button onclick="scrollToTop()" id="scrollToTop"><i class="fa-solid fa-arrow-up fa-2xl"></i></button>
        </div>
        <footer class="footer">
            <div class="social"><a href="#"><i class="fa-brands fa-instagram"></i></a><a href="#"><i class="fa-brands fa-twitter"></i></a><a href="#"><i class="fa-brands fa-facebook-f"></i></a></div>
            <ul>
                <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/">Home</a></li>
                <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/categorie.jsp">Prodotti</a></li>
                <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/ChiSiamo.jsp">About Us</a></li>
            </ul>
            <p class="copyright">TrenNutrition © 2023</p>
        </footer>
    </body>
</html>
