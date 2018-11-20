package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.dto.BeepBlueGiocaRequestDto;
import it.logicadeisistemi.opustema.dto.BeepBlueGiocaResponseDto;
import it.logicadeisistemi.opustema.dto.BeepBlueInitGameResponseDto;
import it.logicadeisistemi.opustema.dto.BeepBluePartitaDto;
import it.logicadeisistemi.opustema.dto.BeepBlueTryRequestDto;
import it.logicadeisistemi.opustema.dto.BeepBlueTryResponseDto;
import it.logicadeisistemi.opustema.service.impl.ClienteServiceImpl;
import java.util.Map;
import java.util.TreeMap;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin
@RestController
public class BeepBlueRestController {

    private static final Logger logger = Logger.getLogger(BeepBlueRestController.class);
    
    protected static Map<String, Integer> partite = new TreeMap<>();
    protected static Map<String, BeepBluePartitaDto> partite2 = new TreeMap<>();
    protected static String[] frasi = {
        "Ti vedo in difficolta' ...",
        "Non vincerai mai",
        "Ti sto distruggendo ...",
        "Non hai speranza",
        "Questo e' il meglio che sai fare?",
        "Devo chiamare uno pratico?",
        "Cambia gioco che e' meglio"
    };

    @RequestMapping(value = {"/initgame"},
            method = RequestMethod.POST)
    public BeepBlueInitGameResponseDto initGame() {
        logger.info("Sono in initGame");
        BeepBlueInitGameResponseDto res = new BeepBlueInitGameResponseDto();
        int idp = (int) (Math.random() * 1_000_000_000);
        logger.debug("idp = " + idp);
        int num = (int) (Math.random() * 100 + 1);
        logger.debug("num = " + num);
        addGame(idp, num);
        res.setIdp(idp);
        logger.debug("Exiting init res = " + res);
        return res;
    }

    @RequestMapping(value = {"/init"},
            method = RequestMethod.POST)
    public BeepBlueInitGameResponseDto init() {
        logger.info("Sono in init");
        BeepBlueInitGameResponseDto res = new BeepBlueInitGameResponseDto();
        int idp = (int) (Math.random() * 1_000_000_000);
        int num = (int) (Math.random() * 100 + 1);
        addGame2(idp, num);
        res.setIdp(idp);
        return res;
    }

    @RequestMapping(value = {"/try"},
            method = RequestMethod.POST)
    public BeepBlueTryResponseDto tryGuess(
            @RequestBody BeepBlueTryRequestDto dto) {
        logger.info("Sono in tryGuess dto:" + dto);

        BeepBlueTryResponseDto res = new BeepBlueTryResponseDto();
        Integer i = partite.get(String.valueOf(dto.getIdp()));
        if (i == null) {
            logger.warn("WARNING: Partita inesistente!" + dto);
            res.setEsito(false);
        } else {
            res.setEsito(i == dto.getNumero());
            res.setConfronto(dto.getNumero() - i);
            int frase = (int) (Math.random() * frasi.length);
            res.setMsg(frasi[frase]);
        }
        logger.info(res);
        return res;
    }

    @RequestMapping(value = {"/verifica"},
            method = RequestMethod.POST)
    public BeepBlueTryResponseDto verifica(
            @RequestBody BeepBlueTryRequestDto dto) {
        logger.info("Sono in verifica dto:" + dto);

        BeepBlueTryResponseDto res = new BeepBlueTryResponseDto();
        BeepBluePartitaDto px
                = partite2.get(String.valueOf(dto.getIdp()));
        if (px == null) {
            logger.warn("WARNING: Partita inesistente!" + dto);
            res.setEsito(false);
        } else {
            res.setEsito(px.getNumero() == dto.getS());
            res.setConfronto(dto.getS() - px.getNumero());
            px.setLastConfronto(dto.getRisp());
        }
        logger.debug(res);
        return res;
    }

    @RequestMapping(value = {"/giocabb"},
            method = RequestMethod.POST)
    public BeepBlueGiocaResponseDto giocaBB(
            @RequestBody BeepBlueGiocaRequestDto dto) {
        logger.info("Sono in giocaBB dto:" + dto);

        BeepBlueGiocaResponseDto res = new BeepBlueGiocaResponseDto();
        BeepBluePartitaDto px = partite2.get(String.valueOf(dto.getIdp()));
        logger.info(px);
        if (px == null) {
            logger.debug("WARNING: Partita inesistente!" + dto);
            res.setT(0);
        } else if (px.getLastConfronto() > 0) {
            int num = (px.getMax() - px.getLastTrial()) / 2 + px.getLastTrial();
            res.setT(num);
            px.setMin(px.getLastTrial());
            px.setLastTrial(num);
        } else if (px.getLastConfronto() < 0) {
            int num = (px.getLastTrial() - px.getMin()) / 2 + px.getMin();
            res.setT(num);
            px.setMax(px.getLastTrial());
            px.setLastTrial(num);
        } else {
            res.setT(px.getLastTrial());
            px.setLastTrial(0);
        }

        logger.debug(res);
        return res;
    }

    protected static synchronized void addGame(int idp, int numero) {
        logger.info("Aggiunto a partite: " + idp + "; numero: " + numero);
        partite.put(String.valueOf(idp), numero);
    }

    protected static synchronized void addGame2(int idp, int numero) {
        logger.info("Aggiunto a partite2: " + idp + "; numero: " + numero);
        if (partite2.get(String.valueOf(idp)) != null){
            logger.warn("ID partita duplicato! idp = " + idp);
        }
        BeepBluePartitaDto partita = new BeepBluePartitaDto();
        partita.setMax(100);
        partita.setMin(1);
        partita.setNumero(numero);
        partita.setLastConfronto(1);
        partita.setLastTrial(0);
        partite2.put(String.valueOf(idp), partita);
        logger.debug("exiting addGame2. partita = " + partita);
    }

}
