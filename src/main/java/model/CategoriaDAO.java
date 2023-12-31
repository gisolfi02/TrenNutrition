package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class CategoriaDAO {
    public List<Categoria> doRetrieveAll(){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT id, nome FROM categoria");
            ResultSet rs = ps.executeQuery();
            List<Categoria> categorie = new ArrayList<>();
            while (rs.next()) {
                Categoria c = new Categoria();
                c.setId(rs.getInt(1));
                c.setNome(rs.getString(2));
                categorie.add(c);
            }
            return categorie;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
