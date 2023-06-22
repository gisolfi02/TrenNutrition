<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <c:choose> <%-- Questo if invece serve per vedere se l'utente ha fatto l'accesso. Se ha fatto l'accesso non mostro più form--%>
        <c:when test="${empty utente || utente == null}">
            <h1>ACCEDI</h1><br>
            <c:if test="${param.accesso == 0}">
                <h3>Email o password errata</h3><br>
            </c:if>
            <form action="Login" method="get">
                <label><b>Email</b></label> <br>
                <input type="email" name="email" id="email" required><br><br>
                <label><b>Password</b></label><br>
                <input type="password" name="password" id="password" required><br><br>
                <input type="submit" name="submit" value="Accedi">
                <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/registrazione.html" style="text-decoration: none">Crea un account</a>
            </form>
        </c:when>
        <c:otherwise>
            <c:choose>
                <c:when test="${utente.admin != true}"> <%--Se l'utente che ha fatto l'accesso non è l'admin aggiungo i link per vedere gli ordini e i dati personali --%>
                    <h1> Bentornato ${utente.nome}, questa e' la tua pagina riservata</h1>
                    <ul>
                        <li><a href="#">I tuoi ordini</a></li>
                        <li><a href="#">Le tue informazioni personali</a></li>
                    </ul>
                    <form action="Login?esci=1" method="post">
                        <input type="submit" name="submit" value="Esci">
                    </form>
                </c:when>
                <c:otherwise>
                    <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/Add">Aggiungi Prodotto</a>
                    <form action="Login?esci=1" method="post">
                        <input type="submit" name="submit" value="Esci">
                    </form>
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>
</main>

<footer>
    <!-- Il piè di pagina va qui -->
</footer>
</body>

</html>