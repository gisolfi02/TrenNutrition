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
      <jsp:include page="navbar_footer/navbar.jsp"/>

      <main>
        <div class="visualizza">
          <img src="img/${prodotto.nome}${prodotto.id}.jpg" style="float: left">
          <div class="descrizione">
            <h1>${prodotto.nome}</h1>
            <h5>${prodotto.descrizione}</h5>
          </div>
          <div class="contenuto">
            <div class="aggiungi">
              <form action="option" method="post">
                <input type="hidden" name="id" value="${prodotto.id}">
                  <c:choose>
                    <c:when test="${!utente.admin}">
                      <div class="dati">
                        <label>${prodotto.prezzo}€</label>
                        <label id="quantita">Quantità:</label>
                        <select name="quantita">
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                        </select>
                      </div>
                      <button type="submit" name="option" value="aggiungi" id="addToCart"><span>Aggiungi Al carrello  </span><i class="fas fa-shopping-cart" style="color: #393E46;"></i></button>
                    </c:when>
                  <c:otherwise>
                    <script>
                      css()
                    </script>
                    <div class="dati">
                      <label>${prodotto.prezzo}€</label>
                    </div>
                    <button id="rimuovi" type="submit" name="option" value="rimuovi"><span>Rimuovi Prodotto  </span><i class="fa-solid fa-x"></i></button>
                  </c:otherwise>
                </c:choose>
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
            </div>
            <p id="accedi">Per aggiungere il prodotto al carrello <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/account.jsp">accedi</a> o <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/registrazione.html">registrati</a></p>
            <p id="aggiunto" >Prodotto aggiunto al carrello</p>
          </div>
        </div>
      </main>
      <button onclick="scrollToTop()" id="scrollToTop"><i class="fa-solid fa-arrow-up fa-2xl"></i></button>
    </div>

    <jsp:include page="navbar_footer/footer.jsp"/>
  </body>
</html>
