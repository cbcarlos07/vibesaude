package com.vibesaude.saude.service;

import com.vibesaude.saude.domain.models.HorarioAgendado;
import com.vibesaude.saude.repository.HorarioAgendadoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

@Service
public class HorarioAgendadoService {
    @Autowired
    private HorarioAgendadoRepository rep;

    public HorarioAgendado save(HorarioAgendado h){
        return rep.save(h);
    }

    public HorarioAgendado update (HorarioAgendado horario, long id){
        Optional<HorarioAgendado> optional = getHorarioById(id);
        if( optional.isPresent() ){
            HorarioAgendado h = optional.get();
            h.setPaciente( horario.getPaciente() );
            h.setHorario( h.getHorario() );
            h.setStatus( horario.getStatus() );
            h.setConfirmado( horario.getConfirmado() );
            rep.save( h );
            return h;
        }else {
            return null;
        }
    }

    public Optional<HorarioAgendado> getHorarioById(long id) {
        return rep.findById(id);
    }

    public List<HorarioAgendado> agendados (long id, long status, String nome, Date data1, Date data2){
        return rep.agendados(id, status, nome, data1, data2);
    }




}
