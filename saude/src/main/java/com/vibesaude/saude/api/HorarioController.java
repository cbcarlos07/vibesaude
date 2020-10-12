package com.vibesaude.saude.api;


import com.vibesaude.saude.domain.models.Horario;
import com.vibesaude.saude.service.HorarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Date;


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

}
