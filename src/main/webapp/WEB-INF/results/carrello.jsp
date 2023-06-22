<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Prodotto" %>
<%@ page import="java.util.*" %>
<%@ page import="model.Utente" %>
<%@ page import="model.Carrello" %>
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
  <%
    Utente utente = (Utente) request.getSession().getAttribute("utente");
  if(utente == null){%>
   <h3>Per visualizzare il carrello <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/account.jsp">accedi</a> o <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/registrazione.html">registrati</a></h3>
<%}else{
    Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");
    List<Prodotto> prodotti = (List<Prodotto>) request.getAttribute("prodottiCarrello");
    List<Integer> quantita = carrello.getQuantita();
    if(prodotti != null){
      if(prodotti.isEmpty()){%>
      <h3>Il carrello e' vuoto, prova ad aggiungere qualcosa</h3>
    <%}else{
      Double totale = 0D;
      int i = 0;
      for(Prodotto p : prodotti){
        totale+=p.getPrezzo()*quantita.get(i);%>
    <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/visualizza?id=${prodotto.id}" style="text-decoration: none">
        <div>
        <img src="img/<%=p.getNome()%><%=p.getId()%>.jpg">
        <h3><%=p.getNome()%></h3>
        <h6><%=p.getPrezzo()%>€</h6>
        <h6>Quantità:<%=quantita.get(i)%></h6>
        <form action="rimuovi" method="post">
          <input type="hidden" name="id" value="<%=p.getId()%>">
          <input type="submit" value="Rimuovi dal carrello">
        </form>
        <%i++;}%>
        </div><br>
   <a/>
      <h4>Totale: <%=totale%>€</h4>
    <%}
    }else {%>
      <h3>Il carrello e' vuoto, prova ad aggiungere qualcosa</h3
        <%}
  }%>
</main>

<footer>
  <!-- Il piè di pagina va qui -->
</footer>
</body>
</html>
