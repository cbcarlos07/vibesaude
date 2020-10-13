package com.vibesaude.saude.repository;

import com.vibesaude.saude.domain.dto.HorarioOcupadoDTO;
import com.vibesaude.saude.domain.models.Horario;
import com.vibesaude.saude.domain.models.HorarioAgendado;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.websocket.server.PathParam;
import java.sql.Date;
import java.util.List;

@Repository
public interface HorarioRepository extends JpaRepository<Horario, Long> {
    List<Horario> findByData(Date date);


    @Query(value = "select h from com.vibesaude.saude.domain.models.Horario h where h.medico.id = :id and h.data > date(now())")
    List<Horario> findByDoctor(@PathParam("id") Long id);


    @Query(value = " select ha from com.vibesaude.saude.domain.models.HorarioAgendado ha "+
            " right join ha.horario h "+
            " inner join h.medico m "+
            " inner join ha.status s "+
            " where m.id = :id"
            +" and h.data > date( now() )"
            +" and s.id = 1"
    )
    List<HorarioAgendado> findBusy(@PathParam("id") Long id);
}
