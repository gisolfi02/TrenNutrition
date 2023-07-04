package model;

import java.sql.*;
import java.util.*;
public class ProdottoDAO{
    public List<Prodotto> doRetrieveAll(){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT * FROM prodotto");
            ResultSet rs = ps.executeQuery();
            List<Prodotto> prodotti = new ArrayList<>();
            while (rs.next()) {
                Prodotto p = new Prodotto();
                p.setId(rs.getInt(1));
                p.setNome(rs.getString(2));
                p.setDescrizione(rs.getString(3));
                p.setPrezzo(rs.getDouble(4));
                prodotti.add(p);
            }
            return prodotti;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Prodotto> doRetrieveByCategoria(Categoria c){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT * FROM prodotto p,categoria c WHERE c.id = ? and c.id = p.idCategoria");
            ps.setInt(1,c.getId());
            ResultSet rs = ps.executeQuery();
            List<Prodotto> prodotti = new ArrayList<>();
            while (rs.next()) {
                Prodotto p = new Prodotto();
                p.setId(rs.getInt(1));
                p.setNome(rs.getString(2));
                p.setDescrizione(rs.getString(3));
                p.setPrezzo(rs.getDouble(4));
                prodotti.add(p);
            }
            return prodotti;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Prodotto> doRetriveByOrdineUtente(Utente utente, int ordine){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT p.id, p.nome, p.descrizione, p.prezzo FROM prodotto p, prodottiOridine pr WHERE p.id = pr.idProdotto and pr.NumOrdine = ? and pr.idUtente = ?");
            ps.setInt(1,ordine);
            ps.setInt(2,utente.getId());
            ResultSet rs = ps.executeQuery();
            List<Prodotto> prodotti = new ArrayList<>();
            while (rs.next()) {
                Prodotto p = new Prodotto();
                p.setId(rs.getInt(1));
                p.setNome(rs.getString(2));
                p.setDescrizione(rs.getString(3));
                p.setPrezzo(rs.getDouble(4));
                prodotti.add(p);
            }
            return prodotti;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Prodotto doRetriveById(int id){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT * FROM prodotto WHERE id=?");
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            Prodotto p = new Prodotto();
            if(rs.next()) {
                p.setId(rs.getInt(1));
                p.setNome(rs.getString(2));
                p.setDescrizione(rs.getString(3));
                p.setPrezzo(rs.getDouble(4));
            }
            return p;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doSave(Prodotto p, int categoria){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("INSERT INTO prodotto(nome,descrizione,prezzo,idCategoria) VALUES (?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, p.getNome());
            ps.setString(2, p.getDescrizione());
            ps.setDouble(3, p.getPrezzo());
            ps.setInt(4, categoria);
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int id = rs.getInt(1);
            p.setId(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Prodotto> doRetriveByRicerca(String ricerca){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT DISTINCT p.id, p.nome, p.descrizione, p.prezzo FROM prodotto p, categoria c WHERE p.nome LIKE ? or c.nome LIKE ? and p.idCategoria = c.id");
            ps.setString(1,ricerca);
            ps.setString(2,ricerca);
            ResultSet rs = ps.executeQuery();
            List<Prodotto> prodotti = new ArrayList<>();
            while (rs.next()) {
                Prodotto p = new Prodotto();
                p.setId(rs.getInt(1));
                p.setNome(rs.getString(2));
                p.setDescrizione(rs.getString(3));
                p.setPrezzo(rs.getDouble(4));
                prodotti.add(p);
            }
            return prodotti;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void removeProdottoById(int id){
        try (Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("DELETE FROM prodotto WHERE id=?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
