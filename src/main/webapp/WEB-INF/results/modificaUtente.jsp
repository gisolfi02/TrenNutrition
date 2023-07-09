<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
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
        <!-- Il contenuto della pagina va qui -->
        <section class="section-Modifica">
          <div class="form-box-Modifica">
            <form action="update" method="post" autocomplete="off">
              <h1>Dati da modificare</h1>
              <div class="input-box">
                <label><b>Nome</b></label>
                <input type="text" name="nome" value="${modifica.nome}" required>
              </div>
              <div class="input-box">
                <label><b>Cognome</b></label>
                <input type="text" name="cognome" value="${modifica.cognome}" required>
              </div>
              <div class="input-box">
                <label><b>Username</b></label>
                <input type="text" name="username" value="${modifica.username}" required>
              </div>
              <div class="input-box">
                <label><b>Telefono</b></label>
                <input type="number" name="telefono" value="${modifica.telefono}" required>
              </div>
              <input type="hidden" name="id" value="${modifica.id}">
              <button type="submit" class="login-button">Aggiorna</button>
            </form>
          </div>
        </section>
      </main>
      <button onclick="scrollToTop()" id="scrollToTop"><i class="fa-solid fa-arrow-up fa-2xl"></i></button>
      <c:if test="${param.errore==1}">
        <script>
          alert("I campi del form non possono essere vuoti")
        </script>
      </c:if>
    </div>

    <jsp:include page="navbar_footer/footer.jsp"/>
  </body>
</html>