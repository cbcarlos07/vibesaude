package com.vibesaude.saude.service;

import com.vibesaude.saude.domain.dto.EspecialidadeDTO;
import com.vibesaude.saude.domain.models.Especialidade;
import com.vibesaude.saude.repository.EspecialidadeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class EspecialidadeService {
    @Autowired
    EspecialidadeRepository rep;

    public Iterable<Especialidade> findAll(){
        return rep.findAll();
    }

    public List<EspecialidadeDTO> search(String nome){
        return rep.findByDescricaoContaining(nome).stream().map(EspecialidadeDTO::create).collect(Collectors.toList());
    }

}
