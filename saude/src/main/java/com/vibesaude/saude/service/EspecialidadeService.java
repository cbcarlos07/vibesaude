package com.vibesaude.saude.service;

import com.vibesaude.saude.domain.models.Especialidade;
import com.vibesaude.saude.repository.EspecialidadeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EspecialidadeService {
    @Autowired
    EspecialidadeRepository rep;

    public Iterable<Especialidade> findAll(){
        return rep.findAll();
    }

}
