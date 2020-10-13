package com.vibesaude.saude.api;


import com.vibesaude.saude.domain.dto.HorarioOcupadoDTO;
import com.vibesaude.saude.domain.models.Horario;
import com.vibesaude.saude.domain.models.HorarioAgendado;
import com.vibesaude.saude.service.HorarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/horario")
public class HorarioController {

    @Autowired
    HorarioService service;

    @GetMapping
    public Iterable<Horario> findAll(){
        return service.findAll();
    }

    @GetMapping("/{data}")
    public Iterable<Horario> findByData(@PathVariable("data") Date data){
        return service.findByData( data );
    }

    @GetMapping("/doctor/{id}")
    public Iterable<Horario> findByDoctor(@PathVariable("id") Long id ){
        return service.findByDoctor(id);
    }

    @GetMapping("/busy/{id}")
    public Iterable<HorarioAgendado> findBusy(@PathVariable("id") Long id){
        return service.findBusy( id );
    }

}
