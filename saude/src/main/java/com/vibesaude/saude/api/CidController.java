package com.vibesaude.saude.api;

import com.vibesaude.saude.domain.models.Cid;
import com.vibesaude.saude.service.CidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/cid")
public class CidController {

    @Autowired
    private CidService service;

    @GetMapping
    public Iterable<Cid> findAll(){
        return service.findAll();
    }

}
