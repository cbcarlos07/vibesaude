package com.vibesaude.saude.service;

import com.vibesaude.saude.domain.models.Horario;
import com.vibesaude.saude.repository.HorarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.sql.Date;
import java.util.List;

@Service
public class HorarioService {

    @Autowired
    HorarioRepository rep;

    public List<Horario> findAll(){
        return this.rep.findAll();
    }

    public List<Horario> findByData(Date data){
        return rep.findByData( data );
    }

    public List<Horario> findByDoctor(Long id){
        return rep.findByDoctor(id);
    }
}
