package com.vibesaude.saude.service;

import com.vibesaude.saude.domain.models.Cid;
import com.vibesaude.saude.repository.CIDRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CidService {

    @Autowired
    private CIDRepository rep;

    public List<Cid> findAll(  ){
        return rep.findAll();
    }

}
