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
  <section id="header">
    <a href="#"><img src="/img/Logo.png" class="logo"></a>
    <div class="search-bar">
      <input type="text" placeholder="Cerca...">
      <button type="submit"><i class="fas fa-search"></i></button>
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
      </ul>
    </div>
  </section>

    <main>
      <!-- Il contenuto della pagina va qui -->
      <ul>
        <c:forEach items="${utenti}" var="utente">
          <li> <p>${utente.email} ${utente.username}</p>
            <form action="modifica" method="get">
              <input type="hidden" name="id" value="${utente.id}"/>
              <input type="submit" value="Modifica">
            </form>
          </li>
        </c:forEach>
      </ul>
    </main>

    <footer>
      <!-- Il piè di pagina va qui -->
    </footer>
  </body>

</html>