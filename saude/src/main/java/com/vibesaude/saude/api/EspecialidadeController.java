package com.vibesaude.saude.api;

import com.vibesaude.saude.domain.dto.EspecialidadeDTO;
import com.vibesaude.saude.domain.models.Especialidade;
import com.vibesaude.saude.service.EspecialidadeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/especialidade")
public class EspecialidadeController {

    @Autowired
    private EspecialidadeService service;

    @GetMapping
    public Iterable<Especialidade> findAll(){
        return service.findAll();
    }

    @GetMapping("/{nome}")
    public  Iterable<EspecialidadeDTO> search(@PathVariable("nome") String nome){
        return service.search(nome);
    }


}
