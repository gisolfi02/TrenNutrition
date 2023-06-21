<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

<head>
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
                    <li><a href="#">Utenti</a></li> <%-- Se è un adimn aggiungo un altro elemento al menù per poter gestire gli utenti --%>
                </c:when>
                <c:otherwise>
                    <a href="#"><img src="img/shopping-cart-svgrepo-com.svg" class="logo" alt=""></a>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</selection>

<main>
    <!-- Il contenuto della pagina va qui -->
    <!-- Carico tutti i prodotti dal server -->
    <f:forEach items="${prodotti}" var="prodotto">
        <div class = "prodotti">
            <img src="img/${prodotto.nome}${prodotto.id}.jpg"><br>
            <p>${prodotto.prezzo}</p>
            <button>Add to cart</button>
        </div>
    </f:forEach>
</main>

<footer>
    <!-- Il piè di pagina va qui -->
</footer>
</body>

</html>