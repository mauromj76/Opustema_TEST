package it.logicadeisistemi.opustema.dto;

public class BeepBluePartitaDto {
    private int numero;
    private int min;
    private int max;
    private int lastConfronto;
    private int lastTrial;

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getMin() {
        return min;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public int getLastConfronto() {
        return lastConfronto;
    }

    public void setLastConfronto(int lastConfronto) {
        this.lastConfronto = lastConfronto;
    }

    public int getLastTrial() {
        return lastTrial;
    }

    public void setLastTrial(int lastTrial) {
        this.lastTrial = lastTrial;
    }

    @Override
    public String toString() {
        return "BeepBluePartitaDto{" + "numero=" + numero + ", min=" + min + ", max=" + max + ", lastConfronto=" + lastConfronto + ", lastTrial=" + lastTrial + '}';
    }
    
    
}
