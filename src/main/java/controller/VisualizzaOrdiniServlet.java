package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Ordine;
import model.OrdineDAO;
import model.Utente;

import java.io.IOException;
import java.util.List;

@WebServlet(value="/ordini")
public class VisualizzaOrdiniServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Utente utente = (Utente) request.getSession().getAttribute("utente");
        OrdineDAO ordineDAO = new OrdineDAO();
        List<Ordine> ordini = ordineDAO.doRetriveByUtente(utente);
        for(int i = 0; i < ordini.size(); i++){
            Ordine ordine = ordini.get(i);
            ordine = ordineDAO.doRetriveProdottiOrdine(ordine);
            ordini.set(i,ordine);
        }
        request.setAttribute("ordini",ordini);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/visualizzaOrdini.jsp");
        dispatcher.forward(request,response);
    }
}
