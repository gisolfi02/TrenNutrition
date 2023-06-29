package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UtenteDAO {
    public Utente doRetrieveByEmailPassword(String email, String password){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT id, username, passwordhash, email, nome, cognome, Tel, Via, Ncivico, CAP, admin FROM utente WHERE email = ? AND passwordhash =SHA1(?)");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                Utente user = new Utente();
                user.setId(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setNome(rs.getString(5));
                user.setCognome(rs.getString(6));
                user.setTelefono(rs.getString(7));
                user.setVia(rs.getString(8));
                user.setNcivico(rs.getInt(9));
                user.setCAP(rs.getString(10));
                user.setAdmin(rs.getBoolean(11));
                return user;
            }else
                return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doSave(Utente utente){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO utente (username, passwordhash, email, nome, cognome, Tel, Via, Ncivico, CAP, admin) VALUES(?,?,?,?,?,?,?,?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, utente.getUsername());
            ps.setString(2, utente.getPassword());
            ps.setString(3, utente.getEmail());
            ps.setString(4, utente.getNome());
            ps.setString(5, utente.getCognome());
            ps.setString(6,utente.getTelefono());
            ps.setString(7,utente.getVia());
            ps.setInt(8,utente.getNcivico());
            ps.setString(9,utente.getCAP());
            ps.setBoolean(10,utente.isAdmin());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int id = rs.getInt(1);
            utente.setId(id);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public List<Utente> doRetriveAll(){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT id,username,passwordhash,email,nome,cognome,Tel,Via,Ncivico,CAP,admin FROM utente");
            ResultSet rs = ps.executeQuery();
            List<Utente> utenti = new ArrayList<>();
            while(rs.next()){
                Utente user = new Utente();
                user.setId(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setNome(rs.getString(5));
                user.setCognome(rs.getString(6));
                user.setTelefono(rs.getString(7));
                user.setVia(rs.getString(8));
                user.setNcivico(rs.getInt(9));
                user.setCAP(rs.getString(10));
                user.setAdmin(rs.getBoolean(11));
                utenti.add(user);
            }
            return utenti;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Utente doRetrieveById(int id){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT id, username, passwordhash, email, nome, cognome, Tel, Via, Ncivico, CAP, admin FROM utente WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                Utente user = new Utente();
                user.setId(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setNome(rs.getString(5));
                user.setCognome(rs.getString(6));
                user.setTelefono(rs.getString(7));
                user.setVia(rs.getString(8));
                user.setNcivico(rs.getInt(9));
                user.setCAP(rs.getString(10));
                user.setAdmin(rs.getBoolean(11));
                return user;
            }else
                return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doUpdate(Utente utente){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "UPDATE utente SET nome=?, cognome=?, username=?, email=?, Tel=?, Via=?, Ncivico=?,CAP=?  WHERE id=?");
            ps.setString(1, utente.getNome());
            ps.setString(2, utente.getCognome());
            ps.setString(3, utente.getUsername());
            ps.setString(4, utente.getEmail());
            ps.setString(5, utente.getTelefono());
            ps.setString(6,utente.getVia());
            ps.setInt(7,utente.getNcivico());
            ps.setString(8,utente.getCAP());
            ps.setInt(9,utente.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Utente doRetriveByEmail(String email){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT id, username, passwordhash, email, nome, cognome, Tel, Via, Ncivico, CAP, admin FROM utente WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                Utente user = new Utente();
                user.setId(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setNome(rs.getString(5));
                user.setCognome(rs.getString(6));
                user.setTelefono(rs.getString(7));
                user.setVia(rs.getString(8));
                user.setNcivico(rs.getInt(9));
                user.setCAP(rs.getString(10));
                user.setAdmin(rs.getBoolean(11));
                return user;
            }else
                return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
