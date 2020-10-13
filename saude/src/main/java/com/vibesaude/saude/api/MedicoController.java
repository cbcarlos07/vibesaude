package com.vibesaude.saude.api;

import com.vibesaude.saude.domain.dto.MedicoDTO;
import com.vibesaude.saude.domain.dto.MedicoEspecialidadeDTO;
import com.vibesaude.saude.domain.models.Medico;
import com.vibesaude.saude.service.MedicoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/medico")
public class MedicoController {

    @Autowired
    private MedicoService service;

    @GetMapping
    public Iterable<MedicoDTO> findAll(){
        return this.service.findAll();
    }

    @GetMapping("/lista/medico")
    public Iterable<MedicoEspecialidadeDTO> lista(){
        return service.lista();
    }


    @GetMapping("/{nome}")
    public Iterable<MedicoDTO> findByName(@PathVariable("nome") String nome){
        return service.search( nome );
    }

    @GetMapping("/especialidade/{id}")
    public Iterable<Medico> findByMedicoPorEspecialidade( @PathVariable("id") long id ){
        return service.findByMedicoPorEspecialidade(id);
    }

}
