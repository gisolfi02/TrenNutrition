package controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Utente;
import model.UtenteDAO;

import java.io.IOException;

@WebServlet (value = "/check")
public class CheckEmailServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        UtenteDAO utenteDAO = new UtenteDAO();
        Utente utente = utenteDAO.doRetriveByEmail(email);
        if (utente != null) {
            response.getWriter().write("invalid");
        }else {
            response.getWriter().write("valid");
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doGet(request,response);
    }
}
