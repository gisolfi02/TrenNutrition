package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Carrello;
import model.CarrelloDAO;
import model.Utente;

import java.io.IOException;

@WebServlet(value = "/rimuovi")
public class RimuoviDalCarrelloServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Utente utente = (Utente) request.getSession().getAttribute("utente");
        CarrelloDAO carrelloDAO = new CarrelloDAO();
        carrelloDAO.removeProdotto(utente,id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("carrello");
        dispatcher.forward(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
