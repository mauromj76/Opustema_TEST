package it.logicadeisistemi.opustema.dto;

public class BeepBlueTryResponseDto {
    Boolean esito;
    Integer confronto;
    String msg;
    Boolean baro;

    public Boolean getBaro() {
        return baro;
    }

    public void setBaro(Boolean baro) {
        this.baro = baro;
    }
    

    public Boolean getEsito() {
        return esito;
    }

    public void setEsito(Boolean esito) {
        this.esito = esito;
    }

    @Override
    public String toString() {
        return "BeepBlueTryResponseDto{" + "esito=" + esito + ", confronto=" + confronto + ", msg=" + msg + ", baro=" + baro + '}';
    }



    public Integer getConfronto() {
        return confronto;
    }

    public void setConfronto(Integer confronto) {
        this.confronto = confronto;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
    
    
    
}
