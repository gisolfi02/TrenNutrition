<%@ page import="model.Ordine" %>
<%@ page import="java.util.List" %>
<%@ page import="model.ProdottoDAO" %>
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
          <%
            List<Ordine> ordini = (List<Ordine>) request.getAttribute("ordini");
            if(ordini != null){
              if(ordini.isEmpty()){%>
              <div class="vuoto">
                 <h2>Non hai ancora effettuato ordini</h2>
              </div>
              <%}else {%>
            <div class="ordini">
              <div class="cornice">
                  <%for(Ordine o : ordini){%>
                <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/visualizzaordine?num=<%=o.getNumeroOrdine()%>" style="text-decoration: none">
                  <div>
                    <h4>Ordine Numero: <%=o.getNumeroOrdine()%></h4>
                    <h6>Totale: <%=o.getTotale()%>€</h6>
                  </div>
                </a>
              </div>
            </div>
                <%}
              }
            }else {%>
              <h2>Non hai ancora effettuato ordini</h2>
            <%}%>
      </main>
      <button onclick="scrollToTop()" id="scrollToTop"><i class="fa-solid fa-arrow-up fa-2xl"></i></button>
    </div>

    <footer class="footer">
      <div class="social">
        <a href="https://www.instagram.com"><i class="fa-brands fa-instagram"></i></a>
        <a href="https://twitter.com"><i class="fa-brands fa-twitter"></i></a>
        <a href="https://it-it.facebook.com"><i class="fa-brands fa-facebook-f"></i></a>
      </div>
      <ul>
        <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/">Home</a></li>
        <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/categorie.jsp">Prodotti</a></li>
        <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/ChiSiamo.jsp">About Us</a></li>
      </ul>
      <p class="copyright">TrenNutrition © 2023</p>
    </footer>
  </body>
</html>
