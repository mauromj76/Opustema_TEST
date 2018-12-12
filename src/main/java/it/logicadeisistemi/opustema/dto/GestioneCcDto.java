package it.logicadeisistemi.opustema.dto;

import javax.persistence.Entity;

public class GestioneCcDto {

    private String idCcAttuale;
    private String idCcNuovo;

    public GestioneCcDto() {
    }

    public GestioneCcDto(String idCcAttuale, String idCcNuovo) {
        this.idCcAttuale = idCcAttuale;
        this.idCcNuovo = idCcNuovo;
    }

    public String getIdCcAttuale() {
        return idCcAttuale;
    }

    public void setIdCcAttuale(String idCcAttuale) {
        this.idCcAttuale = idCcAttuale;
    }

    public String getIdCcNuovo() {
        return idCcNuovo;
    }

    public void setIdCcNuovo(String idCcNuovo) {
        this.idCcNuovo = idCcNuovo;
    }
}
