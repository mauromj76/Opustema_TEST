package it.logicadeisistemi.opustema.dto;

public class BeepBlueGiocaRequestDto {
    private int idp;

    public int getIdp() {
        return idp;
    }

    public void setIdp(int idp) {
        this.idp = idp;
    }

    @Override
    public String toString() {
        return "BeepBlueGiocaRequestDto{" + "idp=" + idp + '}';
    }
    
}
