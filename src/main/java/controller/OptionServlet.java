package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Carrello;
import model.CarrelloDAO;
import model.ProdottoDAO;
import model.Utente;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet (value = "/option")
public class OptionServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String option = request.getParameter("option");
        int id = Integer.parseInt(request.getParameter("id"));
        if(option.equalsIgnoreCase("aggiungi")){
            Utente utente = (Utente) request.getSession().getAttribute("utente");
            if (utente == null) {
                request.setAttribute("richiesta", 0);
            } else {
                CarrelloDAO carrelloDAO = new CarrelloDAO();
                Carrello carrello = carrelloDAO.doRetriveByUtente(utente);
                int quantita = Integer.parseInt(request.getParameter("quantita"));
                List<Integer> prodotticarrello = carrello.getProdotti();
                List<Integer> q = carrello.getQuantita();
                if (prodotticarrello != null) {
                    if (prodotticarrello.contains(id)) {
                        int index = prodotticarrello.indexOf(id);
                        quantita += q.get(index);
                        q.set(index, quantita);
                        carrello.setQuantita(q);
                        carrelloDAO.updateProdotto(id, quantita);
                    } else {
                        prodotticarrello.add(id);
                        q.add(quantita);
                        carrello.setQuantita(q);
                        carrello.setProdotti(prodotticarrello);
                        carrelloDAO.addProdotto(utente, id, quantita);
                        request.setAttribute("aggiunta", 1);
                    }
                } else{
                    prodotticarrello = new ArrayList<>();
                    q = new ArrayList<>();
                    prodotticarrello.add(id);
                    q.add(quantita);
                    carrello.setQuantita(q);
                    carrello.setProdotti(prodotticarrello);
                    carrelloDAO.addProdotto(utente, id, quantita);
                    request.setAttribute("aggiunta", 1);
                }
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("visualizza");
            dispatcher.forward(request, response);
        }else {
            ProdottoDAO prodottoDAO = new ProdottoDAO();
            prodottoDAO.removeProdottoById(id);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/rimosso.jsp");
            dispatcher.forward(request,response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
