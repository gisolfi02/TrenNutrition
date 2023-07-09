<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Prodotto" %>
<%@ page import="java.util.*" %>
<%@ page import="model.Utente" %>
<%@ page import="model.Carrello" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.math.RoundingMode" %>
<%@ page import="model.Ordine" %>
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
      <jsp:include page="navbar_footer/navbar.jsp" />
      <main>
        <!-- Il contenuto della pagina va qui -->
        <%
          List<Boolean> esisteProdotti = (List<Boolean>) request.getAttribute("esiste");
          Ordine ordine = (Ordine) request.getAttribute("ordine");
          List<Integer> idProdotti = ordine.getIdProdotti();
          List<String> nomeProdotti = ordine.getNomeProdotti();
          List<Double> prezziProdotti = ordine.getPrezziProdotti();
          List<Integer> quantita = ordine.getQuantita();
          int i = 0;%>
        <div class="ordine">
          <h1>Riepilogo Ordine N: <%=ordine.getNumeroOrdine()%></h1>
          <div class="prodotti">
            <%
            for(Integer id: idProdotti){%>
              <div class="bordo">
                <%if(esisteProdotti.get(i)){%>
                  <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/visualizza?id=<%=id%>" style="text-decoration: none"><img src="img/<%=nomeProdotti.get(i)%><%=id%>.jpg"></a>
                <%}else{%>
                  <img src="img/<%=nomeProdotti.get(i)%><%=id%>.jpg">
                <%}%>
                  <h3><%=nomeProdotti.get(i)%></h3>
                  <div class="info">
                    <h6><%=prezziProdotti.get(i)%>€</h6>
                    <h6>Quantità: <%=quantita.get(i)%></h6>
                  </div>
              </div>
              <%i++;}
              %>
          </div>
          <div class="riepilogo">
            <h4>Totale: <%=ordine.getTotale()%>€</h4>
          </div>
        </div>
      </main>
      <button onclick="scrollToTop()" id="scrollToTop"><i class="fa-solid fa-arrow-up fa-2xl"></i></button>
    </div>
    <jsp:include page="navbar_footer/footer.jsp" />
  </body>
</html>
