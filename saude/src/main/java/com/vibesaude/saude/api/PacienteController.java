package com.vibesaude.saude.api;

import com.vibesaude.saude.domain.dto.PacienteDTO;
import com.vibesaude.saude.domain.models.Paciente;
import com.vibesaude.saude.service.PacienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/paciente")
public class PacienteController {

    @Autowired
    PacienteService service;

    @GetMapping
    public Iterable<PacienteDTO> get(){
        return service.findAll();
    }

    @GetMapping("/{nome}")
    public Iterable<PacienteDTO> buscar(@PathVariable("nome") String nome){
        return service.search(nome);
    }

}
