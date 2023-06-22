package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class CarrelloDAO {
    public Carrello doRetriveByUtente(Utente utente) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT idUtente, idProdotto, quantita FROM prodotticarrello WHERE idUtente = ?");
            ps.setInt(1, utente.getId());
            ResultSet rs = ps.executeQuery();
            Carrello carrello = new Carrello();
            List<Integer> prodotti = new ArrayList<>();
            List<Integer> quantita = new ArrayList<>();
            while (rs.next()) {
                carrello.setIdCarrello(rs.getInt("idUtente"));
                prodotti.add(rs.getInt(2));
                quantita.add(rs.getInt(3));
            }
            carrello.setProdotti(prodotti);
            carrello.setQuantita(quantita);
            return carrello;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public void updateProdotto(int id,int quantita){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "UPDATE prodotticarrello SET quantita = ? WHERE idProdotto=?");
            ps.setInt(1,quantita);
            ps.setInt(2,id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addProdotto(Utente utente, int id, int quantita){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO prodotticarrello(idUtente,idProdotto,quantita) VALUES (?,?,?)");
            ps.setInt(1,utente.getId());
            ps.setInt(2,id);
            ps.setInt(3,quantita);
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void removeProdotto(Utente utente, int id){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM prodotticarrello WHERE idUtente = ? AND idProdotto = ?");
            ps.setInt(1,utente.getId());
            ps.setInt(2,id);
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("DELETE error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
