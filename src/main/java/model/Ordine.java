package model;

import java.util.List;

public class Ordine {
    private int numeroOrdine;
    private Double totale;
    private int idUtente;
    private List<Integer> idProdotti;
    private List<String> nomeProdotti;
    private List<Double> prezziProdotti;
    private List<Integer> quantita;

    public int getNumeroOrdine() {
        return numeroOrdine;
    }

    public void setNumeroOrdine(int numeroOrdine) {
        this.numeroOrdine = numeroOrdine;
    }

    public Double getTotale() {
        return totale;
    }

    public void setTotale(Double totale) {
        this.totale = totale;
    }

    public int getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(int idUtente) {
        this.idUtente = idUtente;
    }

    public List<Integer> getIdProdotti() {
        return idProdotti;
    }

    public void setIdProdotti(List<Integer> idProdotti) {
        this.idProdotti = idProdotti;
    }

    public List<String> getNomeProdotti() {
        return nomeProdotti;
    }

    public void setNomeProdotti(List<String> nomeProdotti) {
        this.nomeProdotti = nomeProdotti;
    }

    public List<Double> getPrezziProdotti() {
        return prezziProdotti;
    }

    public void setPrezziProdotti(List<Double> prezziProdotti) {
        this.prezziProdotti = prezziProdotti;
    }

    public List<Integer> getQuantita() {
        return quantita;
    }

    public void setQuantita(List<Integer> quantita) {
        this.quantita = quantita;
    }
}
