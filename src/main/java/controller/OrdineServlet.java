package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.IOException;
import java.util.List;

@WebServlet (value = "/ordine")
public class OrdineServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Utente utente = (Utente) request.getSession().getAttribute("utente");
        Double totale = Double.parseDouble(request.getParameter("totale"));
        Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");
        OrdineDAO ordineDAO = new OrdineDAO();
        Ordine ordine = new Ordine();
        ordine.setIdUtente(utente.getId());
        ordine.setTotale(totale);
        ordineDAO.doSave(ordine);
        List<Integer> prodotti = carrello.getProdotti();
        List<Integer> quantita = carrello.getQuantita();
        ordine.setProdotti(prodotti);
        ordine.setQuantita(quantita);
        ProdottoDAO prodottoDAO = new ProdottoDAO();
        CarrelloDAO carrelloDAO = new CarrelloDAO();
        int i = 0;
        while (i < prodotti.size()){
            int id= prodotti.get(i);
            Prodotto prodotto = prodottoDAO.doRetriveById(id);
            int quantity = quantita.get(i);
            i++;
            ordineDAO.addProdotto(prodotto,quantity,ordine);
            carrelloDAO.removeProdotto(utente,id);
        }
        request.setAttribute("ordine",ordine);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/riepilogo.jsp");
        dispatcher.forward(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
