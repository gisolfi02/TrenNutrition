package model;


import java.util.List;

public class Carrello {
    private int idCarrello;

    private List<Integer> prodotti;
    private List<Integer> quantita;

    public List<Integer> getProdotti() {
        return prodotti;
    }

    public void setProdotti(List<Integer> prodotti) {
        this.prodotti = prodotti;
    }

    public List<Integer> getQuantita() {
        return quantita;
    }

    public void setQuantita(List<Integer> quantita) {
        this.quantita = quantita;
    }

    public int getIdCarrello() {
        return idCarrello;
    }

    public void setIdCarrello(int idCarrello) {
        this.idCarrello = idCarrello;
    }

}
