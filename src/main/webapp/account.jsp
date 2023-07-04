<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <c:choose> <%-- Questo if invece serve per vedere se l'utente ha fatto l'accesso. Se ha fatto l'accesso non mostro più form--%>
                        <c:when test="${empty utente || utente == null}">
                            <c:if test="${param.accesso == 0}">
                                <script>alert("Email o Password errati!")</script>
                            </c:if>
                            <section class="section-logIn">
                                <div class="form-box">
                                    <form action="Login" method="get" autocomplete="off">
                                        <h1>ACCEDI</h1>
                                        <div class="input-box">
                                            <i class="fa-solid fa-envelope"></i>
                                            <label>Email</label>
                                            <input type="email" name="email" id="email" required>
                                        </div>
                                        <div class="input-box">
                                            <i class="fa-solid fa-lock"></i>
                                            <label>Password</label>
                                            <input type="password" name="password" id="password" required>
                                        </div>
                                        <button type="submit" name="submit" value="Accedi" class="login-button">Accedi</button>
                                        <div class="register">
                                            <p>Non hai un account?<a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/registrazione.html"> Registrati</a> </p>
                                        </div>
                                    </form>
                                </div>
                            </section>
                        </c:when>

                    <c:otherwise>
                        <c:choose>
                            <c:when test="${utente.admin != true}"> <%--Se l'utente che ha fatto l'accesso non è l'admin aggiungo i link per vedere gli ordini e i dati personali --%>
                               <section class="section-user">
                                    <div class="form-box-user">
                                        <h2> Bentornato <b>${utente.nome}</b>, questa &egrave la tua pagina riservata</h2>
                                        <ul>
                                            <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/ordini">I tuoi ordini</a></li>
                                            <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/info">Le tue informazioni personali</a></li>
                                        </ul>
                                        <form action="Login?esci=1" method="post">
                                            <button type="submit" name="submit" value="Esci">Esci</button>
                                        </form>
                                   </div>
                               </section>
                            </c:when>
                            <c:otherwise>
                                <section class="section-user">
                                <div class="form-box-user">
                                <ul>
                                    <li><a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/Add">Aggiungi Prodotto</a></li>
                                </ul>
                                <form action="Login?esci=1" method="post">
                                    <button type="submit" name="submit" value="Esci">Esci</button>
                                </form>
                                </div>
                                </section>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
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