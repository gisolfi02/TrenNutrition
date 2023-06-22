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
  <a href="#"><img src="/img/Logo.png" class="logo"></a>
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
    </ul>
  </div>
</section>


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
      <option value="0">0</option>
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
    </select>
    <input type="submit" value="Aggiungi al carrello">
  </form>
  <c:if test="${richiesta == 0}">
    <p style="color:red;">Per aggiungere il prodotto al carrello <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/account.jsp">accedi</a> o <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/registrazione.html">registrati</a></p>
  </c:if>
  <c:if test="${aggiunta == 1}">
    <p style="color:green">Prodotto aggiunto al carrello</p>
  </c:if>
</main>

<footer>
  <!-- Il piè di pagina va qui -->
</footer>
</body>
</html>
