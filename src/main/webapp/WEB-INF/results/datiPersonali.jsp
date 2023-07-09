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
    <script>
      function validateForm(){
        let email = document.getElementById("email").value;
        let emailPattern = /^([a-z0-9_\.-]+@[a-z\d\.-]+\.[a-z\.]{2,6})$/;

        if (!emailPattern.test(email)) {
          $(function(){
            $(" #email").css("border-bottom","2px solid #ff0000")
            alert("Email non valida")
          })
          return false;
        }else {
          $(".input-box-registration #email").css("border-bottom","2px solid green")
          return true;
        }
      }

    </script>
  </head>
  <body>
    <div class="content">
      <jsp:include page="navbar_footer/navbar.jsp"/>

      <main>
       <section class="section-registration">
         <div class="form-box-registration">
            <form onsubmit="return validateForm()" action="SalvaModifiche" method="post" autocomplete="off">
              <div class="left-div">
                <div class="input-box-registration">
                  <label><b>Nome</b></label>
                  <input type="text" name="nome" value="${utente.nome}" required>
                </div>
                <div class="input-box-registration">
                  <label><b>Cognome</b></label>
                  <input type="text" name="cognome" value="${utente.cognome}" required>
                </div>
                <div class="input-box-registration">
                  <label><b>Username</b></label>
                  <input type="text" name="username" value="${utente.username}" required>
                </div>
                <div class="input-box-registration">
                  <label><b>Email</b></label>
                  <input type="email" name="email" id="email" value="${utente.email}" required>
                </div>
                <div class="input-box-registration">
                  <label><b>Telefono</b></label>
                  <input type="text" name="telefono" value="${utente.telefono}" required>
                </div>
              </div>
              <div class="right-div">
                <fieldset class="fieldset-custom">
                    <legend><b>Indirizzo</b></legend>
                  <div class="input-box-registration">
                    <label><b>Via</b></label>
                    <input type="text" name="via" value="${utente.via}">
                  </div>
                  <div class="input-box-registration">
                    <label><b>N. Civico</b></label>
                    <input type="text" name="civico" value="${utente.ncivico}">
                  </div>
                  <div class="input-box-registration">
                    <label><b>CAP</b></label>
                    <input type="text" name="cap" value="${utente.CAP}">
                  </div>
                </fieldset>
              </div>
              <input type="hidden" name ="id" value="${utente.id}" required>
              <div class="button-container">
                <button type="submit">Salva Modifiche</button>
              </div>
            </form>
         </div>
       </section>
      </main>
      <button onclick="scrollToTop()" id="scrollToTop"><i class="fa-solid fa-arrow-up fa-2xl"></i></button>
      <c:if test="${param.modifica==1}">
        <script>
          alert("I campi nome, cognome, username, email e telefono non possono essere vuoti")
        </script>
      </c:if>
    </div>

    <jsp:include page="navbar_footer/footer.jsp"/>
  </body>
</html>