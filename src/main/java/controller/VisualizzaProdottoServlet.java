package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Prodotto;
import model.ProdottoDAO;

import java.io.IOException;

@WebServlet (value = "/visualizza")
public class VisualizzaProdottoServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProdottoDAO prodottoDAO = new ProdottoDAO();
        Prodotto prodotto = prodottoDAO.doRetriveById(id);
        request.setAttribute("prodotto", prodotto);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Prodotto.jsp");
        dispatcher.forward(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
