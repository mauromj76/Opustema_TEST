
package it.logicadeisistemi.opustema.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ContoDeposito {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @Column
    private String codice;

    public Long getId() {
        return id;
    }

    public String getCodice() {
        return codice;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setCodice(String codice) {
        this.codice = codice;
    }
    
    
    
    
}
