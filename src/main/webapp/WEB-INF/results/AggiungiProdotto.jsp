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

      <main id="addProdotto">
        <div class="aggiungiProdotto">
          <form method="post" action = "SaveProdotto" enctype="multipart/form-data" autocomplete="off" >
            <h3>Nuovo Prodotto</h3>
            <div class="preview">
              <img src="img/noImage.png" id="preview">
              <input type="file" name="file" onchange="photoPreview()" id="file" required>
              <label for="file"><i class="fa-regular fa-image"></i> Seleziona un'immagine</label>
            </div>
            <div class="input">
              <label>Nome Prodotto: </label>
              <input type="text" name="nome" required>
            </div>
            <div class="input">
              <label>Descrizione: </label>
              <textarea cols="40" rows="10" name="descrizione" style="resize: none" required></textarea>
            </div>
            <div class="input">
              <label>Prezzo: </label>
              <input type="text" name="prezzo" required>
            </div>
            <div class="input">
            <label>Categoria: </label>
            <select name="categoria">
              <c:forEach items="${categorie}" var="categoria">
                <option value="${categoria.nome}">${categoria.nome}</option>
              </c:forEach>
            </select>
            </div>
            <div class="button-container">
            <button type="submit" value="Aggiungi">Aggiungi</button>
            </div>
          </form>
        </div>
      </main>
      <button onclick="scrollToTop()" id="scrollToTop"><i class="fa-solid fa-arrow-up fa-2xl"></i></button>
    </div>

    <jsp:include page="navbar_footer/footer.jsp"/>
  </body>
</html>