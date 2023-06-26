package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value="/checkout")
public class CheckoutServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Double totale = Double.parseDouble(request.getParameter("totale"));
        request.setAttribute("totale", totale);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/checkout.jsp");
        dispatcher.forward(request, response);
    }
}
