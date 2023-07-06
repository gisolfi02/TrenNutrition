package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Utente;
import model.UtenteDAO;

import java.io.IOException;

@WebServlet(value="/SalvaModifiche")
public class SalvaModificheServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        if(nome.isEmpty() || cognome.isEmpty() || username.isEmpty() || email.isEmpty() || telefono.isEmpty()){
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/datiPersonali.jsp?modifica=1");
            dispatcher.forward(request,response);
        }else {
            int civico = Integer.parseInt(request.getParameter("civico"));
            String via = request.getParameter("via");
            String CAP = request.getParameter("cap");
            int id = Integer.parseInt(request.getParameter("id"));
            UtenteDAO utenteDAO = new UtenteDAO();
            Utente utente = utenteDAO.doRetrieveById(id);
            utente.setNome(nome);
            utente.setCognome(cognome);
            utente.setUsername(username);
            utente.setEmail(email);
            utente.setTelefono(telefono);
            utente.setVia(via);
            utente.setNcivico(civico);
            utente.setCAP(CAP);
            utenteDAO.doUpdate(utente);
            request.getSession().setAttribute("utente", utente);
            RequestDispatcher dispatcher = request.getRequestDispatcher("account.jsp");
            dispatcher.forward(request, response);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
