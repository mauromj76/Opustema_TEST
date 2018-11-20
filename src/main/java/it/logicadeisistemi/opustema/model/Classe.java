package it.logicadeisistemi.opustema.model;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Classe {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Long id;
    @Column
    String codice;
    
    @OneToMany (mappedBy = "classe")
    List<Alunno> alunni;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCodice() {
        return codice;
    }

    public void setCodice(String codice) {
        this.codice = codice;
    }

    public List<Alunno> getAlunni() {
        return alunni;
    }

    public void setAlunni(List<Alunno> alunni) {
        this.alunni = alunni;
    }
    
    
}
