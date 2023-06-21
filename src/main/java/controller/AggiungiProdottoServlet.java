package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Categoria;
import model.CategoriaDAO;
import model.Prodotto;
import model.ProdottoDAO;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@MultipartConfig
@WebServlet(value = "/AddProdotto")
public class AggiungiProdottoServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("file");
        String nome = request.getParameter("nome");
        String descrizione = request.getParameter("descrizione");
        Double prezzo = Double.parseDouble(request.getParameter("prezzo"));
        String categoria = request.getParameter("categoria");
        int idCategoria=0;
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        List<Categoria> categorie = categoriaDAO.doRetrieveAll();
        for (Categoria c : categorie){
            if(categoria.equalsIgnoreCase(c.getNome()))
                idCategoria = c.getId();
        }
        Prodotto prodotto = new Prodotto();
        prodotto.setNome(nome);
        prodotto.setDescrizione(descrizione);
        prodotto.setPrezzo(prezzo);
        ProdottoDAO prodottoDAO = new ProdottoDAO();
        prodottoDAO.doSave(prodotto,idCategoria);

        String fileName;
        fileName = prodotto.getNome()+prodotto.getId();
        Path pathDestinazione = Paths.get(getServletContext().getRealPath("img"+File.separator + fileName+".jpg"));
        InputStream fileInputStream = filePart.getInputStream();
        Files.copy(fileInputStream,pathDestinazione);
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
