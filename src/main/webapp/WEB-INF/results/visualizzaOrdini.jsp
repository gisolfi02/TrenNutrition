<%@ page import="model.Ordine" %>
<%@ page import="java.util.List" %>
<%@ page import="model.ProdottoDAO" %>
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
      <jsp:include page="navbar_footer/navbar.jsp"/>

      <main>
          <%
            List<Ordine> ordini = (List<Ordine>) request.getAttribute("ordini");
            if(ordini != null){
              if(ordini.isEmpty()){%>
              <div class="vuoto">
                 <h2>Non hai ancora effettuato ordini</h2>
              </div>
              <%}else {%>
            <div class="ordini">
              <%for(Ordine o : ordini){%>
              <div class="cornice">
                <a href="http://localhost:8080/Gisolfi_Merola_pj_war_exploded/visualizzaordine?num=<%=o.getNumeroOrdine()%>" style="text-decoration: none">
                  <div>
                    <h4>Ordine Numero: <%=o.getNumeroOrdine()%></h4>
                    <h6>Totale: <%=o.getTotale()%>€</h6>
                  </div>
                </a>
              </div>
                <%}%>
            </div>
              <%}
            }else {%>
              <h2>Non hai ancora effettuato ordini</h2>
            <%}%>
      </main>
      <button onclick="scrollToTop()" id="scrollToTop"><i class="fa-solid fa-arrow-up fa-2xl"></i></button>
    </div>
    <jsp:include page="navbar_footer/footer.jsp" />
  </body>
</html>
