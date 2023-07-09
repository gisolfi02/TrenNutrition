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

      <main id="checkout">
        <div class="confirm">
          <form method="post" onsubmit="return validateCard()" action="ordine" autocomplete="off">
            <h3><i class="fa-solid fa-truck-fast"></i> Informazioni sulla spedizione</h3>
            <div class="spedizione">
              <div class="informazioni">
                <label>Via </label>
                <input type="text" name="via" value="${utente.via}" required>
              </div>
              <div class="informazioni">
                <label>N. Civico </label>
                <input type="text" name="civico" value="${utente.ncivico}" required>
              </div>
              <div class="informazioni">
                <label>CAP </label>
                <input type="text" name="cap" value="${utente.CAP}" required>
              </div>
            </div>
            <h3><i class="far fa-credit-card"></i> Pagamento</h3>
            <div class="spedizione">
              <div class="carta">
                <div class="informazioni">
                  <label>Numero Carta </label>
                  <input type="text" name="carta" placeholder="0000 0000 0000 0000" id="card" required>
                </div>
                <div class="informazioni">
                  <label>CVC </label>
                  <input type="text" name="cvc" placeholder="123" id="cvc" required>
                </div>
              </div>
              <div class=" carta">
                <div class="informazioni">
                <label>Scadenza </label>
                <input type="text" name="scadenza" placeholder="00/00" id="scadenza" required>
              </div>
                <div class="informazioni">
                  <label>Nome sulla carta </label>
                  <input type="text" name="nome">
                </div>
              </div>
            </div>
            <div class="informazioni">
              <label> <b>Totale: ${totale}€</b></label>
            <input type="hidden" name = "totale" value="${totale}">
            <div class="button-container">
              <button type="submit" value="Conferma Ordine">Conferma Ordine</button>
            </div>
            </div>
          </form>
        </div>
      </main>
      <button onclick="scrollToTop()" id="scrollToTop"><i class="fa-solid fa-arrow-up fa-2xl"></i></button>

      <c:if test="${param.checkout==1}">
        <script>
          alert("Il pagamento non \u00E8 andato a buon fine")
        </script>
      </c:if>
    </div>

    <jsp:include page="navbar_footer/footer.jsp"/>
  </body>
</html>
