package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.util.*;
import java.io.IOException;

@WebServlet (value = "/carrello")
public class VisalizzaCarelloServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Utente utente = (Utente) request.getSession().getAttribute("utente");
        if(utente != null){
            CarrelloDAO carrelloDAO = new CarrelloDAO();
            Carrello carrello = carrelloDAO.doRetriveByUtente(utente);
            List<Integer> idProdotti = carrello.getProdotti();
            List<Prodotto> prodotti = new ArrayList<>();
            if(idProdotti != null && !idProdotti.isEmpty()) {
                ProdottoDAO prodottoDAO = new ProdottoDAO();
                for (Integer id : idProdotti) {
                    Prodotto prodotto = prodottoDAO.doRetriveById(id);
                    prodotti.add(prodotto);
                }
            }
            request.setAttribute("prodottiCarrello", prodotti);
            request.getSession().setAttribute("carrello", carrello);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/carrello.jsp");
        dispatcher.forward(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
