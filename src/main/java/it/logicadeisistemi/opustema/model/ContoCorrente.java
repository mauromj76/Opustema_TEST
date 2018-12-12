package it.logicadeisistemi.opustema.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ContoCorrente {
    
    //Campi dell'entità
    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    private Long id;
    @Column
    private String numConto;

    //Accessori
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNumConto() {
        return numConto;
    }

    public void setNumConto(String numConto) {
        this.numConto = numConto;
    }

}
