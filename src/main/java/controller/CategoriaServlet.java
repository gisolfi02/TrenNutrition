package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Categoria;
import model.Prodotto;
import model.ProdottoDAO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value="/categoria")
public class CategoriaServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("cat"));
        List<Categoria> categorie = (List<Categoria>) getServletContext().getAttribute("categorie");
        ProdottoDAO prodottoDAO = new ProdottoDAO();
        List<Prodotto> prodotto = new ArrayList<>();
        for(Categoria c: categorie){
            if(c.getId() == id){
                request.setAttribute("categoria", c);
                prodotto = prodottoDAO.doRetrieveByCategoria(c);
                break;
            }
        }
        request.setAttribute("prodotticategoria", prodotto);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/categoria.jsp");
        dispatcher.forward(request,response);
    }
}
