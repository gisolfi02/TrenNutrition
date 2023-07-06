package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet (value = "/ordine")
public class OrdineServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String via = request.getParameter("via");
        String civico = request.getParameter("civico");
        String cap = request.getParameter("cap");
        String carta = request.getParameter("carta");
        String cvc = request.getParameter("cvc");
        String scadenza = request.getParameter("scadenza");
        String nome = request.getParameter("nome");
        if(via.isEmpty() || civico.isEmpty() || cap.isEmpty() || carta.isEmpty() || cvc.isEmpty() || scadenza.isEmpty() || nome.isEmpty()){
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/checkout.jsp?checkout=1");
            dispatcher.forward(request,response);
        }
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
        ordine.setIdProdotti(prodotti);
        ordine.setQuantita(quantita);
        ProdottoDAO prodottoDAO = new ProdottoDAO();
        CarrelloDAO carrelloDAO = new CarrelloDAO();
        List<String> nomeProdotti = new ArrayList<>();
        List<Double> prezziProdotti = new ArrayList<>();
        int i = 0;
        while (i < prodotti.size()){
            int id= prodotti.get(i);
            Prodotto prodotto = prodottoDAO.doRetriveById(id);
            nomeProdotti.add(prodotto.getNome());
            prezziProdotti.add(prodotto.getPrezzo());
            int quantity = quantita.get(i);
            i++;
            ordineDAO.addProdotto(prodotto,quantity,ordine);
            carrelloDAO.removeProdotto(utente,id);
        }
        ordine.setNomeProdotti(nomeProdotti);
        ordine.setPrezziProdotti(prezziProdotti);
        request.setAttribute("ordine",ordine);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/riepilogo.jsp");
        dispatcher.forward(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
