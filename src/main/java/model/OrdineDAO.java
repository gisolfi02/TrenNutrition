package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrdineDAO {
    public void doSave(Ordine o){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("INSERT INTO ordine(idUtente,Tot) VALUES (?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, o.getIdUtente());
            ps.setDouble(2, o.getTotale());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int numOrdine = rs.getInt(1);
            o.setNumeroOrdine(numOrdine);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addProdotto(Prodotto p, int quantita, Ordine o){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("INSERT INTO prodottiordine(NumOrdine,idUtente,idProdotto,quantita,prezzoAcquisto) VALUES (?,?,?,?,?)");
            ps.setInt(1, o.getNumeroOrdine());
            ps.setInt(2, o.getIdUtente());
            ps.setInt(3,p.getId());
            ps.setInt(4,quantita);
            ps.setDouble(5,p.getPrezzo());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Ordine> doRetriveByUtente(Utente u){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT idUtente, NumOrdine, Tot FROM ordine WHERE idUtente = ?");
            ps.setInt(1, u.getId());
            ResultSet rs = ps.executeQuery();
            List<Ordine> ordini = new ArrayList<>();
            while (rs.next()) {
                Ordine ordine = new Ordine();
                ordine.setIdUtente(rs.getInt(1));
                ordine.setNumeroOrdine(rs.getInt(2));
                ordine.setTotale(rs.getDouble(3));
                ordini.add(ordine);
            }
            return ordini;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Ordine doRetriveProdottiOrdine(Ordine o){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT idProdotto, quantita FROM prodottiordine WHERE idUtente = ? and NumOrdine=?");
            ps.setInt(1, o.getIdUtente());
            ps.setInt(2,o.getNumeroOrdine());
            ResultSet rs = ps.executeQuery();
            List<Integer> prodotti = new ArrayList<>();
            List<Integer> quantita = new ArrayList<>();
            while (rs.next()) {
                prodotti.add(rs.getInt(1));
                quantita.add(rs.getInt(2));
            }
            o.setProdotti(prodotti);
            o.setQuantita(quantita);
            return o;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Ordine doRetriveByNumeroOrdine(int numOrdine){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT idUtente, NumOrdine, Tot FROM ordine WHERE NumOrdine = ?");
            ps.setInt(1, numOrdine);
            ResultSet rs = ps.executeQuery();
            Ordine ordine = new Ordine();
            if (rs.next()) {
                ordine.setIdUtente(rs.getInt(1));
                ordine.setNumeroOrdine(rs.getInt(2));
                ordine.setTotale(rs.getDouble(3));
            }
            return ordine;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
