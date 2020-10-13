package com.vibesaude.saude.api;


import com.vibesaude.saude.domain.models.HorarioAgendado;
import com.vibesaude.saude.service.HorarioAgendadoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/agenda")
public class HorarioAgendadoController {

    @Autowired
    private HorarioAgendadoService service;

    @PostMapping(path = "", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_JSON_VALUE })
    public HorarioAgendado save(@RequestBody HorarioAgendado horario){
        HorarioAgendado h = service.save(horario);
        return h;
    }

    @PutMapping(path = "/{id}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_JSON_VALUE })
    public HorarioAgendado update(@RequestBody HorarioAgendado horario, @PathVariable("id") long id){
        HorarioAgendado h = service.update(horario, id);
        return h;
    }

    @GetMapping("/busca")
    public Iterable<HorarioAgendado> agendados (
      @RequestParam("id") long id,
      @RequestParam("status") long status,
      @RequestParam(defaultValue = "%")  String nome,
      @RequestParam("data1") Date data1,
      @RequestParam("data2") Date data2
    ){
        return service.agendados(id, status, "%"+nome+"%", data1, data2);
    }

    @GetMapping("/{id}")
    public Optional<HorarioAgendado> getHorarioById(@PathVariable("id") long id) {
        return service.getHorarioById(id);
    }

}
