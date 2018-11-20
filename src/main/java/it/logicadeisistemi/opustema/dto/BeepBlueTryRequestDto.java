package it.logicadeisistemi.opustema.dto;

public class BeepBlueTryRequestDto {
    private int numero;
    private int idp;
    private int s;
    private int risp;

    public int getS() {
        return s;
    }

    public void setS(int s) {
        this.s = s;
    }

    public int getRisp() {
        return risp;
    }

    public void setRisp(int risp) {
        this.risp = risp;
    }
    
    

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getIdp() {
        return idp;
    }

    public void setIdp(int idp) {
        this.idp = idp;
    }

    @Override
    public String toString() {
        return "BeepBlueTryRequestDto{" + "numero=" + numero + ", idp=" + idp + ", s=" + s + ", risp=" + risp + '}';
    }
}
    
    
    
