package it.logicadeisistemi.opustema.service.impl;

import it.logicadeisistemi.opustema.dao.ClienteDao;
import it.logicadeisistemi.opustema.model.Cliente;
import it.logicadeisistemi.opustema.service.ClienteService;
import it.logicadeisistemi.spring.common.ServiceImplBase;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ClienteServiceImpl extends ServiceImplBase implements ClienteService {

    private static final Logger logger = Logger.getLogger(ClienteServiceImpl.class);

    @Autowired
    private ClienteDao clienteDao;
    

    @Override
    @Transactional
    public Cliente get(Long id) {
        Cliente aa = clienteDao.get(id);
        return aa;
    }

    @Override
    @Transactional
    public Cliente save(Cliente aula) {
        return clienteDao.save(aula);
    }

    @Override
    @Transactional
    public void deleteCliente(Long id) {
        clienteDao.deleteCliente(id);
    }

    @Override
    public List<Cliente> listAll() {
        return clienteDao.listaAll();
    }

    

   
}
