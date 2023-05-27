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
import model.UtenteDAO;

import java.io.IOException;

@WebServlet(value ="/Login")


//Questa servlet gestisce il login e il logout dal sito
public class LoginServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("esci")!=null && request.getParameter("esci").equals("1")){ //qui controllo se l'utente che ha già fatto l'accesso vuole uscire
            request.getSession().invalidate(); //tolgo l'utente dalla sessione, quindi faccio il logout
        }else {
            //prendo i parametri per il logni
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            UtenteDAO utenteDAO = new UtenteDAO();
            Utente utente = utenteDAO.doRetrieveByEmailPassword(email, password);
            //faccio il controllo che l'utente esista (da fare)
            if (!utente.isAdmin()) { //qui controllo se l'utente è l'adim perchè l'admin non ha il carrello quindi non lo carico dal database
                CarrelloDAO carrelloDAO = new CarrelloDAO();
                Carrello carrello = carrelloDAO.doRetriveByUtente(utente);
                request.getSession().setAttribute("carrello", carrello);
            }
            request.getSession().setAttribute("utente", utente); //aggiungo l'utente alla sessione
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
