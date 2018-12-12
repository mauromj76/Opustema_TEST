package it.logicadeisistemi.opustema.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ContoPrestito implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    
    @Column
    private String codiceCP;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCodiceCP() {
        return codiceCP;
    }

    public void setCodiceCP(String codiceCP) {
        this.codiceCP = codiceCP;
    }
    
    
}
