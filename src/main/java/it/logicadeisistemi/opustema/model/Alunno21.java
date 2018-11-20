package it.logicadeisistemi.opustema.model;

import java.time.LocalDate;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Alunno21 {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column
    private String nome;
    @Column
    private String cognome;
    @Column
    private LocalDate dataNascita;
    @Column
    private int numeroMatricola;

    @ManyToOne
    Classe21 classe21;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public LocalDate getDataNascita() {
        return dataNascita;
    }

    public void setDataNascita(LocalDate dataNascita) {
        this.dataNascita = dataNascita;
    }

    public Classe21 getClasse21() {
        return classe21;
    }

    public void setClasse21(Classe21 classe21) {
        this.classe21 = classe21;
    }

    @Override
    public String toString() {
        return "Alunno21{" + "id=" + id + ", nome=" + nome + ", cognome=" + cognome + ", dataNascita=" + dataNascita + ", classe21=" + classe21 + '}';
    }

}
