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
                    con.prepareStatement("INSERT INTO prodottiordine(NumOrdine,idUtente,idProdotto,nomeProdotto,quantita,prezzoAcquisto) VALUES (?,?,?,?,?,?)");
            ps.setInt(1, o.getNumeroOrdine());
            ps.setInt(2, o.getIdUtente());
            ps.setInt(3,p.getId());
            ps.setString(4,p.getNome());
            ps.setInt(5,quantita);
            ps.setDouble(6,p.getPrezzo());
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
            PreparedStatement ps = con.prepareStatement("SELECT idProdotto, nomeProdotto,quantita, prezzoAcquisto FROM prodottiordine WHERE idUtente = ? and NumOrdine=?");
            ps.setInt(1, o.getIdUtente());
            ps.setInt(2,o.getNumeroOrdine());
            ResultSet rs = ps.executeQuery();
            List<Integer> idProdotti = new ArrayList<>();
            List<Integer> quantitaProdotti = new ArrayList<>();
            List<String> nomeProdotti = new ArrayList<>();
            List<Double> prezziProdotti = new ArrayList<>();
            while (rs.next()) {
                idProdotti.add(rs.getInt(1));
                nomeProdotti.add(rs.getString(2));
                quantitaProdotti.add(rs.getInt(3));
                prezziProdotti.add(rs.getDouble(4));
            }
            o.setIdProdotti(idProdotti);
            o.setNomeProdotti(nomeProdotti);
            o.setQuantita(quantitaProdotti);
            o.setPrezziProdotti(prezziProdotti);
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
