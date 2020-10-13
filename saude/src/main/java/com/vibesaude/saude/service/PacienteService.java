package com.vibesaude.saude.service;

import com.vibesaude.saude.domain.dto.PacienteDTO;
import com.vibesaude.saude.repository.PacienteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.stream.Collectors;

@Service
public class PacienteService {
    @Autowired
    private PacienteRepository rep;

    public Iterable<PacienteDTO> findAll(){
        return rep.findAll().stream().map(PacienteDTO::create).collect(Collectors.toList());
    }

    public Iterable<PacienteDTO> search(String nome){
        return rep.findByNomeContaining(nome).stream().map(PacienteDTO::create).collect(Collectors.toList());
    }

}
