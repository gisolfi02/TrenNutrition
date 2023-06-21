<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="css/style.css" type="text/css">
  <title>Tren Nutrition</title>
</head>

<body>
<selection id="header">
  <div>
    <ul id="navbar">
      <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/">Home</a></li>
      <li><a href="#">Chi siamo</a></li>
      <li><a href="#">Prodotti</a></li>
      <c:choose>
        <c:when test="${!empty utente && utente.admin==true}">
          <li><a href="utenti">Utenti</a></li> <%-- Se è un adimn aggiungo un altro elemento al menù per poter gestire gli utenti --%>
        </c:when>
        <c:otherwise>
          <a href="#"><img src="img/shopping-cart-svgrepo-com.svg" class="logo" alt=""></a>
        </c:otherwise>
      </c:choose>
      <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/account.jsp"><i class="far fa-user"></i></a></li>
    </ul>
  </div>
</selection>

<main>
  <!-- Il contenuto della pagina va qui -->
  <form action="UpdateUtente" method="post">
    <label><b>Nome</b></label><br>
    <input type="text" name="nome" value="${modifica.nome}"><br>
    <label><b>Cognome</b></label><br>
    <input type="text" name="cognome" value="${modifica.cognome}"><br>
    <label><b>Username</b></label><br>
    <input type="text" name="username" value="${modifica.username}"><br>
    <label><b>Telefono</b></label><br>
    <input type="number" name="telefono" value="${modifica.telefono}"><br>
    <input type="hidden" name="id" value="${modifica.id}">
    <input type="submit" value="Aggiorna">
  </form>
</main>

<footer>
  <!-- Il piè di pagina va qui -->
</footer>
</body>

</html>