package com.vibesaude.saude.service;

import com.vibesaude.saude.domain.models.RegistroConsulta;
import com.vibesaude.saude.repository.RegistroConsultaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegistroConsultaService {
    @Autowired
    private RegistroConsultaRepository repository;

    public RegistroConsulta save ( RegistroConsulta registroConsulta ){
        return repository.save( registroConsulta );
    }
}
