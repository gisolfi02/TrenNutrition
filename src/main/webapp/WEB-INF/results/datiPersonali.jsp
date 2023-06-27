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
  <script type="text/javascript">
    function validateForm() {
      let email = document.getElementById("email").value;
      let password = document.getElementById("password").value;
      let emailPattern = /^([a-z0-9_\.-]+@[a-z\d\.-]+\.[a-z\.]{2,6})$/;
      let passwordPattern = /^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[^\w\d\s:])([^\s]){8,16}$/;

      if (!emailPattern.test(email)) {
        alert("Email non valida");
        return false;
      }

      if (!passwordPattern.test(password)) {
        alert("La password deve contenere almeno 1 numero, 1 carattere maiuscolo, 1 minuscolo, 1 carattere non alfanumerico e non deve contenere spazi");
        return false;
      }

      return true;
    }
    function passwordToggle(){
      let password = document.getElementById("password");
      let icon = document.getElementById("showpassword");
      if(password.type==="password"){
        password.type="text";
        icon.className = "fa-regular fa-eye";
      }else{
        password.type="password";
        icon.className = "fa-regular fa-eye-slash";
      }
    }
  </script>
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
    </ul>
  </div>
</section>


<main>
  <!-- Il contenuto della pagina va qui -->
  <form action="SalvaModifiche" method="post">
    <label><b>Nome</b></label><br>
    <input type="text" name="nome" value="${utente.nome}"><br>
    <label><b>Cognome</b></label>
    <input type="text" name="cognome" value="${utente.cognome}"><br>
    <label><b>Username</b></label>
    <input type="text" name="username" value="${utente.username}"><br>
    <label><b>Email</b></label>
    <input type="email" name="email" id="email" value="${utente.email}" style="width: 250px"><br>
    <label><b>Telefono</b></label>
    <input type="text" name="telefono" value="${utente.telefono}"><br>
    <fieldset>
        <legend><b>Indirizzo</b></legend>
        <label><b>Via</b></label>
        <input type="text" name="via" value="${utente.via}"><br>
        <label><b>N. Civico</b></label>
        <input type="text" name="civico" value="${utente.ncivico}"><br>
        <label><b>CAP</b></label>
        <input type="text" name="cap" value="${utente.CAP}"><br>
    </fieldset>
    <input type="hidden" name ="id" value="${utente.id}">
    <input type="submit" value="Salva Modifiche">
  </form>
</main>

<footer>
  <!-- Il piè di pagina va qui -->
</footer>
</body>

</html>