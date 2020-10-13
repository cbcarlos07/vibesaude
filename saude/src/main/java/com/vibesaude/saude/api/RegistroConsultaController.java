package com.vibesaude.saude.api;

import com.vibesaude.saude.domain.models.RegistroConsulta;
import com.vibesaude.saude.service.RegistroConsultaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/registro")
public class RegistroConsultaController {

    @Autowired
    private RegistroConsultaService service;

    @PostMapping
    public RegistroConsulta save (@RequestBody() RegistroConsulta registroConsulta){
        return service.save( registroConsulta );
    }

}
