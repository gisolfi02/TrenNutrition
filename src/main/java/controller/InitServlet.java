package controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Categoria;
import model.CategoriaDAO;

import java.util.*;

@WebServlet (loadOnStartup = 0)
//Questa servlet serve per caricare le categorie di prodotti dal database e metterli nel conteso per usarle
public class InitServlet extends HttpServlet {
    public void init(HttpServletResponse response, HttpServletRequest request) throws ServletException {
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        List<Categoria> categorie = categoriaDAO.doRetrieveAll();
        ServletContext context = request.getServletContext();
        context.setAttribute("categorie",categorie);
        super.init();
    }
}
