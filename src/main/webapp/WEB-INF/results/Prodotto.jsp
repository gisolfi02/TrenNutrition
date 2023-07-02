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
        <!-- Il contenuto della pagina va qui -->
        <img src="img/${prodotto.nome}${prodotto.id}.jpg" style="float: left">
        <h1>${prodotto.nome}</h1><br>
        <h5>${prodotto.descrizione}</h5><br>
        <form action="Aggiungi" method="post">
          <input type="hidden" name="id" value="${prodotto.id}">
          <label>${prodotto.prezzo}€</label><br>
          <label>Quantità:</label>
          <select name="quantita">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
          </select>
          <button type="submit" id="addToCart"><i class="fas fa-shopping-cart" style="color: #393E46;"></i></button>
        </form>
        <c:if test="${richiesta == 0}">
          <script>
            $(function(){
              $("#accedi").fadeIn();
            })
          </script>
        </c:if>
        <c:if test="${aggiunta == 1}">
          <script>
            $(function(){
              $("#aggiunto").fadeIn();
            })
          </script>
        </c:if>
        <p id="accedi">Per aggiungere il prodotto al carrello <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/account.jsp">accedi</a> o <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/registrazione.html">registrati</a></p>
        <p id="aggiunto" >Prodotto aggiunto al carrello</p>
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
