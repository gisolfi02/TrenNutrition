package model;

import java.util.HashMap;
import java.util.List;

public class Carrello {
    private int idCarrello;
    private HashMap<Integer,Integer> prodotti;

    public HashMap<Integer, Integer> getProdotti() {
        return prodotti;
    }

    public void setProdotti(HashMap<Integer, Integer> prodotti) {
        this.prodotti = prodotti;
    }

    public int getIdCarrello() {
        return idCarrello;
    }

    public void setIdCarrello(int idCarrello) {
        this.idCarrello = idCarrello;
    }

}
