package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class CarrelloDAO {
    public Carrello doRetriveByUtente(Utente utente){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT idUtente, idProdotto, quantita FROM prodotticarrello WHERE idUtente =?");
            ps.setInt(1, utente.getId());
            ResultSet rs = ps.executeQuery();
            Carrello carrello = new Carrello();
            if(rs.next()){
                carrello.setIdCarrello(rs.getInt(1));
                HashMap<Integer,Integer> prodotti = new HashMap<>();
                while (rs.next()){
                    prodotti.put(rs.getInt(2),rs.getInt(3));
                }
                carrello.setProdotti(prodotti);
                return carrello;
            }
            return carrello;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
