package com.vibesaude.saude.service;

import com.vibesaude.saude.domain.dto.MedicoDTO;
import com.vibesaude.saude.domain.dto.MedicoEspecialidadeDTO;
import com.vibesaude.saude.repository.MedicoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.stream.Collectors;

@Service
public class MedicoService {

    @Autowired
    MedicoRepository rep;
    public Iterable<MedicoDTO> findAll(){
        return rep.findAll().stream().map(MedicoDTO::create).collect(Collectors.toList());
    }

    public Iterable<MedicoDTO> search(String nome){
        return rep.findByNomeContaining(nome).stream().map(MedicoDTO::create).collect(Collectors.toList());
    }

    public Iterable<MedicoEspecialidadeDTO> lista(){
        return rep.findByMedicoEspecialidade();
    }

}
