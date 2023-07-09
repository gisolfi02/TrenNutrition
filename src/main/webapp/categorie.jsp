<%@ page import="model.Categoria" %>
<%@ page import="java.util.List" %>
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
        <div class="categorie">
          <%
            List<Categoria> categorie = (List<Categoria>) request.getServletContext().getAttribute("categorie");
            for(Categoria c: categorie) {%>
          <a href = "http://localhost:8080/Gisolfi_Merola_pj_war_exploded/categoria?cat=<%=c.getId()%>" class="categoria">
              <h2><%=c.getNome()%></h2 >
          </a>

            <%}%>
        </div>
      </main>
      <button onclick="scrollToTop()" id="scrollToTop"><i class="fa-solid fa-arrow-up fa-2xl"></i></button>
    </div>

    <jsp:include page="WEB-INF/results/navbar_footer/footer.jsp" />
  </body>
</html>
