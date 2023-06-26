<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="css/style.css" type="text/css">
  <title>Tren Nutrition</title>

</head>
<body>
<section id="header">
  <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/"><img src="img/Logo.png" class="logo"></a>
  <div class="search-bar">
    <form method="post" action="ricerca">
      <input type="text" name="ricerca" placeholder="Cerca...">
      <button type="submit"><i class="fas fa-search"></i></button>
    </form>
  </div>
  <div>
    <ul id="navbar">
      <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/">Home</a></li>
      <li><a href="#">Chi siamo</a></li>
      <li><a href="#">Prodotti</a></li>
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
    </ul>
  </div>
</section>

<main>
  <!--ci sono i br, levali--->
  <form method="post" onsubmit="return validateCard()" action="ordine">
    <fieldset>
      <legend>Spedizione</legend>
      <label>Via: </label>
      <input type="text" value="${utente.via}" required><br>
      <label>N. Civico: </label>
      <input type="text" value="${utente.ncivico}" required><br>
      <label>CAP: </label>
      <input type="text" value="${utente.CAP}" required><br>
    </fieldset>
    <fieldset>
      <legend>Pagamento</legend>
      <label>Numero Carta: </label>
      <i class="far fa-credit-card"></i>
      <input type="text" placeholder="0000 0000 0000 0000" id="card" required><br>
      <label>Nome sulla carta: </label>
      <input type="text">
      <label>Scadenza: </label>
      <input type="text" placeholder="00/00">
      <label>CVC: </label>
      <input type="text" placeholder="123">
    </fieldset><br>
    <label> Totale: ${totale}€</label>
    <input type="hidden" name = "totale" value="${totale}">
    <input type="submit" value="Conferma Ordine">
  </form>

  <script type="text/javascript">
    function validateCard(){
      let card = document.getElementById("card").value
      let pattern = /(\d{4}[-\s]?){3}\d{4}/
      if(!pattern.test(card)){
        alert("Inserire una carta valida")
        return false
      }
      return true
    }
  </script>
</main>

<footer>
  <!-- Il piè di pagina va qui -->
</footer>
</body>
</html>
