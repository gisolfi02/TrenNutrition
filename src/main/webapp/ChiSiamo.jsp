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

            <jsp:include page="WEB-INF/results/navbar_footer/navbar.jsp" />

            <main>
                <section>
                        <div class="colonne">
                            <img src="https://powerhousenutrition.it/wp-content/uploads/2021/03/integratori-alimentari-powerhouse-nutrition.jpg" alt="Immagine Chi siamo">
                           <div>
                            <h2 style="text-align: center">Tren Nutrition</h2>
                            <p>Ciao a tutti, ci presentiamo, noi siamo Andrea e Antonio, i creatori di Tren Nutrition.<br> Siamo due studenti dell'università di Salerno che hanno realizzato questo sito per tutti coloro, come noi, sono appassionati di palestra e cercano i giusti integratori per poter aumentare la propria massa muscolare e forza.<br>Tren nutrition
                                offre prodotti di ottima qualità provenienti dai migliori fornitori del settore come "Prozis" e "Bulk". L'idea nasce per evitare di dover perdere ore e ore a navigare sul web alla ricerca del giusto integratore.
                                Qui su TrenNutrition li potrete trovare tutti, basta cercare. Quindi, cosa aspetti, corri a comprare i tuoi integratori!</p>
                           </div>
                        </div>
                </section>
            </main>
            <button onclick="scrollToTop()" id="scrollToTop"><i class="fa-solid fa-arrow-up fa-2xl"></i></button>
        </div>

        <jsp:include page="WEB-INF/results/navbar_footer/footer.jsp" />
    </body>
</html>
